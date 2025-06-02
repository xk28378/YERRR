######################################################################
# This file copyright the Georgia Institute of Technology
#
# Permission is given to students to use or modify this file (only)
# to work on their assignments.
#
# You may NOT publish this file or make it available to others not in
# the course.
#
######################################################################

import math

# If you see different scores locally and on Gradescope this may be an indication
# that you are uploading a different file than the one you are executing locally.
# If this local ID doesn't match the ID on Gradescope then you uploaded a different file.
OUTPUT_UNIQUE_FILE_ID = False
if OUTPUT_UNIQUE_FILE_ID:
    import hashlib, pathlib

    file_hash = hashlib.md5(pathlib.Path(__file__).read_bytes()).hexdigest()
    print(f'Unique file ID: {file_hash}')


MOVES = {
        'n': (-1, 0),
        's': (1, 0),
        'e': (0, 1),
        'w': (0, -1),
        'ne': (-1, 1),
        'nw': (-1, -1),
        'se': (1, 1),
        'sw': (1, -1)
    }
COST = {
    'n': 2,
    's': 2,
    'e': 2,
    'w': 2,
    'ne': 3,
    'nw': 3,
    'se': 3,
    'sw': 3
    }

class DeliveryPlanner_PartA:
    """
    Note: All print outs must be conditioned on the debug parameter.

    Required methods in this class are:

      plan_delivery(self, debug = False):
       Stubbed out below.  You may not change the method signature
        as it will be called directly by the autograder but you
        may modify the internals as needed.

      __init__:
        Required to initialize the class.  Signature can NOT be changed.
        Basic template starter code is provided.  You may choose to
        use this starter code or modify and replace it based on
        your own solution.
    """

    def __init__(self, warehouse_viewer, dropzone_location, todo, box_locations):

        self.warehouse_viewer = warehouse_viewer
        self.dropzone_location = dropzone_location
        self.todo = todo
        self.box_locations = box_locations

        # You may use these symbols indicating direction for visual debugging
        # ['^', '<', 'v', '>', '\\', '/', '[', ']']
        # or you may choose to use arrows instead
        # ['🡑', '🡐', '🡓', '🡒',  '🡔', '🡕', '🡖', '🡗']

    def plan_delivery(self, debug=False):
        """
        plan_delivery() is required and will be called by the autograder directly.
        You may not change the function signature for it.
        All print outs must be conditioned on the debug flag.
        """
        # print("dorpzone_location: ", self.dropzone_location)
        # print("todo: ", self.todo)
        # print("box_locations: ", self.box_locations)
        
        curr_loc = self.dropzone_location
        uncollected_boxes = [box for box in self.todo]
        moves = []
        print("init_loc: ", curr_loc)
        for box in self.todo:
            print("**********FOR BOX ", box, "**********")
            box_loc = self.box_locations[box]
            new_curr_loc, path = find_path(curr_loc, box_loc, self.warehouse_viewer, uncollected_boxes)
            if path is not None:
                for move in path:
                    moves.append('move ' + move)
            if new_curr_loc is not None:
                curr_loc = new_curr_loc
            moves.append('lift ' + box)
            uncollected_boxes.pop(0)
            print("curr_loc: ", curr_loc)
            print("path: ", path)
            #TODO: THIS NEEDS TO JUST RETRASE THE PATH TO THE DROPZONE *****
            # ***** ONLY SHOULD FIND PATH TO DROPZONE AGAIN IF THE ORIGINAL PATH IS NONE *****
            new_curr_loc, path = find_path(curr_loc, self.dropzone_location, self.warehouse_viewer, uncollected_boxes)
            if path is not None:
                for move in path:
                    moves.append('move ' + move)
            if new_curr_loc is not None:
                curr_loc = new_curr_loc
            moves.append('down ' + direction_to_drop(curr_loc, self.dropzone_location))
            print("curr_loc: ", curr_loc)
            print("path: ", path)
            
        
        print("moves: ", moves)
            

        # The following is the hard coded solution to test case 1
        # moves = ['move w',
        #          'move nw',
        #          'lift 1',
        #          'move se',
        #          'down e',
        #          'move ne',
        #          'lift 2',
        #          'down s']

        if debug:
            for i in range(len(moves)):
                print(moves[i])

        return moves


class DeliveryPlanner_PartB:
    """
    Note: All print outs must be conditioned on the debug parameter.

    Required methods in this class are:

        generate_policies(self, debug = False):
         Stubbed out below. You may not change the method signature
         as it will be called directly by the autograder but you
         may modify the internals as needed.

        __init__:
         Required to initialize the class.  Signature can NOT be changed.
         Basic template starter code is provided.  You may choose to
         use this starter code or modify and replace it based on
         your own solution.

    The following method is starter code you may use.
    However, it is not required and can be replaced with your
    own method(s).

        _set_initial_state_from(self, warehouse):
         creates structures based on the warehouse map

    """

    def __init__(self, warehouse, warehouse_cost, todo):

        self._set_initial_state_from(warehouse)
        self.warehouse_cost = warehouse_cost
        self.todo = todo

        # You may use these symbols indicating direction for visual debugging
        # ['^', '<', 'v', '>', '\\', '/', '[', ']']
        # or you may choose to use arrows instead
        # ['🡑', '🡐', '🡓', '🡒',  '🡔', '🡕', '🡖', '🡗']

    def _set_initial_state_from(self, warehouse):
        """Set initial state.

        Args:
            warehouse(list(list)): the warehouse map.
        """
        rows = len(warehouse)
        cols = len(warehouse[0])

        self.warehouse_state = [[None for j in range(cols)] for i in range(rows)]
        self.dropzone = None
        self.boxes = dict()

        for i in range(rows):
            for j in range(cols):
                this_square = warehouse[i][j]

                if this_square == '.':
                    self.warehouse_state[i][j] = '.'

                elif this_square == '#':
                    self.warehouse_state[i][j] = '#'

                elif this_square == '@':
                    self.warehouse_state[i][j] = '@'
                    self.dropzone = (i, j)

                else:  # a box
                    box_id = this_square
                    self.warehouse_state[i][j] = box_id
                    self.boxes[box_id] = (i, j)

    def generate_policies(self, debug=False):
        """
        generate_policies() is required and will be called by the autograder directly.
        You may not change the function signature for it.
        All print outs must be conditioned on the debug flag.
        """

        # The following is the hard coded solution to test case 1
        to_box_policy = [['B', 'lift 1', 'move w'],
                  ['lift 1', '-1', 'move nw'],
                  ['move n', 'move nw', 'move n']]

        deliver_policy = [['move e', 'move se', 'move s'],
                  ['move ne', '-1', 'down s'],
                  ['move e', 'down e', 'move n']]

        if debug:
            print("\nTo Box Policy:")
            for i in range(len(to_box_policy)):
                print(to_box_policy[i])

            print("\nDeliver Policy:")
            for i in range(len(deliver_policy)):
                print(deliver_policy[i])

        return (to_box_policy, deliver_policy)


class DeliveryPlanner_PartC:
    """
    [Doc string same as part B]
    Note: All print outs must be conditioned on the debug parameter.

    Required methods in this class are:

        generate_policies(self, debug = False):
         Stubbed out below. You may not change the method signature
         as it will be called directly by the autograder but you
         may modify the internals as needed.

        __init__:
         Required to initialize the class.  Signature can NOT be changed.
         Basic template starter code is provided.  You may choose to
         use this starter code or modify and replace it based on
         your own solution.

    The following method is starter code you may use.
    However, it is not required and can be replaced with your
    own method(s).

        _set_initial_state_from(self, warehouse):
         creates structures based on the warehouse map

    """

    def __init__(self, warehouse, warehouse_cost, todo, stochastic_probabilities):

        self._set_initial_state_from(warehouse)
        self.warehouse_cost = warehouse_cost
        self.todo = todo
        self.stochastic_probabilities = stochastic_probabilities

        # You may use these symbols indicating direction for visual debugging
        # ['^', '<', 'v', '>', '\\', '/', '[', ']']
        # or you may choose to use arrows instead
        # ['🡑', '🡐', '🡓', '🡒',  '🡔', '🡕', '🡖', '🡗']

    def _set_initial_state_from(self, warehouse):
        """Set initial state.

        Args:
            warehouse(list(list)): the warehouse map.
        """
        rows = len(warehouse)
        cols = len(warehouse[0])

        self.warehouse_state = [[None for j in range(cols)] for i in range(rows)]
        self.dropzone = None
        self.boxes = dict()

        for i in range(rows):
            for j in range(cols):
                this_square = warehouse[i][j]

                if this_square == '.':
                    self.warehouse_state[i][j] = '.'

                elif this_square == '#':
                    self.warehouse_state[i][j] = '#'

                elif this_square == '@':
                    self.warehouse_state[i][j] = '@'
                    self.dropzone = (i, j)

                else:  # a box
                    box_id = this_square
                    self.warehouse_state[i][j] = box_id
                    self.boxes[box_id] = (i, j)

    def generate_policies(self, debug=False):
        """
        generate_policies() is required and will be called by the autograder directly.
        You may not change the function signature for it.
        All print outs must be conditioned on the debug flag.
        """

        # The following is the hard coded solution to test case 1
        to_box_policy = [
            ['B', 'lift 1', 'move w'],
            ['lift 1', -1, 'move nw'],
            ['move n', 'move nw', 'move n'],
        ]

        to_zone_policy = [
            ['move e', 'move se', 'move s'],
            ['move se', -1, 'down s'],
            ['move e', 'down e', 'move n'],
        ]

        if debug:
            print("\nTo Box Policy:")
            for i in range(len(to_box_policy)):
                print(to_box_policy[i])

            print("\nTo Zone Policy:")
            for i in range(len(to_zone_policy)):
                print(to_zone_policy[i])

        # For debugging purposes you may wish to return values associated with each policy.
        # Replace the default values of None with your grid of values below and turn on the
        # VERBOSE_FLAG in the testing suite.
        to_box_values = None
        to_zone_values = None
        return (to_box_policy, to_zone_policy, to_box_values, to_zone_values)


def who_am_i():
    # Please specify your GT login ID in the whoami variable (ex: jsmith125).
    whoami = 'nnegash6'
    return whoami

def find_path(init_loc, box_loc, vewier, boxes, debug=False):
    queue = []
    visited = set(init_loc)
    expanded = {}
    queue.append((0 + euclidean_distance(init_loc, box_loc), 0, init_loc[0], init_loc[1]))
    
    while len(queue) > 0:
        queue.sort()
        f, cost, x, y = queue.pop(0)
        for move, delta in MOVES.items():
            new_x, new_y = x + delta[0], y + delta[1]
            if (new_x, new_y) == box_loc:
                return (x,y), calculate_path(expanded, (x,y), init_loc)
            if (new_x, new_y) not in visited and vewier[new_x][new_y] not in  ['#'] + boxes:
                if expanded.get((new_x, new_y)) is None:
                    expanded[(new_x, new_y)] = move
                visited.add((new_x, new_y))
                queue.append((cost + COST[move] + euclidean_distance((new_x, new_y), box_loc), cost + COST[move], new_x, new_y))
    return None, None

def calculate_path(expanded, curr_loc, init_loc):
    print("expanded: ", expanded)
    path = []
    curr = curr_loc
    while curr_loc != init_loc:
        path.append(expanded[curr_loc])
        curr_loc = get_prev_loc(curr_loc, expanded[curr_loc])
    path.reverse()
    # print("path: ", path)
    return path

def get_prev_loc(curr_loc, move):
    reverse = {
        'n': 's',
        's': 'n',
        'e': 'w',
        'w': 'e',
        'ne': 'sw',
        'nw': 'se',
        'se': 'nw', 
        'sw': 'ne'
    }
    new_x, new_y = curr_loc[0] + MOVES[reverse[move]][0], curr_loc[1] + MOVES[reverse[move]][1]
    return (new_x, new_y)

def direction_to_drop(curr_loc, dropzone):
    for move, delta in MOVES.items():
        new_x, new_y = curr_loc[0] + delta[0], curr_loc[1] + delta[1]
        if (new_x, new_y) == dropzone:
            return move

def euclidean_distance(loc1, loc2):
    return math.sqrt((loc1[0] - loc2[0]) ** 2 + (loc1[1] - loc2[1]) ** 2)
    # return abs(loc1[0] - loc2[0]) + abs(loc1[1] - loc2[1])

if __name__ == "__main__":
    """
    You may execute this file to develop and test the search algorithm prior to running
    the delivery planner in the testing suite.  Copy any test cases from the
    testing suite or make up your own.
    Run command:  python warehouse.py
    """

    # Test code in here will NOT be called by the autograder
    # This section is just a provided as a convenience to help in your development/debugging process

    # Testing for Part A
    print('\n~~~ Testing for part A: ~~~\n')

    from testing_suite_partA import wrap_warehouse_object, Counter

    # test case data starts here
    # testcase 1
    warehouse = [
        '######',
        '#....#',
        '#.1#2#',
        '#..#.#',
        '#...@#',
        '######',
    ]
    todo = list('12')
    benchmark_cost = 23
    viewed_cell_count_threshold = 20
    dropzone = (4,4)
    box_locations = {
        '1': (2,2),
        '2': (2,4),
    }
    # test case data ends here

    viewed_cells = Counter()
    warehouse_access = wrap_warehouse_object(warehouse, viewed_cells)
    partA = DeliveryPlanner_PartA(warehouse_access, dropzone, todo, box_locations)
    partA.plan_delivery(debug=True)
    # Note that the viewed cells for the hard coded solution provided
    # in the initial template code will be 0 because no actual search
    # process took place that accessed the warehouse
    print('Viewed Cells:', len(viewed_cells))
    print('Viewed Cell Count Threshold:', viewed_cell_count_threshold)

    # Testing for Part B
    # testcase 1
    print('\n~~~ Testing for part B: ~~~')
    warehouse = ['1..',
                 '.#.',
                 '..@']

    warehouse_cost = [[3, 5, 2],
                      [10, math.inf, 2],
                      [2, 10, 2]]

    todo = ['1']

    partB = DeliveryPlanner_PartB(warehouse, warehouse_cost, todo)
    partB.generate_policies(debug=True)

    # Testing for Part C
    # testcase 1
    print('\n~~~ Testing for part C: ~~~')
    warehouse = ['1..',
                 '.#.',
                 '..@']

    warehouse_cost = [[13, 5, 6],
                      [10, math.inf, 2],
                      [2, 11, 2]]

    todo = ['1']

    stochastic_probabilities = {
        'as_intended': .70,
        'slanted': .1,
        'sideways': .05,
    }

    partC = DeliveryPlanner_PartC(warehouse, warehouse_cost, todo, stochastic_probabilities)
    partC.generate_policies(debug=True)

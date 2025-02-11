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

# If you see different scores locally and on Gradescope this may be an
# indication that you are uploading a different file than the one you are
# executing locally. If this local ID doesn't match the ID on Gradescope then
# you uploaded a different file.
from rait import matrix
import copy
import math
OUTPUT_UNIQUE_FILE_ID = False
if OUTPUT_UNIQUE_FILE_ID:
    import hashlib, pathlib
    file_hash = hashlib.md5(pathlib.Path(__file__).read_bytes()).hexdigest()
    print(f'Unique file ID: {file_hash}')


class Spaceship():
    """The Spaceship to guide across the galaxy."""

    def __init__(self, bounds, xy_start):
        """Initialize the Spaceship."""
        self.x_bounds = bounds['x']
        self.y_bounds = bounds['y']
        print("x_bounds:", self.x_bounds)
        self.agent_pos_start = xy_start
        self.states = {}
        self.Ps = {}
        self.time = 0
        self.constant_P = matrix([[100., 0, 0, 0, 0, 0], [0, 100., 0, 0, 0, 0],[0, 0, 100., 0, 0, 0],[0, 0, 0, 100., 0, 0],[0, 0, 0, 0, 100., 0],[0, 0, 0, 0, 0, 100.]])  # initial uncertainty
        self.F = matrix([[1., 0, 1., 0, 0.5, 0], [0, 1., 0, 1., 0, 0.5],[0, 0, 1., 0, 1., 0],[0, 0, 0, 1., 0, 1.],[0, 0, 0, 0, 1., 0],[0, 0, 0, 0, 0, 1.]])  # next state function
        self.H = matrix([[1., 0, 0, 0, 0, 0], [0, 1., 0, 0, 0, 0]])  # measurement function
        self.R = matrix([[0.045, 0], [0, 0.075]])  # measurement uncertainty
        self.I = matrix([[1., 0, 0, 0, 0, 0], [0, 1., 0, 0, 0, 0],[0, 0, 1., 0, 0, 0],[0, 0, 0, 1., 0, 0],[0, 0, 0, 0, 1., 0],[0, 0, 0, 0, 0, 1.]])  # identity matrix


    def predict_from_observations(self, asteroid_observations):
        """Observe asteroid locations and predict their positions at time t+1.
        Parameters
        ----------
        self = a reference to the current object, the Spaceship
        asteroid_observations = A dictionary in which the keys represent asteroid IDs
        and the values are a dictionary of noisy x-coordinate observations,
        and noisy y-coordinate observations taken at time t.
        asteroid_observations format:
        ```
        `{1: (x-measurement, y-measurement),
          2: (x-measurement, y-measurement)...
          100: (x-measurement, y-measurement),
          }`
        ```

        Returns
        -------
        The output of the `predict_from_observations` function should be a dictionary of tuples
        of estimated asteroid locations one timestep into the future
        (i.e. the inputs are for measurements taken at time t, and you return where the asteroids will be at time t+1).

        A dictionary of tuples containing i: (x, y), where i, x, and y are:
        i = the asteroid's ID
        x = the estimated x-coordinate of asteroid i's position for time t+1
        y = the estimated y-coordinate of asteroid i's position for time t+1
        Return format:
        `{1: (x-coordinate, y-coordinate),
          2: (x-coordinate, y-coordinate)...
          100: (x-coordinate, y-coordinate)
          }`
        """
        # To view the visualization with the default pdf output (incorrect) uncomment the line below
        # return asteroid_observations

        # FOR STUDENT TODO: Update the Spaceship's estimate of where the asteroids will be located in the next time step
        updated_asteroid_positions = {}
        for asteroid_id, (x, y) in asteroid_observations.items():
            if asteroid_id not in self.states:
                self.states[asteroid_id] = matrix([[x], [y], [0], [0], [0], [0]])
                self.Ps[asteroid_id] = copy.deepcopy(self.constant_P)
          # observation update
            Z = matrix([[x], [y]])
            delta_z = Z - (self.H * self.states[asteroid_id])
            S = (self.H * self.Ps[asteroid_id] * self.H.transpose()) + self.R
            K = self.Ps[asteroid_id] * self.H.transpose() * S.inverse()
            x_squared = delta_z.transpose() * S.inverse() * delta_z
            # print("x_aqaured:", x_squared)
            self.states[asteroid_id] = self.states[asteroid_id] + (K * delta_z)
            self.Ps[asteroid_id] = (self.I - (K * self.H)) * self.Ps[asteroid_id]
          
            # prediction
            self.states[asteroid_id] = (self.F * self.states[asteroid_id])
            self.Ps[asteroid_id] = (self.F * self.Ps[asteroid_id] * self.F.transpose())
            updated_asteroid_positions[asteroid_id] = (self.states[asteroid_id].value[0][0], self.states[asteroid_id].value[1][0])
        # print(self.states)
        # for asteroid_id, (x, y) in updated_asteroid_positions.items():
        # print("asteroid_id:", 1, "x:", x, "y:", y)
        # print("state:", self.states[1])
        # print("P:", self.Ps[1])
        return updated_asteroid_positions

    def jump(self, asteroid_observations, agent_data):
        """ Return the id of the asteroid the spaceship should jump/hop onto in the next timestep
        ----------
        self = a reference to the current object, the Spaceship
        asteroid_observations: Same as predict_from_observations method
        agent_data: a dictionary containing agent related data:
        'jump_distance' - a float representing agent jumping distance,
        'ridden_asteroid' - an int representing the ID of the ridden asteroid if available, None otherwise.
        Note: 'agent_pos_start' - A tuple representing the (x, y) position of the agent at t=0 is available in the constructor.

        agent_data format:
        {'ridden_asteroid': None,
         'jump_distance': agent.jump_distance,
         }
        Returns
        -------
        You are to return two items.
        1: idx, this represents the ID of the asteroid on which to jump if a jump should be performed in the next timestep.
        Return None if you do not intend to jump on an asteroid in the next timestep
        2. Return the estimated positions of the asteroids (i.e. the output of 'predict_from_observations method)
        IFF you intend to have them plotted in the visualization. Otherwise return None
        -----
        an example return
        idx to hop onto in the next timestep: 3,
        estimated_results = {1: (x-coordinate, y-coordinate),
          2: (x-coordinate, y-coordinate)}

        return 3, estimated_return

        """
        # FOR STUDENT TODO: Update the idx of the asteroid on which to jump
        print("time:", self.time)
        self.time += 1
        if self.states.keys() == 0:
            return None, None
        pervious_asteroid_observations = copy.deepcopy(self.states)
        updated_asteroid_positions = self.predict_from_observations(asteroid_observations)
        
        asteroids_moving_up = []
        for asteroid_id, (x, y) in updated_asteroid_positions.items():
          # print("asteroid_id:", asteroid_id)
          # print("previous_asteroid_observations:", pervious_asteroid_observations[asteroid_id])
          if asteroid_id not in pervious_asteroid_observations or self.Ps[asteroid_id].value[0][0] > .1 or self.Ps[asteroid_id].value[1][1] > .1:
            continue
          prev_pos = self.state_to_tuple(pervious_asteroid_observations[asteroid_id])
          if self.is_astroid_moving_up(prev_pos, updated_asteroid_positions[asteroid_id]):
            asteroids_moving_up.append(asteroid_id)
        print("asteroids_moving_up:", asteroids_moving_up)
        reachable_asteroids = []
        currPos = self.agent_pos_start if agent_data['ridden_asteroid'] is None else self.state_to_tuple(pervious_asteroid_observations[agent_data['ridden_asteroid']])
        print("currPos:", currPos)
        if len(asteroids_moving_up) == 0:
            return None, updated_asteroid_positions
        else:
          for asteroid_id in asteroids_moving_up:
            if self.is_astroid_reachable(currPos, updated_asteroid_positions[asteroid_id], agent_data['jump_distance']) and asteroid_id != agent_data['ridden_asteroid']:
              # print("distance to asteroid", asteroid_id, ":", self.get_distance(currPos, updated_asteroid_positions[asteroid_id]))
              # print("previous_asteroid_observations:", pervious_asteroid_observations[asteroid_id])
              # print("locaiton of asteroid", asteroid_id, ":", updated_asteroid_positions[asteroid_id])
              reachable_asteroids.append(asteroid_id)
              print("asteroid_id:", asteroid_id, "angle:", self.get_angle(currPos, updated_asteroid_positions[asteroid_id]))
        print("reachable_asteroids:", reachable_asteroids)
        if len(reachable_asteroids) == 0:
          return None, updated_asteroid_positions
        
        reachable_asteroids.sort(reverse=True, key=lambda x: self.get_distance(currPos, updated_asteroid_positions[x]))
        
        if agent_data['ridden_asteroid'] is None:
          return reachable_asteroids[0], updated_asteroid_positions
        
        currSide = self.getSide(currPos)
        currAngle = self.get_angle(currPos, updated_asteroid_positions[agent_data['ridden_asteroid']])
        if currAngle < 0:
          currAngle += 2 * math.pi
        print("currAngle:", currAngle)
        print("currSide:", currSide)

        if self.should_be_good_for_goal(currPos, currAngle):
          print("*************************************Should be good for goal*************************************")
          return None, updated_asteroid_positions
       
        if currAngle == math.pi/2:
          return None, updated_asteroid_positions
        
        if currSide == 'left':
          # if the asteroid is to the left and it's moving to the right, stay on it
          if currAngle < math.pi/2:
            return None, updated_asteroid_positions
          else: 
            right_moving_asteroids = []
            for asteroid_id in reachable_asteroids:
              # print("asteriod_id:", asteroid_id, "angle:", self.get_angle(currPos, updated_asteroid_positions[asteroid_id]))
              if self.get_angle(self.state_to_tuple(pervious_asteroid_observations[asteroid_id]), updated_asteroid_positions[asteroid_id]) < math.pi/2 and currPos[1] < updated_asteroid_positions[asteroid_id][1] and currPos[1] < asteroid_observations[asteroid_id][1]:
                right_moving_asteroids.append(asteroid_id)
            if len(right_moving_asteroids) == 0:
              return None, updated_asteroid_positions
            right_moving_asteroids.sort(reverse=True, key=lambda x: self.get_distance(currPos, updated_asteroid_positions[x]))
            return right_moving_asteroids[0], updated_asteroid_positions
        else:
          # if the asteroid is to the right and it's moving to the left, stay on it
          if currAngle > math.pi/2:
            return None, updated_asteroid_positions
          else: 
            left_moving_asteroids = []
            for asteroid_id in reachable_asteroids:
              if self.get_angle(self.state_to_tuple(pervious_asteroid_observations[asteroid_id]), updated_asteroid_positions[asteroid_id]) > math.pi/2 and currPos[1] < updated_asteroid_positions[asteroid_id][1]:
                left_moving_asteroids.append(asteroid_id)
            print("left_moving_asteroids:", left_moving_asteroids)
            if len(left_moving_asteroids) == 0:
              return None, updated_asteroid_positions
            left_moving_asteroids.sort(reverse=True, key=lambda x: self.get_distance(currPos, updated_asteroid_positions[x]))
            return left_moving_asteroids[0], updated_asteroid_positions
      
    def is_astroid_moving_up(self, start_pos, end_pos):
        angle = self.get_angle(start_pos, end_pos)
        return angle > 0 and angle < math.pi
      
    def is_astroid_reachable(self, start_pos, end_pos, jump_distance):
        distance = self.get_distance(start_pos, end_pos)
        return distance < (jump_distance *.70)
    def get_angle(self, start_pos, end_pos):
        return math.atan2(end_pos[1] - start_pos[1], end_pos[0] - start_pos[0])
      
    def state_to_tuple(self, state):
        return (state.value[0][0], state.value[1][0])
    
    def get_distance(self, start_pos, end_pos):
        return math.sqrt((end_pos[0] - start_pos[0])**2 + (end_pos[1] - start_pos[1])**2)
      
    def getSide(self, pos):
      half = self.x_bounds[1] / 2
      if pos[0] > half:
        return 'right'
      return 'left'
    
    def should_be_good_for_goal(self, pos, angle):
      m = math.tan(angle)
      expected_x_at_goal = ((self.y_bounds[1] - pos[1]) / m) + pos[0]
      return expected_x_at_goal < self.x_bounds[1] and expected_x_at_goal > self.x_bounds[0]

def who_am_i():
    # Please specify your GT login ID in the whoami variable (ex: jsmith125).
    whoami = 'nnegash6'
    return whoami

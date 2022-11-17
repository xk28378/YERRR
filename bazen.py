"""
File:        
Author:      
Date:        
Section:     
E-mail:     
Description: 
"""

class Game:
    def __init__(self):
        self.order = []
        self.station_list = []
        self.train_dict = {}
        self.connections_dict = {}
        self.metro_dict = {"stations": self.station_list, "trains": self.train_dict, "connections": self.connections_dict}


    def create_station(self, station_name):
        isFound = False

        for i in range(len(self.station_list)):
            if self.station_list[i] == station_name:
                isFound = True

        if isFound != True:
            self.station_list.append(station_name)


    def connect_stations(self, first_station, second_station, line_name):
        find_line_name = False

        for key in self.connections_dict:
            if key == line_name:
                find_line_name = True

        if not find_line_name:
            find_first_station = False
            find_second_station = False

            for i in range(len(self.station_list)):
                if self.station_list[i] == first_station:
                    find_first_station = True 
                elif self.station_list[i] == second_station:
                    find_second_station = True

            if find_first_station and find_second_station:
                self.connections_dict[line_name] = []
                self.connections_dict[line_name].append([first_station, second_station])
            elif find_first_station and not find_second_station:
                print("Station", second_station, "was not created.")
            else:
                print("Station", first_station, "was not created")
        else:
            print("Line name", line_name, "was found")
            for key in self.connections_dict:
                # print(self.connections_dict)
                if key == line_name:
                    self.connections_dict[line_name].append([first_station, second_station])

    def get_trip(self,start,end,visited):
        nexts = []
        lines = self.connections_dict.keys()
        for line in lines:
            for connection in self.connections_dict[line]:
                if connection[0] == start and not connection[1] in visited.keys():
                    nexts.append(connection[1])
                    visited[connection[1]] = True
                elif connection[1] == start and not connection[0] in visited.keys():
                    nexts.append(connection[0])
                    visited[connection[0]] = True
        
        for follow in nexts:
            if follow == end:
                self.order.append(follow)
                return True
            if self.get_trip(follow,end,visited):
                self.order.append(follow)
                return True
        return False

    def plan_trip(self, starting_station, ending_station):
        self.get_trip(starting_station,ending_station,{starting_station: True})
        self.order.append(starting_station)
        self.order.reverse()
        line = self.get_line(self.order[0],self.order[1])
        print("Starting on line", line,"->", self.order[0], "->", end=" ")
        for i in range(1,len(self.order)):
            newline = self.get_line(self.order[i-1],self.order[i])
            if newline != line:
                print("Switch to line", newline, "->", self.order[i-1], "->", end = " ")
                line = newline
            if i == len(self.order)-1:
                print(self.order[i])
            else:
                print(self.order[i], "->", end = " ")
        self.order = []

    def get_line(self,start,end):
        lines = self.connections_dict.keys()
        for line in lines:
            for connection in self.connections_dict[line]:
                if connection[0] == start and connection[1] == end:
                    return line
                if connection[0] == end and connection[1] == start:
                    return line
        return

    def step(self):
        print(self.train_dict)

    def create_train(self, train_id, line_name, starting_position):
        find_train_id = False

        for key in self.train_dict:
            if key == train_id:
                find_train_id = True

        if not find_train_id:
            find_starting_station = False
            find_line_name = False

            for i in range(len(self.station_list)):
                if self.station_list[i] == starting_position:
                    find_starting_station = True 

            for key in self.connections_dict:
                if key == line_name:
                    find_line_name = True

            if find_starting_station and find_line_name:
                self.train_dict[train_id] = {line_name: starting_position}
            elif find_starting_station and not find_line_name:
                print("Line name", line_name, "was not created")
            else:
                print("Starting station", starting_position, "was not created")
        else:
            print("Train id", train_id, "was found")


    # def step():


    def display_stations(self):
        for station in self.metro_dict["stations"]:
            print("    ", station)


    def display_trains(self):
        for identification in self.metro_dict["trains"]:
            print("*** Information for Train " + identification + " ***")
            for key in self.metro_dict["trains"][identification]:
                print("    Line: " + key)
                print("    Current Position: " + self.metro_dict["trains"][identification][key])

    # def get_station_info(station_name):


    def get_train_info(self, train_id):
        find_train = False

        for identification in self.metro_dict["trains"]:
            if identification == train_id:
                find_train = True
                print("*** Information for Train " + identification + " ***")
                for key in self.metro_dict["trains"][identification]:
                    print("    Line: " + key)
                    print("    Current Position: " + self.metro_dict["trains"][identification][key])

        if not find_train:
            print("Train id", train_id, "was not found.")


    def run_metro_system(self, system_name): 
        action = input("[" + system_name + "] >>> ")
        
        while action != 'exit':
            temp_action = action.split(" ")

            # done
            if len(temp_action) == 3:
                if temp_action[0] == "create" and temp_action[1] == "station":
                    self.create_station(temp_action[2])
                else:
                    print("You have entered an invalid action, please try again.")

            elif len(temp_action) == 4:
                if temp_action[0] == "plan" and temp_action[1] == "trip":
                    # make sure input validation
                    self.plan_trip(temp_action[2], temp_action[3])

                elif temp_action[0] == "get" and temp_action[1] == "station" and temp_action[2] == "info":
                    station_name = temp_action[3]
                    print("get station info", station_name)

                elif temp_action[0] == "get" and temp_action[1] == "train" and temp_action[2] == "info":
                    self.get_train_info(temp_action[3])

                else:
                    print("You have entered an invalid action, please try again.")

            # done
            elif len(temp_action) == 5:
                # done
                if temp_action[0] == "create" and temp_action[1] == "train":
                    self.create_train(temp_action[2], temp_action[3], temp_action[4])

                # done  
                elif temp_action[0] == "connect" and temp_action[1] == "stations":
                    self.connect_stations(temp_action[2], temp_action[3], temp_action[4])
                
                else:
                    print("You have entered an invalid action, please try again.")

            elif action == "step":
                self.step()
                
            # done
            elif action == "display stations":
                self.display_stations()

            # done
            elif action == "display trains":
                self.display_trains()
    
            else:
                print("You have entered an invalid action, please try again.")    

            action = input("[" + system_name + "] >>> ")

if __name__ == '__main__':
   metro_system_name = input(">>> ")
   start_game = Game()
   start_game.run_metro_system(metro_system_name)


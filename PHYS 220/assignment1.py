from numpy import array
import math
def calculate(time):
  G = 6.67 * (10 ** -11)
  M = 5.97 * (10 ** 24)
  R = 6371*1000
  h = (((G*M*(time**2))/(4*(math.pi**2)))**(1/3))-R
  return h
def problem1():
  print("Problem 1")
  time  = input("Please enter time(in minutes) to calculate altitude (type 'q' to move on to problem 2): ")
  while time != 'q':
    h = calculate(int(time)*60)
    print('h = ' + str(h))
    time = input("Please enter time(in minutes) to calculate altitude(type 'q' to move on to problem 2): ")
    #when is the given time in seconds is too low for the satatlite to go around the earth,
    #the amplitude goes to negative meaing for the satelite to go around the earth once in that time span,
    #the satelite must be within the earth which is not possible
def problem2():
  print("Problem 2")
  a = array([1,2,3,4],int)
  b = array([2,4,6,8],int)
  #these operations would occur on each index of the arrays i.e:
    #b[0]/a[0] + 1
    #b[1]/a[1] + 1 and so on
  #NOTE: this only works if the array have the same length otherwise it woule throw an error
  print('b/a+1')
  print(b/a+1)
  print('b/(a+1)')
  print(b/(a+1))
  print('1/a')
  print(1/a)
def main():
  problem1()
  problem2()
main()
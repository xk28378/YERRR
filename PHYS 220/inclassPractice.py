import math
def binomial(n,k):
  if k == 0:
    return 1
  ans = math.factorial(n) / (math.factorial(k) * math.factorial(n-k));
  return ans
def main():
  k = int(input("Please enter your 'k' value (k >= 0): "))
  n = int(input("Please enter your 'n' value: "))
  print("Probability" + str(binomial(n,k)))
  print("The probability a coin tossed 100 times comes up heads exactly 60 times is: " + str(binomial(100,60) / 2 ** 100))
  morethan60 = 0
  for i in range(60,100):
    morethan60 += binomial(100,i) / 2 ** 100
  print("The probablity a coin tossed 100 times comes up heads 60 or more times is: " +  str(morethan60))
main()


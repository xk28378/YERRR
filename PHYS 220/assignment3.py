# -- coding: utf-8 --
"""
Created on Tue Mar  1 10:44:17 2022

@author: Nem Negash
"""
from gaussxw import gaussxw
import math
import matplotlib.pyplot as plt

#equation we are integrating over
def f(x):
    return (x**4 * (math.e)**x) / ((math.e)**x -1)**2

def cv(T):
    #constants
    kb = 1.38064852e-23 
    p = 6.022e28
    thetaD =  428
    V = 0.001

    #integration bounds
    a = 0.0
    b = thetaD/T

    #calculate the points of xk and wk using guassian quadrature
    N = 50
    x, w = gaussxw(N)

    #redifining the values for the integration limits 
    xp = 0.5*(b-a)*x + 0.5*(b+a)
    wp = 0.5*(b-a)*w

    #summation with the integration limits to get integral estimation
    s = 0.0
    for k in range(N):
        s += wp[k]*f(xp[k])

    #calculating equation
    equation = 9*V*p*kb*((T/thetaD)**3)*s

    return equation

def main():
    #Calculate Cv for the temperature range 5K - 500K
    results = []
    for T in range(5, 500, 1):
        results.append(cv(T))

    #plotting the graph
    plt.figure()
    plt.plot(range(5,500,1), results)
    plt.xlabel('Temperature (K)', fontsize=10)
    plt.ylabel("Heat Capacity $C_{v}$", fontsize=10)

main()
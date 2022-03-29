# -*- coding: utf-8 -*-
"""
Created on Wed Mar 16 23:27:23 2022

@author: Nem Negash
"""

import numpy as np
from random import random
import matplotlib.pyplot as plt

def circle_eqn(x,y):
    #equation of a circle centred at the origin
    radius = np.sqrt(x**2+y**2)
    return radius

#approximation of PI given N number of terms
def approximation(N):
    sections = 0;
    for i in range(N):
        x = random()
        y = random()
        if circle_eqn(x,y)<=1:
            sections += 1

    circumference = 4*sections/N 
    return circumference

def Problem1():
    #Number of terms used in simulation
    N = [10,50,100,500,1000,5000,10000,500000,100000,500000,1000000]
    computed_pi = []
    #approximation error
    abs_error_arr = []
    pi = []
    for i in range(len(N)):
        estimation = approximation(N[i])
        computed_pi.append(estimation)

    for i in range(len(computed_pi)):
        abs_error = abs(np.pi - computed_pi[i])
        abs_error_arr.append(abs_error)
        pi.append(np.pi)

    #plot PI values
    plt.figure()
    plt.plot(N, pi, label="\u03C0")
    plt.plot(N, computed_pi, 'o', label="Computed \u03C0")
    plt.legend()
    plt.xlabel("N")
    plt.ylabel("\u03C0 values")
    plt.title("Computed \u03C0 vs. N")

    #plot Absoulte Error of approximations
    plt.figure()
    plt.plot(N, abs_error_arr, 'o')
    plt.xlabel("N")
    plt.ylabel("Error Margin")
    plt.title("Absoulte Error of (Computed \u03C0 Values - \u03C0)")

# Plot 2 shows, that as N increase,the margin of error becomes smaller and smaller and vice versa. This is because we 
# are getting a less percise approximation for our calcuted pi values, which in turn create a larger margin of error in difference. 
# It seems this estimation method, works very well for a linear based comparison.
def main():
    Problem1()
main()
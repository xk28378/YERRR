# -*- coding: utf-8 -*-
"""
Created on Thu Mar 31 16:46:47 2022

@author: Nem Negash
"""
import numpy as np
import matplotlib.pyplot as plt
import random
from scipy import integrate

#the ploted functions in the first plot
def f1(x):
    return np.exp(-x/4)

def f2(x):
    return -1*np.exp(-x/4)

def f3(x):
    return (np.exp(-x/4))*np.sin(x)

#The first plot function
def Q1_1():
    x_vals = np.arange(0.0, 20.0, 0.1);
    plt.figure()
    plt.plot(x_vals, f1(x_vals), '--', color='k', label='exp(-x/4)')
    plt.plot(x_vals, f2(x_vals), '--', color='k', label='-exp(-x/4)')
    plt.text(5.3, 0.3, 'exp(-x/4)')
    plt.text(5.3, -0.34, '-exp(-x/4)')
    plt.grid()
    plt.plot(x_vals, f3(x_vals), color='blue')
    x_vals2 = np.arange(0.0, 19.5, 1.57)
    plt.scatter(x_vals2, f3(x_vals2), color='r')
    plt.xlim([0,20])
    plt.ylim([-1.0,1.0])
    plt.ylabel("f(x)")
    plt.xlabel("x")
    plt.title("f(x)=exp(-x/4)*sin(x)")

#taylor series function
def func_cos_taylor(x, n):
    cos_approx = 0
    for i in range(n):
        coef = (-1)**i 
        num = x**(2*i)
        den = np.math.factorial(2*i)
        cos_approx += coef*num/den
    return cos_approx

def Q1_2():
    angles = np.arange(-2*np.pi, 2*np.pi, 0.1)
    p_cos = np.cos(angles) #exact values 
    leg = ["cos(x)"]

    plt.figure()
    #plot cosine function
    plt.plot(angles, p_cos, 'k')
    
    #calculate each term using taylor series function and plot them
    for i in range(1,6):
        t_cos = [func_cos_taylor(k, i) for k in angles]
        plt.plot(angles, t_cos, '--');
        leg.append(f'{i} term series')
    
    plt.title("Taylor series of cos(x)")
    plt.xlabel('x')
    plt.ylabel('cos(x)')
    plt.ylim([-10,10])
    plt.legend(leg, loc='lower center', fontsize='small')
    plt.grid(True)
    plt.savefig("cos.png", dpi=600)
    
def Q2():
    L = 101;
    N = 5000;
    plt.figure();
    directions = [-1,1]
    
    #plot 3 articles
    for j in range(3):
        startI = 50;
        startJ = 50;
        I = [50];
        J = [50];
        #each particle needs to move a total of 5000 steps
        for i in range(N):
            #choose in which direction we might be moving up/down(1) or left/right(0)
            direction = round(random.random());
            if direction == 0:
                #go left or rightt
                randI = random.choice(directions);
                while startI + randI >= L or startI + randI < 0:
                    randI = random.choice(directions);
                startI += randI;
            else:
                #go up or down
                randJ = random.choice(directions);
                while startJ + randJ >= L or startJ + randJ < 0:
                    randJ = random.choice(directions);
                startJ += randJ;
            I.append(startI);
            J.append(startJ);
        #plot the particle
        plt.plot(I,J);
        plt.grid();
        plt.title("Brownian motion");
        plt.xlabel('L');
        plt.ylabel('L');

#function to integrate
def f(x):
    return (x**3)/(np.exp(x) -1)

def Q3():
    #known values
    h = 1.0545718e-34
    c = 299792458
    k = 1.38064852e-23
    T = 300
    
    #constant value
    constant = ((k**4)*(T**4))/((4*np.pi**2)*(c**2)*(h**3))
    #integral
    val, err = integrate.quad(f, 0, np.inf)
    print("Integral value:", val)
    print("Error value:", err)
    W = constant * val
    print("W value:", W)
    #calculating stefan-boltzmann value
    stefBoltzEqn = W/(T**4)
    print("Experimental Stefan-Boltzmann: ", stefBoltzEqn)
    print("Theoretical Stefan-Boltzmann: 5.670e-8")
def main():
    Q1_1();
    Q1_2();
    Q2();
    Q3();
main();

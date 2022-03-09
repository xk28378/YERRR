# -*- coding: utf-8 -*-
"""
Created on Tue Mar  8 14:24:49 2022

@author: Nem Negash
"""

import numpy as np
import math
from scipy import integrate
from scipy.special import jv 
import matplotlib.pyplot as plt

def J(m,x):
    theta = np.linspace(0,math.pi,1001);
    y = [];
    for num in theta:
        y.append(math.cos((m*num) - (x*math.sin(num))));
    output = (1/math.pi) * integrate.simps(y,theta);
    return output;
def partA():
    J_0 = [];
    J_1 = [];
    J_2 = [];
    x = np.linspace(0,20,200);
    for num in x:
        J_0.append(J(0,num));
        J_1.append(J(1,num));
        J_2.append(J(2,num));
    plt.figure();
    plt.plot(x,J_0,label = '$J_0$(x)');
    plt.plot(x,J_1,label = '$J_1$(x)');
    plt.plot(x,J_2,label = '$J_2$(x)');
    plt.ylabel('$J_m$(x)');
    plt.xlabel('x');
    plt.title("The Bessel Functions vs x")
    plt.legend();
def partB():
    r = np.linspace(0,1*(10**-6),101);
    lam = 500*(10**-9);
    k = (2*math.pi) / lam;
    I_r = [];
    for num in r:
        I_r.append(((J(1,(k*num)))/(k*num))**2)
    print(I_r)
    plt.figure();
    plt.plot(r,I_r);
def main():
    partA();
    partB();
main();
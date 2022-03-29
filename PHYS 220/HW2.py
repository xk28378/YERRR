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

#The Bessel function
def J(m,x):
    theta = np.linspace(0,math.pi,1001);
    y = [];
    for num in theta:
        y.append(math.cos((m*num) - (x*math.sin(num))));
    output = (1/math.pi) * integrate.simps(y,theta);
    return output;
#problem 1
def partA():
    J_0 = [];
    J_1 = [];
    J_2 = [];
    x = np.linspace(0,20,200);
    #computing each Bessel function
    for num in x:
        J_0.append(J(0,num));
        J_1.append(J(1,num));
        J_2.append(J(2,num));
    #ploting each Bessel fuction on one plot
    plt.figure();
    plt.plot(x,J_0,label = '$J_0$(x)');
    plt.plot(x,J_1,label = '$J_1$(x)');
    plt.plot(x,J_2,label = '$J_2$(x)');
    plt.ylabel('$J_m$(x)');
    plt.xlabel('x');
    plt.title("The Bessel Functions vs x");
    plt.legend();
#light intensity function
def light(r):
    lam = 500
    k = (2*math.pi) / lam;
    output = 0;
    if(k*r == 0):
        output = (1/2);
    else:
        output = ((J(1,(k*r)))/(k*r))**2;
    return output;
#problem 2
def partB():
    side = 2000 #cm side of the area
    points = 200 #number of grid points along each side
    spacing = side/points #spacing of points in cm 
    
    Ai0 = 1/2 #initial amplitude 
    
    #calculate the position of the point sources 
    x1 = side/2
    y1 = side/2 
    Ai0 = light(0);
    plot_data = np.empty([200, 200], float);
    for i in range(200):
        y = spacing*i;
        for j in range(200):
            x = spacing*j
            r = np.sqrt((x-x1)**2+(y-y1)**2)
            plot_data[i,j] = Ai0*light(r);
    #plot diffraction
    plt.figure();
    plt.imshow(plot_data, origin="lower",vmin = 1 * (10**-5),vmax = 20 * (10**-5),extent=[0, 2000, 0, 2000])
    plt.colorbar()
    plt.ylabel('Y(nm)');
    plt.xlabel('X(nm)');
    plt.title("Light Diffraction")
    plt.show()
def main():
    partA();
    partB();
main();
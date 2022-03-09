#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb 20 15:38:40 2022

@author: Nem Negash
"""
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
#function to calculate S(up)
def calUp(N):
    sum = 0;
    for i in range(N):
        sum += (1/(i+1))
    return sum
#function to caculate S(down)
def calDown(N):
    sum = 0;
    for i in range(N,0,-1):
        sum += (1/i)
    return sum
#function to caculate log equation
def eqn(up,down):
    return abs((up-down)/(abs(up) + abs(down)))
#function to do first equation
def Q1():
    Narr = [10, 100, 1000, 10000, 100000, 1000000]
    resultArr = []
    #for each N value calculate the result of the equation
    for N in Narr:
        result = eqn(calUp(N),calDown(N))
        resultArr.append(result)
    #figure to plot the equation results vs each N value
    plt.figure()
    plt.loglog(Narr,resultArr)
    plt.xlabel('N value', fontsize=10)
    plt.ylabel('Equation result', fontsize=10)
    plt.xticks(fontsize=10)
    plt.yticks(fontsize=10)



#decay function for a single unstable atom
def decay1(x,lam,A):
    output = []
    for t in x:
        output.append(A*np.exp(-lam*t));
    return output
#decay function for 2 unstable atoms
def decay2(x, A1, lam1, A2, lam2):
    output = []
    for t in x:
        output.append(A1*np.exp(-lam1*t) + A2*np.exp(-lam2*t))
    return output
#decay function for 3 unstable atoms
def decay3(x, A1, lam1, A2, lam2, A3, lam3):
    output = []
    for t in x:
        output.append(A1*np.exp(-lam1*t) + A2*np.exp(-lam2*t) + A3*np.exp(-lam3*t))
    return output 

def Q2():
    data = np.loadtxt("HW1_Q2_dataset.txt")
    time = []
    ydata = []
    #get the time and A(t) from the loaded data
    for [t,y] in data:
        time.append(t)
        ydata.append(y)
    print("N =",len(ydata))
    
    #scatter plot for the loaded data
    plt.figure()
    plt.scatter(time,ydata)
    
    #curve fit for a single unstable atom
    popt, _ = curve_fit(decay1, time, ydata, maxfev=1000000,sigma=np.sqrt(ydata))
    xfine = np.linspace(0.,5.5,12)
    
    #plot fitted line aganist scattered plot
    plt.plot(xfine,decay1(xfine,popt[0],popt[1]),'--',color='green')
    plt.title("One unstable atom plot")
    plt.xlabel('Time', fontsize=10)
    plt.ylabel('Decay Activity', fontsize=10)
    plt.xticks(fontsize=10)
    plt.yticks(fontsize=10)
    
    #calculating Chi-squared for a single unstable atom
    chi_sqd_1 = sum(np.square(np.subtract(ydata, decay1(time,popt[0],popt[1])) / np.sqrt(ydata)))
    print("Chi-squared value for 1 unstable atoms:", chi_sqd_1)
    
    #scatter plot for the loaded data
    plt.figure()
    plt.scatter(time,ydata)
    
    #curve fit for 2 unstable atoms
    popt, _ = curve_fit(decay2, time, ydata, maxfev=1000000,sigma=np.sqrt(ydata))
    xfine = np.linspace(0.,5.5,12)
    
    #plot fitted line aganist scattered plot
    plt.plot(xfine,decay2(xfine,popt[0],popt[1],popt[2],popt[3]),'--',color='red')
    plt.title("Two unstable atom plot")
    plt.xlabel('Time', fontsize=10)
    plt.ylabel('Decay Activity', fontsize=10)
    plt.xticks(fontsize=10)
    plt.yticks(fontsize=10)
    
    #calculating Chi-squared for 2 unstable atoms
    chi_sqd_2 = sum(np.square(np.subtract(ydata, decay2(time,popt[0],popt[1],popt[2],popt[3])) / np.sqrt(ydata)))
    print("Chi-squared value for 2 unstable atoms:",chi_sqd_2)
    
    #scatter plot for the loaded data
    plt.figure()
    plt.scatter(time,ydata)
    
    #curve fit for 3 unstable atoms
    popt, _ = curve_fit(decay3, time, ydata, maxfev=1000000,sigma=np.sqrt(ydata))
    xfine = np.linspace(0.,5.5,12)
    
    #plot fitted line aganist scattered plot
    plt.plot(xfine,decay3(xfine,popt[0],popt[1],popt[2],popt[3],popt[4],popt[5]),'--',color='black')
    plt.title("Three unstable atom plot")
    plt.xlabel('Time', fontsize=10)
    plt.ylabel('Decay Activity', fontsize=10)
    plt.xticks(fontsize=10)
    plt.yticks(fontsize=10)
    
    #calculating Chi-squared for 3 unstable atoms
    chi_sqd_3 = sum(np.square(np.subtract(ydata, decay3(time,popt[0],popt[1],popt[2],popt[3],popt[4],popt[5])) / np.sqrt(ydata)))
    print("Chi-squared value for 3 unstable atoms:", chi_sqd_3)

#run the code for each question
def main():
    Q1()
    Q2()
main()
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb 20 15:38:40 2022

@author: Nem Negash
"""
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit
def calUp(N):
    sum = 0;
    for i in range(N):
        sum += (1/(i+1))
    return sum
def calDown(N):
    sum = 0;
    for i in range(N,0,-1):
        sum += (1/i)
    return sum
def eqn(up,down):
    return abs((up-down)/(abs(up) + abs(down)))
def Q1():
    Narr = [10, 100, 1000, 10000, 100000, 1000000]
    resultArr = []
    for N in Narr:
        result = eqn(calUp(N),calDown(N))
        resultArr.append(result)
    plt.figure()
    plt.loglog(Narr,resultArr)
def linear_fit(time,lam,A_in):
    A_t = []
    for t in time:
        A_t.append(A_in*np.exp(-lam*t))
    return A_t
def decay1(x,lam,A):
    output = []
    for t in x:
        output.append(A*np.exp(-lam*t));
    return output

def decay2(x, A1, lam1, A2, lam2):
    output = []
    for t in x:
        output.append(A1*np.exp(-lam1*t) + A2*np.exp(-lam2*t))
    return output

def decay3(x, A1, lam1, A2, lam2, A3, lam3):
    output = []
    for t in x:
        output.append(A1*np.exp(-lam1*t) + A2*np.exp(-lam2*t) + A3*np.exp(-lam3*t))
    return output 
def Q2():
    data = np.loadtxt("HW1_Q2_dataset.txt")
    time = []
    ydata = []
    for [t,y] in data:
        time.append(t)
        ydata.append(y)
    #stdev = ydata ** 0.5
    plt.figure()
    plt.scatter(time,ydata)
    popt, _ = curve_fit(decay1, time, ydata, maxfev=1000000)
    xfine = np.linspace(0.,6,13)
    plt.plot(xfine,decay1(xfine,popt[0],popt[1]),'--',color='green')
    plt.title("One unstable atom plot")
    plt.xlabel('Time', fontsize=10)
    plt.ylabel('Decay Activity', fontsize=10)
    plt.xticks(fontsize=10)
    plt.yticks(fontsize=10)
    
    plt.figure()
    plt.scatter(time,ydata)
    popt, _ = curve_fit(decay2, time, ydata, maxfev=1000000)
    xfine = np.linspace(0.,6,13)
    plt.plot(xfine,decay2(xfine,popt[0],popt[1],popt[2],popt[3]),'--',color='red')
    plt.title("Two unstable atom plot")
    plt.xlabel('Time', fontsize=10)
    plt.ylabel('Decay Activity', fontsize=10)
    plt.xticks(fontsize=10)
    plt.yticks(fontsize=10)
    
    plt.figure()
    plt.scatter(time,ydata)
    popt, _ = curve_fit(decay3, time, ydata, maxfev=1000000)
    xfine = np.linspace(0.,6,13)
    plt.plot(xfine,decay3(xfine,popt[0],popt[1],popt[2],popt[3],popt[4],popt[5]),'--',color='black')
    plt.title("Three unstable atom plot")
    plt.xlabel('Time', fontsize=10)
    plt.ylabel('Decay Activity', fontsize=10)
    plt.xticks(fontsize=10)
    plt.yticks(fontsize=10)
def main():
    Q1()
    Q2()
main()
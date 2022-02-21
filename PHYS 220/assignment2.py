#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 10 10:29:37 2022

@author: nehmyanegash
"""
import numpy as np
import matplotlib.pyplot as plt

def main():
    data = np.loadtxt("data1.txt")
    print(data)
    time = data[:,0]
    y = data[:,1]
    yerror = data[:,2]
    
    print("First variable: ", time)
    print("Second :", y)
    print("Third :", yerror)
    
    plt.figure()
    plt.errorbar(time, y, yerr=yerror,marker='o')
    
    p = np.polyfit(time, y, 1)
    pfit = np.poly1d(p)
    print("The function in pfit is: ", pfit)
    plt.plot(time, pfit(time))
    plt.xlabel("time(s)")
    plt.ylabel("y(m)")
    
    plt.savefig("fig1.jpg", dpi=600)
main()
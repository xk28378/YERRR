#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Feb 20 15:38:40 2022

@author: nehmyanegash
"""
import matplotlib.pyplot as plt

def calUp(N):
    sum = 0;
    for i in range(N):
        sum += (1/(i+1));
    print(sum)
    return sum;
def calDown(N):
    sum = 0;
    for i in range(N,0,-1):
        sum += (1/i)
    print(sum)
    return sum;
def eqn(up,down):
    return abs((up-down)/(abs(up) + abs(down)));
def Q1():
    Narr = [10, 100, 1000, 10000, 100000, 1000000];
    resultArr = []
    for N in Narr:
        result = eqn(calUp(N),calDown(N));
        print(result);
        resultArr.append(result);
    plt.figure();
    plt.loglog(Narr,resultArr);

Q1();
        

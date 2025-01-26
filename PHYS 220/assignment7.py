#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 26 10:28:09 2022

@author: Nem Negash
"""


import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import odeint

def f(arr,t):
    sigma = 10.0
    r = 28.0
    b = 8/3
    x = arr[0]
    y = arr[1]
    z = arr[2]
    fx = sigma*(y-x)
    fy = r*x - y - x*z
    fz = x*y - b*z
    return np.array([fx,fy, fz], float)

c = 0.0
d = 50.0
N = 1000
h = (d-c)/N

tpoints = np.arange(c,d,h)
xpoints = []
ypoints = []
zpoints = []

arr = np.array([0.0,1.0, 0.0], float)

for t in tpoints:
    xpoints.append(arr[0])
    ypoints.append(arr[1])
    zpoints.append(arr[2])
    k1 = h*f(arr,t)
    k2 = h*f(arr+0.5*k1, t+0.5*h)
    k3 = h*f(arr+0.5*k2, t+0.5*h)
    k4 = h*f(arr+k3, t+h)
    arr += (k1+2*k2+2*k3+k4)/6
    
fig, ax1 = plt.subplots()

ax2 = ax1.twinx()
ax2.set_ylabel('y(t)', color='b')
ax2.plot(tpoints, ypoints, color = 'b')
ax2.tick_params(axis='y', labelcolor='b')

plt.show()

plt.figure()

fig, ax1 = plt.subplots()

ax2 = ax1.twinx()
ax2.set_ylabel('y(t)', color='b')
ax2.plot(xpoints, zpoints, color = 'b')
ax2.tick_params(axis='y', labelcolor='b')

sol = odeint(f, [0.0,1.0,0.0], tpoints)
plt.figure()
plt.plot(tpoints, sol[:, 1], 'b', label='theta(t)')

plt.figure()
plt.plot(sol[:,0],sol[:, 2])

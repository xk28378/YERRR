# -*- coding: utf-8 -*-
"""
Created on Mon May 16 16:38:53 2022

@author: nehmy
"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

theta = 90 #degrees
omega = 0.0
L = 0.4 #meters
mass = 1 #kg
g = 9.81


def f(r,t):
    theta1 = r[0]
    theta2 = r[1]
    omega1 = r[2]
    omega2 = r[3]
    dtheta1_dt = omega1
    dtheta2_dt = omega2
    domega1_dt = (-g*(2*mass+mass)*np.sin(theta1)-mass*g*np.sin(theta1-2*theta2)-2*np.sin(theta1-theta2)*mass*(omega2**2*L+omega1**2*L*np.cos(theta1-theta2)))/(L*(2*mass+mass-mass*np.cos(2*theta1-2*theta2)))
    domega2_dt = (2*np.sin(theta1-theta2)*(omega1**2*L*(mass+mass)+g*(mass+mass)*np.cos(theta1)+omega2**2*L*mass*np.cos(theta1-theta2)))/(L*(2*mass+mass-mass*np.cos(2*theta1-2*theta2)))
    #domega1_dt = -((omega1**2)*np.sin(2*theta1-2*theta2)+2*(omega2**2)*np.sin(theta1-theta2)+(g/L)*(np.sin(theta1-2*theta2)+3*np.sin(theta1)))/(3-np.cos(2*theta1-2*theta2))
    #domega2_dt = (4*(omega1**2)*np.sin(theta1-theta2)+(omega2**2)*np.sin(2*theta1-2*theta2)+2*(g/L)*(np.sin(2*theta1-theta2)-np.sin(theta2)))/(3-np.cos(2*theta1-2*theta2))
    return np.array([dtheta1_dt, dtheta2_dt, domega1_dt, domega2_dt], float)

a = 0
b = 100.0
N = 10000
h = (b-a)/N

tpoints = np.arange(a,b,h)
theta1points = []
theta2points = []
omega1points = []
omega2points = []

r = np.array([(90*np.pi)/180 , (90*np.pi)/180, 0, 0])

for t in tpoints:
    theta1points.append(r[0])
    theta2points.append(r[1])
    omega1points.append(r[2])
    omega2points.append(r[3])
    k1 = h*f(r,t)
    k2 = h*f(r+0.5*k1, t+0.5*h)
    k3 = h*f(r+0.5*k2, t+0.5*h)
    k4 = h*f(r+k3, t+h)
    r += (k1+2*k2+2*k3+k4)/6   
    

#animation
interval = 10
frames = 10000

theta1arr = np.array(theta1points)
theta2arr = np.array(theta2points)

def animate(i):
    angle1 = theta1arr[i]
    x1 = np.array([0,L*np.sin(angle1)])
    y1 = np.array([0,-L*np.cos(angle1)])
    line1.set_data(x1,y1)
    angle2 = theta2arr[i]
    x2 = [x1[1], np.array(x1[1]+L*np.sin(angle2))]
    y2 = [y1[1], np.array(y1[1]-L*np.cos(angle2))]
    line2.set_data(x2,y2)
    return line1, line2,

def init():
    line1.set_data([],[])
    line2.set_data([],[])
    return line1, line2,

fig = plt.figure()
lim=1
plt.xlim(-lim,lim)
plt.ylim(-lim,lim)
plt.gca().set_aspect("equal")
plt.grid()
line1, = plt.plot([],[],"o-",lw=2)
line2, = plt.plot([],[],"o-",lw=2)

anim = animation.FuncAnimation(fig,animate,init_func=init,frames=frames,interval=interval,blit=True)
writervideo = animation.FFMpegWriter(fps=60)
plt.show()
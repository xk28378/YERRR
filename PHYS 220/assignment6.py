# -*- coding: utf-8 -*-
"""
Created on Fri Apr 22 14:28:31 2022

@author: Nem Negash
"""

import numpy as np
import matplotlib.pyplot as plt
import math

def V_in(t):
    V_in = math.floor(2*t)
    if(V_in % 2 == 0):
        return 1
    else:
        return -1

def V_out(RC, t, V_out):
    return ( (1/RC) * (V_in(t) - V_out) )

def main():
    a = 0.0
    b = 10.0
    N = 1000
    h = (b-a)/N
    
    RC = 0.01
    V_out_init = 0;
    t1points = np.arange(a,b,h)
    x_1points = []
    
    for t in t1points:
        
        x_1points.append(V_out_init)
        
        k1 = h* V_out(RC, t, V_out_init)
        
        k2 = h* V_out(RC, t+0.5*h, V_out_init+0.5*k1)
        
        k3 = h* V_out(RC, t+0.5*h, V_out_init+0.5*k2)
        
        k4 = h* V_out(RC, t+h, V_out_init+k3)
        
        V_out_init += (k1+2*k2+2*k3+k4)/6
        
    plt.plot(t1points[0:1000], x_1points[0:1000])
    
    RC = 0.1
    V_out_init = 0;
    t2points = np.arange(a,b,h) 
    x_2points = []
    
    for t in t2points:
        
        x_2points.append(V_out_init)
        
        k1 = h* V_out(RC, t, V_out_init)
        
        k2 = h* V_out(RC, t+0.5*h, V_out_init+0.5*k1)
        
        k3 = h* V_out(RC, t+0.5*h, V_out_init+0.5*k2)
        
        k4 = h* V_out(RC, t+h, V_out_init+k3)
        
        V_out_init += (k1+2*k2+2*k3+k4)/6
        
    plt.plot(t2points[0:1000], x_2points[0:1000])
    
    RC = 1
    V_out_init = 0
    t3points = np.arange(a,b,h)
    x_3points = []
    
    for t in t3points:
        
        x_3points.append(V_out_init)
        
        k1 = h* V_out(RC, t, V_out_init)
        
        k2 = h* V_out(RC, t+0.5*h, V_out_init+0.5*k1)
        
        k3 = h* V_out(RC, t+0.5*h, V_out_init+0.5*k2)
        
        k4 = h* V_out(RC, t+h, V_out_init+k3)
        
        V_out_init += (k1+2*k2+2*k3+k4)/6
        
    plt.plot(t3points[0:1000], x_3points[0:1000])
    
    plt.ylabel('$V_{out}(t)$')
    plt.xlabel("t")
    plt.show()
main()

#Part B:
    #The plot shows three RC waveforms where we see the output voltage across the capacitor over time. The
    #input voltage is simply just a continuous squarewave waveform where the pluse width is proportional 
    #with the time constant of the circuit. This circuit is an RC integrator circuit, which is basically a 
    #low pass filter that can convert a sqaure input voltage waveform to a triangular output voltage waveform
    #as shown in the plot above. If the ratio between the RC time constant and the width of the input pulse
    #it will result in an output voltage waveform that is triangular. Along side that, the output amplitude
    #is dependent on the input frequency where the lower the input frequency, the higher the output amplitude
    #and vice versa.                                                                                                                                                                                                                                                                                                                                                                                                                                                                  


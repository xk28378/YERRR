# -*- coding: utf-8 -*-
"""
Created on Wed Apr 13 18:49:28 2022

@author: Nem Negash
"""

from scipy import fftpack
import numpy as np
import matplotlib.pyplot as plt

#signal function
def signal_samples(t):
    return (2 * np.sin(2 * np.pi * t) + 3 * np.sin(22 * 2 * np.pi *t) + 2 * np.random.randn(*np.shape(t)))
def main():
    B = 30.0 #Hz - highest frequency
    f_s = 2 * B #Hz - sampling frequency 
    delta_f = 0.01 #Hz - resolution 
    N = int(f_s / delta_f) #number of samples -> 6000 samples
    T = N / f_s #sampling period -> 100 seconds
    
    
    #array of sample times
    t = np.linspace(0, T, N)
    
    #call signal funciton
    f_t = signal_samples(t)
    
    #Plot signal over times
    fig, axes = plt.subplots(1, 2, figsize=(8, 3), sharey=True)
    for i in range(2):
        axes[i].plot(t,f_t)
        axes[i].set_xlabel("time (s)")
        axes[i].set_ylabel("signal")
        if i == 1:
            axes[i].set_xlim(0,5)
    
    #The discrete Fourier transform of the signal 
    F = fftpack.fft(f_t)
    
    f = fftpack.fftfreq(N, 1.0/f_s)
    
    #mask for positive-frequency components 
    mask = np.where(f >= 0)
    
    #Plot the three graphs
    fig, axes = plt.subplots(3, 1, figsize=(8,6))
    axes[0].plot(f[mask], np.log(abs(F[mask])), label="real")
    axes[0].plot(B, 0, 'r*', markersize=10)
    axes[0].set_ylabel("$\log(|F|$", fontsize=14)
    for i in range(1,3):
        axes[i].plot(f[mask], abs(F[mask])/N, label="real")
        axes[i].set_xlim(0, 2)
        axes[i].set_ylabel("$\|F|/N$", fontsize=14)
    
    axes[2].set_xlim(21, 23)
    axes[2].set_xlabel("frequency (Hz)", fontsize=14)
    #low-pass filter
    F_filtered = F * (abs(f) < 2)
    #inverse transform of the filtered data
    f_t_filtered = fftpack.ifft(F_filtered)
    
    #plotting the low pass filter
    fig, ax = plt.subplots(figsize=(8,3))
    ax.plot(t, f_t, label="original")
    ax.plot(t, f_t_filtered.real, color="red", lw=3, label='filtered')
    ax.set_xlim(0,10)
    ax.set_xlabel("time (s)")
    ax.set_ylabel("signal")
    ax.legend() 
    
    #high-pass filter
    F_filtered_high = F * (abs(f) > 20)
    #inverse transform on the filtered data 
    f_t_filtered_high = fftpack.ifft(F_filtered_high)
    
    #plotting the high pass filter
    fig, axes = plt.subplots(2, 1, figsize=(8,3))
    axes[0].plot(t, f_t, label="original")
    axes[0].plot(t, f_t_filtered_high.real, color="red", lw=3, label='filtered')
    axes[0].set_xlim(0,10)
    axes[0].set_xlabel("time (s)")
    axes[0].set_ylabel("signal")
    axes[0].legend()
main();
# -*- coding: utf-8 -*-
"""
Created on Tue Apr 26 12:28:18 2022

@author: Nem Negash
"""
import numpy as np
import matplotlib.pyplot as plt
from scipy import fftpack

def main():
    data_file = np.loadtxt('co2_mm_mlo.txt')
    data = data_file [:, 3]
    year = data_file[:,2]
    
    plt.plot(year, data)
    plt.ylabel("$CO_{2}$ Monthly Concentration(ppm)")
    plt.xlabel("Years")
    plt.title("Time Series of $CO_{2}$ concentration")
    plt.show()
    
    
    #PART B
    
    plt.figure(1)
    N = len(data)
    sampling_rate = 12
    d = 1/sampling_rate
    
    #freqeuincies
    freq_fourier = fftpack.rfftfreq(N, d)
    
    y_fourier = fftpack.rfft(data)
    
    plt.plot(freq_fourier, abs(y_fourier), label="real")
    
    plt.ylim([0,1000])
    plt.title("Fourier Plot - No Trend")
    plt.ylabel("Fourier Coefficients")
    plt.xlabel("Frequency Bins=1/years")
    
    #PART C
    plt.figure(2)
    
    #Zeroing the peaks at 1
    s = np.where( (freq_fourier>0.75) * (freq_fourier<1.25) )
    
    #Values of the fourier transform for all the points in this range
    y_s = y_fourier[s]
    
    #Finding the position of maximum                                    
    ind = np.argmax(y_s) 
    
    #Zeroing the first peak                            
    y_fourier[ind+np.asarray(s)[0,0]] = 0  
    
    #Values of the fourier transform for all the points in this range
    y_s = y_fourier[s]
    
    #Finding the position of maximum                                    
    ind = np.argmax(y_s) 
    
    #Zeroing the second peak near 1                            
    y_fourier[ind+np.asarray(s)[0,0]] = 0  
    
              
    #Zeroing the peak at 2
    s = np.where( (freq_fourier>1.75) * (freq_fourier<2.25) )
    
    #Values of the fourier transform for all the points in this range
    y_s = y_fourier[s]
    
    #Finding the position of maximum                                    
    ind = np.argmin(y_s) 
    
    #Zeroing the peak                            
    y_fourier[ind+np.asarray(s)[0,0]] = 0   
              
    plt.plot(freq_fourier, abs(y_fourier), label="real")
    plt.ylim([0,1000])
    plt.title("Fourier Plot - No Trend, Filtered")
    plt.ylabel("Fourier Coefficients")
    plt.xlabel("Frequency Bins=1/years")
    
    plt.figure(3)
    
    signal_rec = fftpack.irfft(abs(y_fourier))
    plt.plot(year, signal_rec, label="Filtered data")
    plt.plot(year, data, label="Original")
    plt.title("Filtered data comparison")
    plt.ylabel("$CO_{2}$ Monthly Average(ppm)")
    plt.xlabel("Years")
    plt.legend()
    
    
    #Part D
    plt.figure(4)
    
    coeffs = np.polyfit(year, data, 2)
    r = np.polyval(coeffs, year)
    signal_notrend = data - r
    
    N = len(signal_notrend)
    sampling_rate = 12
    d = 1/sampling_rate
    
    #freqeuincies
    freq_fourier1 = fftpack.rfftfreq(N, d)
    
    y_fourier1 = fftpack.rfft(signal_notrend)
    
    plt.plot(freq_fourier1, abs(y_fourier1), label="real")
    plt.title("Part D Fourier Plot - No Trend")
    plt.ylabel("Fourier Coefficients")
    plt.xlabel("Frequency Bins=1/years")
    
    plt.ylim([0,1000])
        
    
    plt.figure(5)
    
    s3 = np.where( (freq_fourier1>0.75) * (freq_fourier1<1.25) )
    
    #Values of the fourier transform for all the points in this range
    y_s3 = y_fourier1[s3]
    
    #Finding the position of maximum                                    
    ind1 = np.argmax(y_s3) 
    
    #Zeroing peaks                          
    for i in range(len(y_fourier1)):
        if y_fourier1[i] > 50:
            y_fourier[i] = 0;
    
    s3 = np.where( (freq_fourier1>0.75) * (freq_fourier1<1.25) )
    
    #Values of the fourier transform for all the points in this range
    y_s3 = y_fourier1[s3]
    
    #Finding the position of maximum                                    
    ind1 = np.argmin(y_s3) 
    
    #Zeroing the peak                            
    y_fourier1[ind1+np.asarray(s3)[0,0]] = 0 
    
    #Values of the fourier transform for all the points in this range
    y_s3 = y_fourier1[s3]
    
    #Finding the position of maximum                                    
    ind1 = np.argmin(y_s3) 
    
    #Zeroing the peak                            
    y_fourier1[ind1+np.asarray(s3)[0,0]] = 0   
    
    #Values of the fourier transform for all the points in this range
    y_s3 = y_fourier1[s3]
    
    #Finding the position of maximum                                    
    ind1 = np.argmax(y_s3) 
    
    #Zeroing the peak                            
    y_fourier1[ind1+np.asarray(s3)[0,0]] = 0 
    
    
    s4 = np.where( (freq_fourier1>1.75) * (freq_fourier1<2.25) )
    
    #Values of the fourier transform for all the points in this range
    y_s4 = y_fourier1[s4]
    
    #Finding the position of maximum                                    
    ind2 = np.argmin(y_s4) 
    
    #Zeroing the peak                            
    y_fourier1[ind2+np.asarray(s4)[0,0]] = 0  
    
    #Values of the fourier transform for all the points in this range
    y_s4 = y_fourier1[s4]
    
    #Finding the position of maximum                                    
    ind2 = np.argmin(y_s4) 
    
    #Zeroing the peak                            
    y_fourier1[ind2+np.asarray(s4)[0,0]] = 0 
    y_fourier1[1+ind2+np.asarray(s4)[0,0]] = 0 
              
    plt.plot(freq_fourier1, abs(y_fourier1), label="real")
    plt.title("Part D Fourier Plot - No Trend, Filtered")
    plt.ylabel("Fourier Coefficients")
    plt.xlabel("Frequency Bins=1/years")
    plt.ylim([0,1000])
    
    plt.figure(6)
    
    signal_rec1 = fftpack.irfft(abs(y_fourier1))
    #add the quadratic back again
    signal_rec1 += r
    
    plt.plot(year, signal_rec1, label="Filtered data")
    plt.plot(year, data, label="Original")
    plt.title("Part D Filtered data comparison")
    plt.ylabel("$CO_{2}$ Monthly Concentration(ppm)")
    plt.xlabel("Years")
    plt.legend()
main();
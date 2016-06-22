# -*- coding: utf-8 -*-
"""
Created on Sun Apr 24 21:36:56 2016

@author: yangbo
"""

import sys
import os
import numpy as np
import pandas as pd
from numpy import *
from pandas import DataFrame
os.chdir("/Users/yangbo/Documents/2016 spring/research/tensordata_compos/")
os.getcwd()
from numpy.linalg import norm, inv
from matplotlib import pyplot as plt
from time import time
import math 
from numpy import linalg as LA 
#M=np.loadtxt("tensor_vso_freq.txt") #839016*4
M=np.loadtxt("PMI.txt") #839016*4

#W=np.loadtxt("tensor_vso_freq.txt")
W=np.loadtxt("W.txt")
#matrix = {(0, 3): 1, (2, 1): 2, (4, 3): 3}
M[:,0]=M[:,0]-1
M[:,1]=M[:,1]-1
M[:,2]=M[:,2]-1

t1=max(M[:,0]) #989
t2=max(M[:,1]) #10057
t3=max(M[:,2]) #10054
# Since t2 is slightly larger than t3, so I'll use t2 as number of nouns when constructing tensor
#T = np.zeros(shape=(t1,t2,t2))
M=M.astype(int) 
t1_integer=t1.astype(int) 
t2_integer=t2.astype(int) 
t3_integer=t3.astype(int) 
#for i in range(t2_integer):
#    v=M[i];
#    T[(v[0],v[1],v[2])]=v[3];
#WT=W.transpose() 

#T=np.zeros(shape=(989,300,300)); # get core tensor of size 989*300*300
#for i in range(839016):
#    t=np.zeros(989);
#    vi=M[i,0]
#    si=M[i,1]
#    oi=M[i,2]
#    vs=[t,W[si,:],W[oi,:]]
#    n=M[i,4]
#    T=T+n*reduce(np.multiply, np.ix_(*vs))
#    print(i)

T=np.zeros(shape=(989,300,300)); # get core tensor of size 989*300*300
for i in range(839016):
    t=np.zeros(989);
    vi=M[i,0]
    si=M[i,1]
    oi=M[i,2]
    n=M[i,4]
    T[vi,:,:]=T[vi,:,:]+n*np.outer(W[si,:],W[oi,:])
    print(i) #print takes time, though.  you should eventually suppress it.


#np.max(T) #1072893230512451 e15
#Max=10e+14
#T_new=T/Max
#np.max(T_new)
#
#x = np.random.rand(3,3)
#X=10*x
#

#n=np.zeros(839016) # n stores the value of pmi*tensor, and 839016 is the total number of word counts in the dataset
#T=np.zeros(shape=(989,300,300)); # get core tensor of size 989*300*300
#for i in range(989):
#    for j in range(10057):
#        for k in range(10057):
#            t=np.zeros(989);
#            t[i]=1;
#            vs=[t,W[j,:],W[k,:]] #outer product of vectors t(989),W1(300),W2(300)
#            T=T+reduce(np.multiply, np.ix_(*vs)) # 
# 
#           
#            
#            for l in range(839016):
#                if M[l,1]==i and M[l,2]==j and M[l,3]==k:
#                    n[l]=M[l,5]; # get pmi*tensor value of index (i,j,k)
#                                  
#for i in range(989):
#    for j in range(10057):
#        for k in range(10057):
#            for l in range(839016):
#                if M[l,1]==i and M[l,2]==j and M[l,3]==k:
#                    n[l]=M[l,5]; # get pmi*t
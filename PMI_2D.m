function [PI] = PMI_2D(N)
% pointwise mutual information operator [I,Pxy] = pmi(N)
%
% From a count matrix, N, describing the occurrence of joint events of two
% different phenomena, this obtains the pointwise mutual information (I) in bits of
% those events, which is the logarithm (base 2) of the quotiens of the joint
% probability by the marginals. 
%
% The MLE of the joint probability distribution [Pxy] can also be requested
% 
% The weighted pointwise mutual information (WI) can be easily calculated
% from these, as well as other statistics. Remember that 0*log 0 = 0 by
% convention.
%  WPI = Pxy.*I;
%  WPI(Pxy==0)=0;
% Hence the average mutual information MI is:
%  MI = sum(sum(WPI))
%
% THis works for either sparse of full N matrices.

%Build the contingency matrix, then the MLE estimate of the joint
%probabilites.

Ni = sum(N,2);%column of row marginal counts
Nj = sum(N,1);%row of column marginal counts
Nt = sum(Ni);%either the sum of the row or columns marginal counts.
NiNj = Ni* Nj;
PI = (double(N) * Nt)./ NiNj;%pointwise quotient of probs.
PI = log2(PI);%This is bad for sparse matrices, but integer matrices cannot be sparse in matlab!
PI(PI<0)=0;
end
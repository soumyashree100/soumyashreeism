%% This function is p part of orginal matlab function named "nsdcalc.m" 
%  written by Cooper and Cowan (2008). This part of the code used as per
%  the instruction provided at http://software.seg.org/disclaimer.txt
%% ******************************************************
% Copyright (c) 2008 by the Society of Exploration Geophysicists.
% For more information, go to http://software.seg.org/2008/0001 .
% You must read and accept usage terms at:
% http://software.seg.org/disclaimer.txt before use.
%
% Revision history:
% Original SEG version March 2008.
% ******************************************************
% ******************************************************
% *** Normalised standard deviation analysis
% *** GRJ Cooper Jan'07
% *** For best results optimise the histogram of the output
% *** after processing is complete
% *** Tested using Matlab 2007b under Windows XP SP2
% ******************************************************
% *** grcooper@iafrica.com
% *** www.wits.ac.za/science/geophysics/gc.htm
% ******************************************************
%%reference: Cooper, G.R.J. and Cowan, D.R. (2008). Edge 
% Enhancement of potential-field datausing normalized statistics
% Geophysics. Vol. 73, No. 3, P.H1-H4, DOI: 10.11901/1.2837309
%%
function dz=vertical(data,npts,nc,nr,xint)   
cdiff=floor((npts-nc)/2); rdiff=floor((npts-nr)/2);
data1=taper2spline(data,npts,nc,nr,cdiff,rdiff);
f=fft2(data1); fz=f;
wn=2.0*pi/(xint*(npts-1));
f=fftshift(f);
cx=npts/2+1; cy=cx;
for I=1:npts
 freqx=(I-cx)*wn;
 for J=1:npts
  freqy=(J-cy)*wn;
  freq=sqrt(freqx*freqx+freqy*freqy);
  fz(I,J)=f(I,J)*freq;
 end
end
fz=fftshift(fz); fzinv=ifft2(fz);
dz=real(fzinv(1+rdiff:nr+rdiff,1+cdiff:nc+cdiff));
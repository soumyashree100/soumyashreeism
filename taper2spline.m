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
function gt=taper2spline(g,npts,nc,nr,cdiff,rdiff)
% Merge edges to the value opposite using a cubic spline

gt=zeros(npts); gt(rdiff+1:rdiff+nr,cdiff+1:cdiff+nc)=g;
gp=g(:,1:3);     [gpx1,junk]=gradient(gp);  
gp=g(:,nc-2:nc); [gpx2,junk]=gradient(gp);
x1=0; x2=(2*cdiff)+1;
x=[1 1 0 0;x1 x2 1 1; x1^2 x2^2 2*x1 2*x2; x1^3 x2^3 3*x1^2 3*x2^2]; 
for I=1:nr
 y=[g(I,nc) g(I,1) gpx2(I,3) gpx1(I,1)];
 c=y/x;
 for J=1:cdiff
  gt(I+rdiff,J)=c(1)+(J+cdiff)*c(2)+c(3)*(J+cdiff)^2+c(4)*(J+cdiff)^3;
  gt(I+rdiff,J+nc+cdiff)=c(1)+J*c(2)+c(3)*J^2+c(4)*J^3;
 end
end
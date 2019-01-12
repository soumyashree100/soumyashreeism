#### INSTRUCTION FOR USING GMEDGE ####

GMEDGE is a MATLAB based application uses for performing the edge detection
and enhancement technique in potential field data. GMEDGE contain total 32 edge
detection and enhancement technique. 

The main application folder(GMEDGE) conatin:
** GMEDGE.mlapp
** a synthetic gravity data (in ASCII format)
** three matlab function ("vertical.m", "taper2spline.m" , "readgrid.m")
** output files (.CSV format)
** Readme.txt


### NOTES ##

** the application runs with the help of three matlab function
            1. vertical.m       [this is a part of original matlab function nsdcalc.m (Cooper and Cowan, 2014)]
	    2. taper2spline.m   [this is a part of original matlab function nsdcalc.m (Cooper and Cowan, 2014)]
	    3. readgrid.m
** use ASCII grid for input data.
** the final output is in .CSV format. which contain three column i.e. longitude(E-W), latitude(N-S) and data respectively.


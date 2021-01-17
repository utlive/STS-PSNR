STS-PSNR Software release.

=======================================================================
-----------COPYRIGHT NOTICE STARTS WITH THIS LINE------------
Copyright (c) 2018 Beijing Institude of Technology and The University of Texas at Austin
All rights reserved.

Permission is hereby granted, without written agreement and without license or royalty fees, to use, copy, 
modify, and distribute this code (the source files) and its documentation for
any purpose, provided that the copyright notice in its entirety appear in all copies of this code, and the 
original source of this code, Laboratory for Image and Video Engineering (LIVE, http://live.ece.utexas.edu)
and Center for Perceptual Systems (CPS, http://www.cps.utexas.edu) at the University of Texas at Austin (UT Austin, 
http://www.utexas.edu), is acknowledged in any publication that reports research using this code. The research
is to be cited in the bibliography as:

L. Liu, T. Wang, H. Huang, and A. C. Bovik, "Video Quality Assessment Using Space-Time Slice Mappings," Signal Processing: Image Communication, Vol. 82, Art. No. 115749, Mar. 2020.

IN NO EVENT SHALL THE UNIVERSITY OF TEXAS AT AUSTIN BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, 
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS DATABASE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY OF TEXAS
AT AUSTIN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

THE UNIVERSITY OF TEXAS AT AUSTIN SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE DATABASE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS,
AND THE UNIVERSITY OF TEXAS AT AUSTIN HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

-----------COPYRIGHT NOTICE ENDS WITH THIS LINE------------%

=======================================================================
Authors : Lixiong Liu and Tianshu Wang
Version : 1.0

The authors are with the School of School of Computer Science and Technology, Beijing Institute of Technology, Beijing 100081, China

Kindly report any suggestions or corrections to lxliu@bit.edu.cn or wangts@bit.edu.cn

=======================================================================

This is a demonstration of the STS-PSNR. The algorithm is described in:

L. Liu, T. Wang, H. Huang, and A. C. Bovik, "Video Quality Assessment Using Space-Time Slice Mappings," Signal Processing: Image Communication, Vol. 82, Art. No. 115749, Mar. 2020.

You can change this program as you like and use it anywhere, but please
refer to its original source.


========================================================================

Running on Matlab and Python

Input : A reference and a test video sequence.

Output: A quality score of the test video.
  
Usage:

Run main.m to obtain the STS based map scores, run net_test.py to get the final video score.

Dependencies: 

torch, numpy, scipy.

MATLAB files: 
	FGr.m,
	FRStsFullMap.m,
	getSpatialScore.m,
	getTemporalScore.m,
	main.m,
	method_2D.m,
	psnrcc.m,
	Yuv2Frame.m
    (all provided with release)

PYTHON filtes:
	net_test.py (provided with release)

Model files:
    edfe_filter.mat 
    params.pkl 
    (all provided with release)

========================================================================

NOTE: The model we provided is trained on LIVE video Database

========================================================================



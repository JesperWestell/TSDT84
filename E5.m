load('E5B.mat');
load('E5C.mat');
load('E5D.mat');
load('E5F.mat');
pause;
%% Butterworth
[B,A] = butter(10,2*pi*100,'low','s');
pzchange(in(B,A,'s'));
pause;
%% Chebyshev
[B,A] = cheby1(5,3,2*pi*100,'s');
pzchange(in(B,A,'s'));
pause;
%% Bandpass
pzchange(bandpass);
pause;
%%DTMF
load dtmf;
TONER = foutr(toner);
Y = output(TONER,bandpass);
y = ifoutr(Y);
signal(y);
pause;
spect(Y);


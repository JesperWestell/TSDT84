%% a
load E7_a.mat
pzchange(H1z);
%% b, A
load E7_b.mat
pzchange(HA);
pause;
load E7_b.mat
pzchange(HB);
%% Butter low pass
[B,A] = butter(5,2*0.15,'low');
Hbutter = in(B,A,'z');
pzchange(Hbutter);
%% Cheby low pass
[B,A] = cheby1(5,3,2*0.15,'low');
Hcheby = in(B,A,'z');
pzchange(Hcheby);
%% Butter high pass
[B,A] = butter(5,2*0.15,'high');
Hbutter = in(B,A,'z');
pzchange(Hbutter);
%% Cheby high pass
[B,A] = cheby1(5,3,2*0.15,'high');
Hcheby = in(B,A,'z');
pzchange(Hcheby);
%% DTMF
load dtmf.mat;
T=toner(65537);
Dtoner=[toner 0 0 0];
N=30;
%%subplot(2,1,1), signalmod(toner,N*T);
%%subplot(2,1,2), signalmod(Dtoner,N);
TONER=foutr(toner); 
DTONER=foutr(Dtoner);
%%spect(TONER,DTONER);
%%subplot(2,1,1), axis([0 3200 0 2]);
[B,A] = cheby1(4,3,[2*pi*941 2*pi*1209],'bandpass','s');
BANDPASSkont = in(B,A,'s');
[B,A] = cheby1(4,3,[2*0.147 2*0.1889],'bandpass');
BANDPASSdisk = in(B,A,'z');

pzchange(BANDPASSkont);
pause;
pzchange(BANDPASSdisk);
%pause;
%logspect(BANDPASSkont,BANDPASSdisk);
%%
Y1 = output(TONER,BANDPASSkont);
Y2 = output(DTONER,BANDPASSdisk);
spect(Y1,Y2);
%%
signal(ifoutr(Y1),ifoutr(Y2));

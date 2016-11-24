%% A
p = in('pulse(t,0,5)','t');
P = foutr(p);
spect(P,2)
%% B
pause;

s1 = in('sin(2*pi*200*t)*pulse(t,0,1/5)','t');
s2 = in('sin(2*pi*200*t)*pulse(t,0,1/40)','t');

S1 = foutr(s1);
S2 = foutr(s2);

spect(S1,S2,400);
subplot(2,1,1), set(gca,'xlim',[175,225]);
ohfig

%% C
pause;
load dtmf;
signal(toner,5)
pause;
spect(foutr(toner))

%% D
pause;
spect (foutr(ton),2000)
pause;
signal(ton)
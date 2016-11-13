% 3a
D = fouser('(pulse(t,0,1)+pulse(t,7,8))',8);
D_pwr = pwr(D);

% ?kar antalet deltoner som sl?pps igenom tills minst 94 procent av
% signalmedeleffekten sl?pps igenom
for f=1:20
    res = pwr(remtone(D,'lp',f));
    percentage = (res./D_pwr).*100;
    if (percentage > 94)
        output = ['Lowest possible overtone: ', num2str(f)]
        break;
    end
end

%6 deltoner kr?vs 
pause;

%%
% ?kar gr?nsfrekvensen p? l?gpassfiltret med 0.001 Hz tills minst 94 procent av
% signalmedeleffekten sl?pps igenom

for f=1:1000
    res = pwr(lp(D,f./1000));
    percentage = (res./D_pwr).*100;
    if (percentage > 94)
        output = ['Lowest frequency is: ', num2str(f./1000), ' Hz!']
        freq = f./1000;
        break;
    end
end

% 0.626 Hz

pause;

%%
y = remtone(D,'lp',6);
signal(y);

pause;

spect(D,y);
ohfig
pause;
%%
for t=1:50
    signal(remtone(D,'lp',3*t),remtone(D,'hp',3*t));
    ohfig
    pause;
end


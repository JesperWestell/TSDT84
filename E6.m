%% ha
load E6_h.mat;
n = -5:19;
clf; stem(n,ha,'k'); xlabel('n'); ylabel('h[n]');
%% hb
load E6_h.mat;
n = -5:19;
clf; stem(n,hb,'k'); xlabel('n'); ylabel('h[n]');
%% hd
load E6_h.mat;
n = -5:19;
clf; stem(n,hd,'k'); xlabel('n'); ylabel('h[n]');
%% x1
falta;
%% x2
n=0:50;
x=inline('2*(n>=5 & n<20)','n');    % x[n]=2(u[n-5]-u[n-20])
h=inline('1*(n>=2 & n<10)','n');    % h[n]=u[n-2]-u[n-10]

subplot(2,1,1)
stem(n,x(n-10),'b');hold on, 
stem(n,h(n),'r');hold off
xlabel('n')
title('x[n]  (bl?)  & h[n]  (r?d)')

y=conv(x(n-10),h(n));       % y[n]=x[n]*h[n]  (faltning)
subplot(2,1,2) 
stem(n,y(1:length(n)));  % Ty length(y) = length(x)+length(h)-1
xlabel('n')
title('y[n]')
%% x3
n=0:50;
x=inline('cos(pi*n/6).*(n>=0)','n');    % x[n]=2(u[n-5]-u[n-20])
h=inline('1.5*((0.95).^n).*(n>=0 & n<11)','n');    % h[n]=u[n-2]-u[n-10]

subplot(2,1,1)
stem(n,x(n),'b');hold on, 
stem(n,h(n),'r');hold off
xlabel('n')
title('x[n]  (bl?)  & h[n]  (r?d)')

y=conv(x(n),h(n));       % y[n]=x[n]*h[n]  (faltning)
subplot(2,1,2) 
stem(n,y(1:length(n)));  % Ty length(y) = length(x)+length(h)-1
xlabel('n')
title('y[n]')


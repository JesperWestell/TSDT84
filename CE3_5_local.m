n = -5:19;   % Anm: I boken st?r det (0:19), men fr?n -5 ?r l?mpligare
x = inline('n==0');     % = enhetsimpulsen
a = [1 0 0]; b = [2 -2 0];
h = filter(b,a,x(n));
clf; stem(n,h,'k'); xlabel('n'); ylabel('h[n]');

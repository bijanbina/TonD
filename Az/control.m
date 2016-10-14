%% tic toc
tic
s = 1:30000;
toc
%% find tf function, residue create Partial Fractions
G = tf([1 7.9 14.7],[ 1 36 385 1350 1000 ]);
l_zero = roots([1 7.9 14.7])
l_pole = roots([ 1 36 385 1350 1000 ])
[l_b,l_a] = residue([1 7.9 14.7],[ 1 36 385 1350 1000 ])
l_b./l_a
%% state space, derivative on one side
A = [ 0 -2 ; 3 -2 ];
B = [ 1 ; 0.5 ];
C = [ 1  -1 ];
D = 0;
[ l_a , l_b ] = ss2tf(A,B,C,D);
%% create tranfer function with zeros and poles
GH = zpk(-2,[ 1 2.5 10],1);
rlocus(GH)
figure
bode(GH)
figure
nyquist(GH)
%% delay
s=tf('s');
s/(s+1)*exp(-2*s)

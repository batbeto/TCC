clc
clear
nCam = 5;
r = [10 50 100 20 400];    % resistivity (Ohm-m)
t = [2 15 20 25];
ab = [1 2 5 10 30 50 100 200 300 400 500 600 700 800 900 1000]
m = [r t] %100 10 100 10 4 20 20
rhoa = mod1Dres(m, ab, nCam);

r_ruido2 = rhoa + 0.025 * randn(size(rhoa)).* rhoa;
loglog(ab, rhoa)
hold on
loglog(ab, r_ruido2, '*')
save('r_ruido2.mat', 'r_ruido2');

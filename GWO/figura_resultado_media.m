clc;
clear;


nCam = 4;
ab = [1 2 5 10 30 50 100 200 300 400 500 600 700 800 900 1000];
load r_ruido1.mat
dcal = @(m,ab,nCam) mod1Dres(m, ab, nCam)

mVer = [100 10 100 10 4 20 20];
load m1.mat;
load m2.mat;
load m3.mat;
load m4.mat;
load m5.mat;
load m6.mat;
load m7.mat;
load m8.mat;
load m9.mat;
load m10.mat;

M = [m1; m2; m3; m4; m5; m6; m7; m8; m9; m10];

mMedia1 = mean(M);
save('mMedia1.mat','mMedia1');



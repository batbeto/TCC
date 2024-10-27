clc;
clear;

load m2_1.mat;
load m2_2.mat;
load m2_3.mat;
load m2_4.mat;
load m2_5.mat;
load m2_6.mat;
load m2_7.mat;
load m2_8.mat;
load m2_9.mat;
load m2_10.mat;


M = [m1;m2;m3;m4;m5;m6;m7;m8;m9;m10];
m_est = mean(M);

d_padrao = std(M);


save('M_m2.mat','M');
save('m_est_m2.mat','m_est');
save('d_padrao_m2.mat','d_padrao');


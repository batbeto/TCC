clc;
clear;

load m1_1;
load m1_2;
load m1_3;
load m1_4;
load m1_5;
load m1_6;
load m1_7;
load m1_8;
load m1_9;
load m1_10;


M = [m1;m2;m3;m4;m5;m6;m7;m8;m9;m10];
m_est = mean(M);

d_padrao = std(M);


save('M_m1.mat','M');
save('m_est_m1.mat','m_est');
save('d_padrao_m1.mat','d_padrao');


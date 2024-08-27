clc;
clear;

load m2_1;
load m2_2;
load m2_3;
load m2_4;
load m2_5;
load m2_6;
load m2_7;
load m2_8;
load m2_9;
load m2_10;


M = [m1;m2;m3;m4;m5;m6;m7;m8;m9;m10];
m_est = mean(M);

d_padrao = std(M);

clc;
clear;

load dadoReal_r1.mat;
load dadoReal_r2.mat;
load dadoReal_r3.mat;
load dadoReal_r4.mat;
load dadoReal_r5.mat;
load dadoReal_r6.mat;
load dadoReal_r7.mat;
load dadoReal_r8.mat;
load dadoReal_r9.mat;
load dadoReal_r10.mat;


M = [r1;r2;r3;r4;r5;r6;r7;r8;r9;r10];
m_est = mean(M);

d_padrao = std(M);


save('M_real.mat','M');
save('m_est_real.mat','m_est');
save('d_padrao_real.mat','d_padrao');


close all
clear
clc

dadosReais = [
    2, 4.75;
    3, 6.5;
    4, 8.85;
    5, 11;
    6, 13;
    8, 17.1;
    10, 19.6;
    15, 16.4;
    20, 12.8;
    30, 8.6;
    40, 6.2;
    50, 5.6;
    80, 7.7;
    100, 9.6;
    150, 13.3;
    200, 15;
    250, 16;
    300, 17.5;
    400, 18;
    500, 19.5;
];

%sev 2 do conjunto 1 da tabela 16 retirado de citeonline
lb = [0.1 0.1 0.1 1 1 1 10];
ub = [5 5 20 10 10 20 100];

ab = dadosReais(:,1);
dadoReal = dadosReais(:,2);


nCam = 4;
%r = [10,50,100,20,400];    % resistivity (Ohm-m)
%t = [2,15,20,25];

%m = [r t];
N = 300; % Number of search agents
Max_iteration = 1000; % Maximum numbef of iterations
dcal = @(m,ab,nCam) mod1Dres(m, ab, nCam);

dim = length(lb);

fobj = @(m) (1/length(dadoReal)) * norm(dadoReal - dcal(m, ab, nCam))^2;


[fval,r1,Convergence_curve]=WOA(N,Max_iteration,lb,ub,dim,fobj);
%Draw objective space
save('dadoReal_r1.mat','r1');
%save('r_ruido1.mat', 'r_ruido1');
%semilogy(Convergence_curve,'Color','r')
%xlabel('Iteração','fontweight','bold','fontsize',10);
%ylabel('Função objetivo','fontweight','bold','fontsize',10);
%title('Objective space')

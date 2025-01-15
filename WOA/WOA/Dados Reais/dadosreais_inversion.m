close all
clear
clc


dadoReal = [20 80 20 10 20];

lb = [5 30 5 1 5];
ub = [50 150 50 20 50];

ab = [5 10 20];

nCam = 3;
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

close all
clear
clc

dadosReais = [3 33.729
5 12.388
7 8.790
10 8.299
14 7.998
20 7.396
28 6.699
40 6.592
55 6.887
80 7.194
100 7.096
150 8.590
200 9.099
300 8.790
400 9.594
500 11.194
1000 22.699
1500 31.769
2000 41.879
3000 57.677
4000 79.799
6000 122.744
8000 155.597
10000 149.279];


ab = dadosReais(:,1);
dadoReal = dadosReais(:,2);


nCam = 3;
%r = [10,50,100,20,400];    % resistivity (Ohm-m)
%t = [2,15,20,25];

%m = [r t];
N = 300; % Number of search agents
Max_iteration = 500; % Maximum numbef of iterations
dcal = @(m,ab,nCam) mod1Dres(m, ab, nCam);

%50 10 1000 2 300 MODELO ESTIMADO DE OCCAM
lb = [1 1 300 0.1 500];
ub = [200 25 2000 20 1500];
dim = length(lb);

fobj = @(m) (1/length(dadoReal)) * norm(dadoReal - dcal(m, ab, nCam))^2;


[fval,r10,Convergence_curve]=WOA(N,Max_iteration,lb,ub,dim,fobj);
%Draw objective space
save('dadoReal_r10.mat','r10');
%save('r_ruido1.mat', 'r_ruido1');
%semilogy(Convergence_curve,'Color','r')
%xlabel('Iteração','fontweight','bold','fontsize',10);
%ylabel('Função objetivo','fontweight','bold','fontsize',10);
%title('Objective space')

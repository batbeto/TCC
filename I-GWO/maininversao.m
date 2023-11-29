%___________________________________________________________________%
%  An Improved Grey Wolf Optimizer for Solving Engineering          %
%  Problems (I-GWO) source codes version 1.0                        %
%                                                                   %
%  Developed in MATLAB R2018a                                       %
%                                                                   %
%  Author and programmer: M. H. Nadimi-Shahraki, S. Taghian, S. Mirjalili                                                %
%                                                                   %
%         e-Mail:nadimi@ieee.org, shokooh.taghian94@gmail.com,                                         ali.mirjalili@gmail.com                                                   %
%                                                                   %
%                                                                   %
%       Homepage:http://www.alimirjalili.com                                                   %
%                                                                   %
%   Main paper: M. H. Nadimi-Shahraki, S. Taghian, S. Mirjalili     %
%               An Improved Grey Wolf Optimizer for Solving         %
%               Engineering Problems , Expert Systems with          %
%               Applicationsins, in press,                          %
%               DOI: 10.1016/j.eswa.2020.113917                     %
%___________________________________________________________________%
%___________________________________________________________________%
%  Grey Wold Optimizer (GWO) source codes version 1.0               %
%                                                                   %
%  Developed in MATLAB R2011b(7.13)                                 %
%                                                                   %
%  Author and programmer: Seyedali Mirjalili                        %
%                                                                   %
%         e-Mail: ali.mirjalili@gmail.com                           %
%                 seyedali.mirjalili@griffithuni.edu.au             %
%                                                                   %
%       Homepage: http://www.alimirjalili.com                       %
%                                                                   %
%   Main paper: S. Mirjalili, S. M. Mirjalili, A. Lewis             %
%               Grey Wolf Optimizer, Advances in Engineering        %
%               Software , in press,                                %
%               DOI: 10.1016/j.advengsoft.2013.12.007               %
%                                                                   %
%___________________________________________________________________%

% You can simply define your cost in a seperate file and load its handle to fobj
% The initial parameters that you need are:
%__________________________________________
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of generations
% N = number of search agents
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% If all the variables have equal lower bound you can just
% define lb and ub as two single number numbers

% To run I-GWO: [Best_score,Best_pos,GWO_cg_curve]=IGWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj)
%__________________________________________

close all
clear
clc

nCam = 4;
%r = [100,60,30,10];    % resistivity (Ohm-m)
%t = [10,15,30];
ab = [1 2 5 10 30 50 100 200 300 400 500 600 700 800 900 1000];
%m = [r t];
N = 300; % Number of search agents
Max_iteration = 300; % Maximum numbef of iterations
load r_ruido1.mat
dcal = @(m,ab,nCam) mod1Dres(m, ab, nCam)

%100 10 100 10 4 20 20 M VER
lb = [1 1 1 1 1 1 1];
ub = [ 500 50 500 50 10 50 50];
dim = length(lb);

fobj = @(m) 1/length(r_ruido1) * norm(r_ruido1 - dcal(m, ab, nCam))

[fval,m,Convergence_curve]=IGWO(dim,N,Max_iteration,lb,ub,fobj);

%Draw objective space
semilogy(Convergence_curve,'Color','r')
title('Objective space')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid on
box on
legend('I-GWO')



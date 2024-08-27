close all;

clc;

clear;

load r_ruido1.mat;

% Load model for forward modeling
modelr = [350 50 1000]; % modelo de resistividade verdadeiro (Ohm-m)
modelt = [20 10]; % modelo de espessura verdadeiro (m)
mmodel = [modelr modelt]; % modelo verdadeiro
ab = [1 2 5 10 30 50 100 200 300 400 500 600 700 800 900 1000];
nCam = 3;

load(mMedia1);

m = mMedia1;

lr = length(modelr);
lt = length(modelt);

r_est = m(1:lr);
t_est = m(1+lr:lr+lt);

%[rhoa_calc, phase_calc] = modelagem1DMT(r_est, t_est, frequency);
rhoa_calc = @(m,ab,nCam) mod1Dres(m, ab, nCam)
subplot(2,2,1)

loglog(ab,rhoa_calc,'-','color','b','LineWidth',2)
hold on
loglog(ab,r_ruido1, '.','color','r','MarkerSize',15)
grid on
axis tight
xlabel('\bf \fontsize{10}\fontname{Times}Ab/2');
ylabel('\bf \fontsize{10}\fontname{Times}Resistividade Aparente (Ohm.m)');
%title(['\bf \fontsize{12}\fontname{Times}RESPONS - LM || RMS : ', num2str(rms_error),' || iter : ', num2str(iter)]);
leg = legend('Resistividade Aparente calculada','Resistividade Aparente Observada');
%set(leg,'Location','South','fontsize',8);
set(leg,'fontsize',8);
hold off

r = m(1:lr);
t = m(1+lr:lr+lt);
rr = [0,r];
tt = [0,cumsum(t),max(t)*5];
modelrr = [0,modelr];
modeltt = [0,cumsum(modelt),max(modelt)*5];

subplot(2,2,2);
hold off
stairs(modelrr,modeltt,'-','color','r','LineWidth',2);
hold on
stairs(rr,tt,'b','LineWidth',2);
% '.','color','r','MarkerSize',15
set(gca,'Ydir','reverse');
set(gca,'Xscale','log');
leg = legend('Verdadeiro','Estimado');
%set(leg,'Location','South','fontsize',8);
set(leg,'fontsize',8);
%axis([1 15000 0 2000]);
grid on
xlabel('Resistividade (Ohm-m)','fontweight','bold','fontsize',10);
ylabel('Profundidade (m)','fontweight','bold','fontsize',10);
set(gca,'XTick',[1e-3 1e-2 1e-1 1 1e1 1e2 1e3 1e4]);

%subplot(2,2,3);
%plot(1:Max_iteration,Convergence_curve.^2,'-','color','b','LineWidth',2)
%xlabel('Iteração','fontweight','bold','fontsize',10);
%ylabel('Função objetivo','fontweight','bold','fontsize',10);
%grid on









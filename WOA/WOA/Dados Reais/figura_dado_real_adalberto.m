% Limpeza do ambiente
close all;
clc;
clear;

% Dados observados
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


ab = dadosReais(:, 1); % Posições
dadoReal = dadosReais(:, 2); % Resistividade observada

% Carregar modelo estimado
load m_est_real.mat; % Certifique-se de que esse arquivo contém a variável `m_est`
m = m_est; % Modelo estimado

% Definições do modelo
lr = 3; % Número de resistividades
lt = 2; % Número de espessuras
nCam = 3; % Número de camadas

r_est = m(1:lr); % Resistividades estimadas
t_est = m(lr+1:lr+lt); % Espessuras estimadas

% Função para cálculo da resistividade
dCal = @(m, ab, nCam) mod1Dres(m, ab, nCam); % Certifique-se que `mod1Dres` esteja implementada
rhoa_calc = dCal(m, ab, nCam); % Resistividade calculada

% Plot 1: Resistividade aparente
figure;
subplot(1, 2, 1);
loglog(ab, rhoa_calc, '-b', 'LineWidth', 2); % Calculado
hold on;
loglog(ab, dadoReal, '.r', 'MarkerSize', 15); % Observado
grid on;
xlabel('Ab/2 (m)', 'FontWeight', 'bold', 'FontSize', 10);
ylabel('Resistividade Aparente (\Omega·m)', 'FontWeight', 'bold', 'FontSize', 10);
legend('Resistividade Calculada', 'Resistividade Observada', 'FontSize', 8);
title('Comparação de Resistividades', 'FontWeight', 'bold');
hold off;

% Modelo verdadeiro (suposição)
modelr = [50, 10, 1000]; % Resistividades verdadeiras (exemplo)
modelt = [2, 300]; % Espessuras verdadeiras (exemplo)

% Preparo para o plot do modelo
rr = [0, r_est];
tt = [0, cumsum(t_est), max(t_est)*5]; % Profundidade estimada
modelrr = [0, modelr];
modeltt = [0, cumsum(modelt), max(modelt)*5]; % Profundidade verdadeira

% Plot 2: Perfil de resistividade
subplot(1, 2, 2);
stairs(modelrr, modeltt, '-r', 'LineWidth', 2); % Modelo verdadeiro
hold on;
stairs(rr, tt, '-b', 'LineWidth', 2); % Modelo estimado
set(gca, 'YDir', 'reverse'); % Inverter eixo Y
set(gca, 'XScale', 'log'); % Escala logarítmica no eixo X
grid on;
xlabel('Resistividade (\Omega·m)', 'FontWeight', 'bold', 'FontSize', 10);
ylabel('Profundidade (m)', 'FontWeight', 'bold', 'FontSize', 10);
legend('Modelo Verdadeiro', 'Modelo Estimado', 'FontSize', 8);
title('Perfil de Resistividade', 'FontWeight', 'bold');
hold off;


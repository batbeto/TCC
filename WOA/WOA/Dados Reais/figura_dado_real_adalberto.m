% Limpeza do ambiente
close all;
clc;
clear;

% Dados observados
dadosReais = [
    3 33.729; 5 12.388; 7 8.790; 10 8.299; 14 7.998;
    20 7.396; 28 6.699; 40 6.592; 55 6.887; 80 7.194;
    100 7.096; 150 8.590; 200 9.099; 300 8.790; 400 9.594;
    500 11.194; 1000 22.699; 1500 31.769; 2000 41.879;
    3000 57.677; 4000 79.799; 6000 122.744; 8000 155.597; 10000 149.279
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


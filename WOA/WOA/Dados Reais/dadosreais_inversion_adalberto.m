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

% Configurações gerais
lb = [0.1 0.1 0.1 1 1 1 10];
ub = [5 5 20 10 10 20 100];

ab = dadosReais(:,1);
dadoReal = dadosReais(:,2);

nCam = 4;
N = 300; % Número de agentes
Max_iteration = 500; % Número máximo de iterações

dcal = @(m,ab,nCam) mod1Dres(m, ab, nCam);

dim = length(lb);
fobj = @(m) (1/length(dadoReal)) * norm(dadoReal - dcal(m, ab, nCam))^2;

% Loop para 10 repetições
for i = 1:10
    [fval, r, Convergence_curve] = WOA(N, Max_iteration, lb, ub, dim, fobj);

    % Salva os resultados em arquivos distintos
    varName = sprintf('r%d', i);
    fileName = sprintf('dadoReal_%s.mat', varName);
    save(fileName, varName);

    % Salva a variável na workspace (opcional)
    assignin('base', varName, r);
end


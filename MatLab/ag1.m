% Implementacao de um AG binario canonico para encontrar o maximo da
% funcao f(x)=x^2, 0<=x<=31.
%

clear; clc;

%%% Parametros do AG
N=6;     % Tamanho da populacao
M=10;    % Tamanho do cromossomo (no. de genes)
pc=0.9;  % Probabilidade de cruzamento
pm=0.1; % Probabilidade de mutacao
Ng=20;   % Numero de geracoes

%%% Geracao da populacao inicial 
P=round(rand(N,M));

%%% Calcula fitness da populacao inicial
[X F Fn]=aptidao(P);  % Retorna a aptidão de cada individuo da populacao

%%% Roda AG por Ng geracoes

for t=1:Ng,
    geracao=t,
    S=selecao_torneio(P,Fn);
    P=cruzamento(P,S,pc);
    P=mutacao(P,pm)
    [X F Fn]=aptidao(P);
    BestFit(t) = min(F);
    MedianFit(t) = mean(F);
    F,X
    %pause
end

X = 1:1:Ng;
plot(X, BestFit, X, MedianFit),xlabel('Geracao'),ylabel('Valores de Fitness'), legend('Melhor Fitness', 'Fitness Medio'),
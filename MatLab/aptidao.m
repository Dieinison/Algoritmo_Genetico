function [X,F,Fn]=aptidao(P);
% Calcula aptidao dos individuos da populacao P
% Entrada:
%    P - Matriz binaria representando os individuos de uma geracao
%    nas linhas e os genes nas colunas
% Saida:
%    X - Fenotipo,  i.e. valores correspondentes em base decimal aos 
%        numeros binarios codificados nos individuos da populacao P 
%    F - Valores correspondentes da funcao de aptidao para os individuos 
%        da populacao P
%    Fn - Valores normalizados das aptidoes dos individuos da populacao 

n=size(P);

for i=1:n(1),
    %X(i)=bi2de(P(i,:),'left-msb'),   % No Matlab
    X(i)=bina2deci(P(i,1:5)),
    pause
    
    Y(i)=bina2deci(P(i,6:10)),
    pause
    
    F(i)= 1/(20+ X(i)**2 + Y(i)**2 - 10*(cos(2*(3.1415)*X(i))+cos(2*(3.1415*Y(i)))));   % Armazena aptidoes brutas
end
Fn=F/sum(F);  % Aptidoes normalizadas

X=X';
F=F';
Fn=Fn';

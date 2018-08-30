clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entrada das variáveis

%f = input('Entre com a funcao: ', 's');
f = 'x.^3 - 9*x + 3';
f = inline(f);
%df = input('Entre com a derivada da funcao: ','s');
df = '3*x.^2 - 9';
df = inline(df);
%x0 = input('Entre com o primeiro ponto: ');
x0 = -1.275;
%tol = input('Entre com a tolerancia: ');
tol = 0.05;
%while (abs(df(x0)) < tol)
%  x0 = input('Nao existe solucao usando o valor inicial inserido, por favor, insira outro: ');
%endwhile
nmax = input('Entre com o numero maximo de iteracoes: ');

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Metodo de Newton

n = 0;
x1 = x0 - (f(x0)/df(x0));

while(n < nmax)
  if (abs(df(x1)) < tol)
    % Vai pro Metodo de Newton Modificado
    break;
  endif

  if ((abs(f(x1)) < tol) || ((abs(x1 - x0) / abs(x1)) < tol))
    fprintf('A solucao eh: %f\n', x1);
    return;
  endif
  
  x0 = x1;
  x1 = x0 - (f(x0)/df(x0));
  n = n+1;
  
  %if (abs(df(x1)) < tol)
  %  % Vai pro Metodo de Newton Modificado
  %  break;
  %endif
endwhile

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Metodo de Newton Modificado

fprintf('\n\n--ATENCAO: O Metodo de Newton falhou e seguiu para a versao modificada--\n');

dfconst = df(x0);
while(n < nmax)
  if ((abs(f(x1)) < tol) || ((abs(x1 - x0) / abs(x1)) < tol))
    fprintf('A solucao eh: %f', x1);
    return;
  endif
  
  x0 = x1
  x1 = x0 - (f(x0)/dfconst)
  n = n+1;
endwhile

if (n >= nmax)
  fprintf('\nO programa excedeu o numero maximo de iteracoes, a resposta eh: %f\n\n', x0);
  return;
endif
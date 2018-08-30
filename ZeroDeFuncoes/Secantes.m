clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entrada das variáveis

f = input('Entre com a funcao: ', 's');
f = inline(f);
x0 = input('Entre com o primeiro ponto: ');
x1 = input('Entre com o segundo ponto: ');
tol = input('Entre com a tolerancia: ');
nmax = input('Entre com o numero maximo de iteracoes: ');

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Metodo de Newton

n = 0;
x2 = (x0*f(x1) - x1*f(x0)) / (f(x1) - f(x0));

while(n < nmax)
  if ((abs(f(x2)) < tol) || ((abs(x2 - x1) / abs(x2)) < tol))
    fprintf('A solucao eh: %f\n', x2);
    return;
  endif
  
  x0 = x1;
  x1 = x2;
  x2 = (x0*f(x1) - x1*f(x0)) / (f(x1) - f(x0));
  n = n+1;
endwhile

%%%%%%%%%%%%%%%%%%%%%%%%%%
% Saída

if (n >= nmax)
  fprintf('\nO programa excedeu o numero maximo de iteracoes, a resposta eh: %f\n\n', x1);
  return;
endif
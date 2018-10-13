format short


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entrada
 
A = input('Entre com a matriz A: ');
b = input('Entre com o vetor b: ');
nmax = input('Entre com o máximo de iterações: ');
tol = input('Entre com a tolerância: ');
x0 = input('Entre com o vetor inicial x0: ');


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Construção do C e g

n = size(A);
for i=1:n
  for j=1:n
    if i==j
      C(i,j) = 0;
    else
      C(i,j) = -A(i,j)/A(i,i);
    endif
  endfor
  g(i) = b(i)/A(i,i);
endfor


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verificação de Convergência

beta(1) = sum(abs(C(1,2:n)));
for i=1:n
  soma=0;
  if (i == 1)
    for j=1:n
      beta(i) = soma + abs(C(i,j));
    endfor
  else
    soma1=0;
    for j=1:i-1
      soma1 = soma1 + beta(j) + abs(C(i,j));
    endfor
    for j=i+i:n
      soma = soma + abs(C(i,j));
    endfor
      beta(i) = soma1 + soma;
  endif
endfor

if (norm(beta, inf) >= 1)
  fprintf('Nao ha garantia de convergencia.\n');
  return;
endif


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Método iterativo

iteracoes = 1;
erro = tol;
while (iteracoes <= nmax && erro >= tol)
  for i=1:n
    soma=0;
    for j=1:n
      if (i <= j)
        soma = soma + C(i,j)*x0(j);
      else
        soma = soma + C(i,j)*x1(j);
      endif
    endfor
    x1(i) = soma + g(i);
  endfor
  erro = norm(x1-x0, Inf)/norm(x1, Inf);
  x0 = x1;
  iteracoes = iteracoes + 1;
endwhile


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Saída

if (iteracoes > nmax)
  fprintf('\nEstourou o limite de iteracoes!\n');
  return;
endif

fprintf('\nO vetor solução é:\n', natual);
for i = 1:n
    fprintf(' x(%d) = %f\n', i, x0(i));
endfor
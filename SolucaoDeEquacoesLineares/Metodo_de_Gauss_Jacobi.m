%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entrada

A = input('Entre com a matriz A: ');
[lin col] = size(A);
b = input('Entre com o vetor b: ');
nmax = input('Entre com o numero maximo de iteracoes: ');
tol = input('Entre com a tolerancia: ');
vetx = input('Entre com o vetor X: ');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Construção do C e g

C = [1;1];
g = [1];

for i = 1:lin
  for j = 1:col
    if (i == j)
      C(i,j) = 0;  
    else
      C(i,j) = -A(i,j)/A(i,i);
    endif
  endfor
  g(i) = b(i)/A(i,i);
endfor


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Teste de convergência

if (norm(C,inf) >= 1)
  if (norm(C,1) >= 1)
    fprintf('DEU ERRADO');
    return;
  endif
endif


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Método de Gauss-Jacobi

for n = 0:nmax
  x1=C*x0+g';
  if (norm(x1-x0,inf)/norm(x1,inf) <= tol)
    fprintf('Solucao: ');
    x1
    return;
  endif
  x0=x1;
endfor

fprintf('Numero maximo de iteracoes alcancado!');
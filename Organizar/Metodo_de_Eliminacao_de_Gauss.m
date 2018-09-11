%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entrada

A = input("Insira os coeficientes do sistema linear em forma de Matriz: ");
b = input("Insira os resultados em forma de Matriz coluna: ");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Aumentada

aum = [A b];
[n k] = size(aum);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Método de Eliminação de Gauss

for j = 1:n-1
  for i = j+1:n
    if (aum(j,j) == 0)
      q = j;
      while (q <= n && aum(q,q) == 0)
        q = q+1;
      endwhile
      if (q>n)
        fprintf('Nao existe solucao real pelo Método de Gauss\n');
        return;
      else
        aum([j q],:) = aum([q j],:);
      endif
    endif
    m(i,j) = aum(i,j)/aum(j,j);
    aum(i,:) = aum(i,:) - m(i,j)*aum(j,:);
  endfor
endfor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resolução Matriz Triangular Superior

x(n) = aum(n,n+1)/aum(n,n);

for i=n-1:-1:1
  soma = 0;
  for j=i+1:n
    soma = soma+aum(i,j)*x(j);
  endfor
  x(i) = (aum(i,n+1)-soma)/aum(i,i);
endfor

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Saída

for i=1:n
  fprintf('x(%d) = %f\n', i, x(i));
endfor
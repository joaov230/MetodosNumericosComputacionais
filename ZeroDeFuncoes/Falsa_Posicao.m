clear;

% Funcao que plota a funcao no intervalo desejado
function plota(aa, bb, toll, ff, pff)
  grafico = aa:toll:bb;
  reta = [aa,bb];
  plot(grafico, ff(grafico), 'b', reta, ff(reta), '0-r', pff, 0, 'o-k', reta, [0,0], 'k');

  xlim([aa, bb]);
  ylim ([ff(aa), ff((bb))]);
  grid on;
endfunction


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Leitura das variaveis

funct = input('Insira a funcao (para exponencial, use . antes do ^): ', 's');
f = inline(funct);
a = input('Insira o limite inferior: ');
b = input('Insira o limite superior: ');
tol = input('Insira a tolerancia: ');

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Metodo da Bissecao

fa = f(a);
fb = f(b);
intervalo = abs(b-a);

if (fa*fb > 0)
  fprintf('Nao existe raiz no intervalo dado\n\n');
  return;
endif

fprintf ('a        | f(a)      | b        | f(b)     | P. Falso | f(pf)     | Intervalo\n');
while (intervalo > tol)
  pf = ((a*f(b)) - (b*f(a))) / (f(b) - f(a));
  fpf = f(pf);
  
  fprintf ('%f | %f | %f | %f | %f | %f | %f\n', a, fa, b, fb, pf, fpf, intervalo);  
  
  plota(a, b, tol, f, pf);
  pause(1);
  
  % Se convergiu pela imagem, já mostra a resposta e termina o programa
  if (abs(fpf) < tol)
    fprintf('\nA solucao foi obtida pela imagem: %f\n', fpf);
    plota(a, b, tol, f, pf);
    return;
  endif
  
  if (fa*fpf <= 0)
    b = pf;
    fb = fpf;
  else
    a = pf;
    fa = fpf;
  endif
  intervalo = abs(b-a);
endwhile


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostra o resultado

fprintf('\nA solucao foi obtida pelo dominio: %f\n', pf);
plota(a,b,tol,f, pf);
return;
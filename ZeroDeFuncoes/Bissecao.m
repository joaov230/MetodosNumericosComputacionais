clear;

% Funcao que plota a funcao no intervalo desejado

function plota(aa, bb, toll, ff)  
  grafico = aa:toll:bb;
  pmm = (aa+bb)/2;
  retax = [aa,bb];
  plot(grafico, ff(grafico), 'b', pmm, ff(pmm), 'o-r', retax, [0,0],'k');

  xlim([aa, bb]);
  ylim ([ff(aa), ff(bb)]);
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

fprintf ('a        | f(a)      | b        | f(b)     | P. Medio | f(pm)     | Intervalo\n');
while (intervalo > tol)
  pm = (a+b)/2;
  fpm = f(pm);
  
  fprintf ('%f | %f | %f | %f | %f | %f | %f\n', a, fa, b, fb, pm, fpm, intervalo);  
  
  plota(a,b,tol,f);
  pause(1);
  
  % Se convergiu pela imagem, já mostra a resposta e termina o programa
  if (abs(fpm) < tol)
    fprintf('\nA solucao foi obtida pela imagem: %f\n', fpm);
    plota(a,b,tol,f);
    return;
  endif
  
  if (fa*fpm <= 0)
    b = pm;
    fb = fpm;
  else
    a = pm;
    fa = fpm;
  endif
  intervalo = abs(b-a);
endwhile


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mostra o resultado

fprintf('\nA solucao foi obtida pelo dominio: %f\n', pm);
plota(a,b,tol,f);
return;
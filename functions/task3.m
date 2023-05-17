
function new_X = task3 (photo, pcs)
  [m, n] = size (photo);
  
  % initializare matrice finala.
  new_X = zeros (m, n);
  
  % cast photo la double.
  photo2 = double(photo);
  % calculam media fiecarui rand al matricii.
  miu = zeros(m, 1);
  miu = mean(photo2')';

  % normalizam matricea initiala scazand din ea media fiecarui rand.
  for i = 1 : m
  	photo2(i, :) -= miu(i);
  endfor

  % calculam matricea de covarianta.
  Z = photo2 * photo2' / (n - 1);
  % calculam vectorii si valorile proprii ale matricei de covarianta.
  [V S] = eig(Z);
  
  [~, indx] = sort(diag(S), 'descend');
  V = V(:, indx);
  
  % pastram doar primele pcs coloane
  W = V(:, 1 : pcs);
  
  % cream matricea Y schimband baza matricii initiale.
  Y = W' * photo2;
  % calculammatricea new_X care este o aproximatie a matricii initiale
  new_X = W * Y;
  % adunam media randurilor scazuta anterior.
  new_X += miu;
  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);
endfunction

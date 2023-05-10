
function new_X = task3 (photo, pcs)
  [m, n] = size (photo);
  
  % initializare matrice finala.
  new_X = zeros (m, n);
  
  % TODO: cast photo la double.
  photo2 = double(photo);
  % TODO: calculeaza media fiecarui rand al matricii.
  miu = zeros(m, 1);
  miu = mean(photo2')';

  % TODO: normalizeaza matricea initiala scazand din ea media fiecarui rand.
  for i = 1 : m
  	photo2(i, :) -= miu(i);
  endfor
  % TODO: calculeaza matricea de covarianta.
  Z = photo2 * photo2' / (n - 1);
  % TODO: calculeaza vectorii si valorile proprii ale matricei de covarianta.
  % HINT: functia eig
  [V S] = eig(Z);
  
  % TODO: ordoneaza descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  [~, indx] = sort(diag(S), 'descend');
  V = V(:, indx);
  
  % TODO: pastreaza doar primele pcs coloane
  % OBS: primele coloane din V reprezinta componentele principale si
  % pastrandu-le doar pe cele mai importante obtinem astfel o compresie buna
  % a datelor. Cu cat crestem numarul de componente principale claritatea
  % imaginii creste, dar de la un numar incolo diferenta nu poate fi sesizata
  % de ochiul uman asa ca pot fi eliminate.
  W = V(:, 1 : pcs);
  
  % TODO: creaza matricea Y schimband baza matricii initiale.
  Y = W' * photo2;
  % TODO: calculeaza matricea new_X care este o aproximatie a matricii initiale
  new_X = W * Y;
  % TODO: aduna media randurilor scazuta anterior.
  new_X += miu;
  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);
endfunction

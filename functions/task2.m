
function new_X = task2 (photo, pcs)
  [m n] = size(photo);
  
  % initializare matrice finala.
  new_X = zeros(m, n);
  
  % TODO: cast photo la double.
  photo2 = double(photo);
  
  % TODO: normalizeaza matricea initiala scazand din ea media fiecarui rand.
  miu = zeros(m, 1);
  miu = mean(photo2')';

  for i = 1 : m
  	photo2(i, :) -= miu(i);
  endfor

  % TODO: construieste matricea Z.	
	Z = photo2' / sqrt(n - 1);

  % TODO: calculeaza matricile U, S si V din SVD aplicat matricii Z
	[U S V] = svd(Z);
  % TODO: construieste matricea W din primele pcs coloane ale lui V
	W = V(:, 1 : pcs);

  % TODO: cacluleaza matricea Y
	Y = W' * photo2;
  % TODO: aproximeaza matricea initiala
	new_X = W  * Y + miu;
  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
	new_X = uint8(new_X);
endfunction

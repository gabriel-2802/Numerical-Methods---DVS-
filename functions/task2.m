
function new_X = task2 (photo, pcs)
  [m n] = size(photo);
  
  % initializare matrice finala.
  new_X = zeros(m, n);
  
  % cast photo la double.
  photo2 = double(photo);
  
  % normalizam matricea initiala scazand din ea media fiecarui rand.
  miu = zeros(m, 1);
  miu = mean(photo2')';

  for i = 1 : m
  	photo2(i, :) -= miu(i);
  endfor

  % construim matricea Z.	
	Z = photo2' / sqrt(n - 1);

  % calculam matricile U, S si V din SVD aplicat matricii Z
	[U S V] = svd(Z);
  % construim matricea W din primele pcs coloane ale lui V
	W = V(:, 1 : pcs);

  % calculam matricea Y
	Y = W' * photo2;
  % aproximam matricea initiala
	new_X = W  * Y + miu;
  % transformam matricea in uint8 pentru a fi o imagine valida.
	new_X = uint8(new_X);
endfunction

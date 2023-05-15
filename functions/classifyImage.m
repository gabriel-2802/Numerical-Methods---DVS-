
function prediction = classifyImage (im, train_mat, train_val, pcs)
  % initializare predictie.
  prediction = -1;
  
  % TODO: cast im la double.
  im = double(im);

  
  % TODO: aplica functia magic_with_pca setului de date de antrenament.
  [train, miu, F, Vk] = magic_with_pca (train_mat, pcs);
  
  % TODO: scade din vectorul imagine media fiecarui rand din train_mat.
  [~, n] = size(im);
  for j = 1 : n
    im(:, j) = im(:, j) - miu(j);
  endfor
  % TODO: schimbati baza inmultind cu matricea V.
  im = im * Vk;
  % TODO: calculati predictia folosindu-va de metoda k nearest neighbour
  % implementata anterior.
  prediction = KNN(train_val, F, im, pcs);
endfunction
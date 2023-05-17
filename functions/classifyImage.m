
function prediction = classifyImage (im, train_mat, train_val, pcs)
  % initializare predictie.
  prediction = -1;
  
  % cast im la double.
  im = double(im);

  
  % aplicam functia magic_with_pca setului de date de antrenament.
  [train, miu, F, Vk] = magic_with_pca (train_mat, pcs);
  
  % scadem din vectorul imagine media fiecarui rand din train_mat.
  [~, n] = size(im);
  for j = 1 : n
    im(:, j) = im(:, j) - miu(j);
  endfor
  % schimbam baza inmultind cu matricea V.
  im = im * Vk;

  % calculatam predictia folosindu-va de metoda k nearest neighbour
  % implementata anterior.
  prediction = KNN(train_val, F, im, pcs);
endfunction
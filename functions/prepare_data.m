
function [train_mat, train_val] = prepare_data (name, no_train_images)
  n = 784;
  
  % initializare train_mat.
  train_mat = zeros (no_train_images, n);
  
  %initializare train_val.
  train_val = zeros (1, no_train_images);
  
  % incarcam datele din tabelul primit ca argument.
  d = load(name);
  X = d.trainX;
  y = d.trainY;

  % salvam in matricea train_mat primele no_train_images coloane din
  % tabelul de imagini de antrenament.
  train_mat = X(1 : no_train_images, :);
  % salvam in vectorul train_val primele no_train_images valori ale
  train_val = y(1 : no_train_images);
  % vectorului de etichete.
endfunction

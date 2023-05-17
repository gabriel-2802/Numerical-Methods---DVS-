
function [train, miu, F, Vk] = magic_with_pca (train_mat, pcs)
  [m, n] = size (train_mat);
  
  % initializare train
  train = zeros (m, n);
  
  % initializare miu
  miu = zeros (1, n);
  
  % initializare F
  F = zeros (m, pcs);
  
  % initializare Vk
  Vk = zeros (n, pcs);
  
  % cast train_mat la double.
  train_mat = double(train_mat);
  
   % calculam media fiecarui rand al matricii.
  miu = mean(train_mat)';
  
  % scadem media din matricea initiala.
  for j = 1 : n
  	train_mat(:, j) -= miu(j);
  endfor

  % calculam matricea de covarianta.
  cov_matrix = train_mat' * train_mat / (m - 1);
  % calculam vectorii si valorile proprii ale matricei de covarianta.
  [V S] = eig(cov_matrix);
  
  % ordonam descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.
  [~, indx] = sort(diag(S), 'descend');
  V = V(:, indx);
  
  % pastram doar primele pcs coloane din matricea obtinuta anterior.
  Vk = V(:, 1 : pcs);
  % cream matricea F schimband baza matricii initiale.
  F = train_mat * Vk;
  % calculam matricea train care este o aproximatie a matricii initiale
  train = F * Vk';
endfunction
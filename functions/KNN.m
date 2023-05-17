
function prediction = KNN (labels, Y, test, k)
  % initializeazam prediction
  prediction = -1;
  
  % initializeazam distantele
  [m, n] = size (Y);
  distance = zeros (m, 1);
  
  % pentru fiecare rand calculam distanta Euclidiana dintre acesta si
  % vectorul de test primit ca argument.
  for i = 1 : m
    distance(i) = norm(Y(i,:) - test);
  endfor
  
  % ordonam crescator distantele si tineti minte intr-un vector primele
  % k valori care reprezinta valorile adevarate ale acestor imagini care s-au
  % dovedit a fi cele mai apropiate.
  [~, idx] = sort(distance);
  greatest = labels(idx);
  greatest = greatest(1 : k);

  % calculam predictia ca mediana celor k valori cele mai apropiate.
  prediction = median(greatest);
endfunction

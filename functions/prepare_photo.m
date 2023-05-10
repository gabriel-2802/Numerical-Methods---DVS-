
function sir = prepare_photo (im)
  %initializare sirul final.
  sir = zeros (1, 784);
  
  % TODO: inverseaza pixelii imaginii im.
  im = abs(im - 255);
  
  % TODO: transpune imaginea, iar apoi transforma imaginea intr-un sir.
  im = im';
  % HINT: functia reshape
  sir = im(:);
endfunction

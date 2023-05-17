
function sir = prepare_photo (im)
  %initializare sirul final.
  sir = zeros (1, 784);
  
  % inversam pixelii imaginii im.
  im = 255 - im;
  % transpunem imaginea, iar apoi transforma imaginea intr-un sir.
  im = im';

  sir = reshape(im, 1, 784);
endfunction

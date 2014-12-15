(function() {
  var Image, Pixel, backupfile, data, floor, fs, i, imagefile, img, p1, p2, rand, round, use_backup, _i, _ref, _ref1;

  fs = require('fs');

  Image = require('./image');

  Pixel = require('./pixel');

  floor = Math.floor;

  round = Math.round;

  rand = function(a, b) {
    if (a == null) {
      a = 0;
    }
    if (b == null) {
      b = 1;
    }
    return Math.random() * b + a;
  };

  imagefile = 'image.bmp';

  backupfile = 'image-backup.bmp';

  use_backup = true;

  if (use_backup || !fs.existsSync(imagefile)) {
    data = fs.readFileSync(backupfile);
    fs.writeFileSync(imagefile, data);
  } else {
    data = fs.readFileSync(imagefile);
  }

  if (!fs.existsSync(backupfile)) {
    fs.writeFileSync(backupfile, data);
  }

  img = new Image(imagefile);

  for (i = _i = 0, _ref = img.bmp.length; _i <= _ref; i = _i += 3) {
    p1 = new Pixel(img, i);
    p2 = new Pixel(img, i + floor(img.width / p1.x));
    _ref1 = [p2.r, p2.g, p2.b], p1.r = _ref1[0], p1.g = _ref1[1], p1.b = _ref1[2];
    p1.apply();
  }

  img.save(imagefile);

}).call(this);

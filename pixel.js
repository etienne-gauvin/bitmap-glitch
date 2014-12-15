(function() {
  var Pixel, floor;

  floor = Math.floor;

  Pixel = (function() {
    function Pixel(img, i) {
      var _ref;
      this.img = img;
      this.i = i;
      this.x = floor(this.i / 3) % this.img.width;
      this.y = floor(floor(this.i / 3) / this.img.width);
      _ref = this.img.bmp.slice(this.i, +(this.i + 2) + 1 || 9e9), this.r = _ref[0], this.g = _ref[1], this.b = _ref[2];
    }

    Pixel.prototype.rgb = function() {
      return [this.r, this.g, this.b];
    };

    Pixel.prototype.apply = function() {
      var _ref, _ref1;
      return ([].splice.apply(this.img.bmp, [(_ref = this.i), (this.i + 2) - _ref + 1].concat(_ref1 = this.rgb())), _ref1);
    };

    return Pixel;

  })();

  module.exports = Pixel;

}).call(this);

(function() {
  var Image, fs;

  fs = require('fs');

  Image = (function() {
    function Image(file) {
      this.file = file;
      this.filecontent = fs.readFileSync(this.file);
      this.offset = this.filecontent.readInt32LE(0x000A);
      this.width = this.filecontent.readInt32LE(0x0012);
      this.height = this.filecontent.readInt32LE(0x0016);
      this.bmp = new Buffer(this.filecontent.length - this.offset);
      this.filecontent.copy(this.bmp, 0, this.offset);
    }

    Image.prototype.save = function(file) {
      if (file == null) {
        file = this.file;
      }
      this.bmp.copy(this.filecontent, this.offset);
      return fs.writeFile(file, this.filecontent, function(err) {
        return console.log("Data written in " + file);
      });
    };

    return Image;

  })();

  module.exports = Image;

}).call(this);
floor = Math.floor

# Classe représentant un pixel (position xy et couleur rgb)
class Pixel
    constructor: (@img, @i) ->
        @x = floor(@i/3) % @img.width
        @y = floor(floor(@i/3)/@img.width)
        [@r, @g, @b] = @img.bmp[@i..@i+2]

    rgb: -> [@r, @g, @b]
    
    apply: ->
        @img.bmp[@i..@i+2] = @rgb()
    
module.exports = Pixel
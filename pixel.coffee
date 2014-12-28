floor = Math.floor

# Classe représentant un pixel (position xy et couleur rgb)
class Pixel
    constructor: (@img, @x, @y) ->
        @i = @y * @img.width * 3 + @x * 3
        
        #@x = floor(@i/3) % @img.width
        #@y = floor(floor(@i/3)/@img.width)
        
        try
            [@b, @g, @r] = @img.bmp[@i..@i+2]
        catch e
            [@b, @g, @r] = [0, 0, 0]

    rgb: (rgb) ->
        [@r, @g, @b] = rgb if rgb?
            
        [@r, @g, @b]
    
    apply: ->
        try
            return @img.bmp[@i..@i+2] = [@b, @g, @r]
        catch e
            return [0, 0, 0]
    
module.exports = Pixel
Pixel = require './pixel'

module.exports =
    
    # Décaler les valeurs de couleur des pixels
    shift:
        color: 'r'
        shift_x: 8
        shift_y: 0
        func: (pixel1, p) ->
            pixel2 = new Pixel(pixel1.img, pixel1.x + p.shift_x, pixel1.y + p.shift_y)
            pixel1[p.color] = pixel2[p.color]
            pixel1.apply()
    
    # Pixéliser l'image en recopiant le même pixel
    pixelize:
        step_x: 16
        step_y: 16
        func: (pixel1, p) ->
            for y in [0 .. p.step_y-1]
                for x in [0 .. p.step_x-1]
                    pixel2 = new Pixel(pixel1.img, pixel1.x + x, pixel1.y + y)
                    pixel2.rgb(pixel1.rgb())
                    pixel2.apply()
    
    # 
    test:
        func: (pixel1, p) ->
            pixel2 = new Pixel(pixel1.img,
                               pixel1.img.width - pixel1.x,
                               pixel1.y)
            #console.log pixel1.x, pixel1.img.width - pixel1.x
            pixel1.r = pixel2.r
            pixel1.apply()
    
    
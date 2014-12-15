fs = require 'fs'
Image = require './image'
Pixel = require './pixel'

# Raccourcis
floor = Math.floor
round = Math.round
rand = (a=0, b=1) -> Math.random() * b + a

# Paramètres des fichiers
imagefile = 'image.bmp'
backupfile = 'image-backup.bmp'
use_backup = true

# Lecture de l'image ou du backup
if use_backup or !fs.existsSync imagefile
    data = fs.readFileSync backupfile
    fs.writeFileSync(imagefile, data)
else
    data = fs.readFileSync imagefile

# Création d'un backup si il n'y en a pas
if !fs.existsSync backupfile 
    fs.writeFileSync(backupfile, data)

# Lecture de l'image
img = new Image imagefile

# Transformations
for i in [0..img.bmp.length] by 3
    
    p1 = new Pixel(img, i)
    p2 = new Pixel(img, i + floor(img.width / p1.x))
    
    #p1.r = p2.r # Décalage bleu/vert
    [p1.r, p1.g, p1.b] = [p2.r, p2.g, p2.b] # Décalage bleu/vert
    
    p1.apply()


img.save(imagefile)
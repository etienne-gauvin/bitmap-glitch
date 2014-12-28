fs = require 'fs'
path = require 'path'
Image = require './image'
Pixel = require './pixel'
config = require './config'
filters = require './filters'

# Raccourcis
floor = Math.floor
round = Math.round
rand = (a=0, b=1) -> Math.random() * b + a

# Paramètres des fichiers
imagefile = config.imagefile
backupfile = config.backupfile
use_backup = config.use_backup
save_copy  = config.save_copy

# Aucune image
if !fs.existsSync(imagefile) && !fs.existsSync(backupfile)
    console.log "No image '#{imagefile}' or '#{backupfile}' to use !"
    return

# Lecture de l'image ou du backup
if (use_backup and fs.existsSync(backupfile)) or !fs.existsSync(imagefile)
    data = fs.readFileSync backupfile
    fs.writeFileSync(imagefile, data)
else
    data = fs.readFileSync imagefile

# Création d'un backup si il n'y en a pas
if !fs.existsSync(backupfile)
    fs.writeFileSync(backupfile, data)

# Lecture de l'image
img = new Image(imagefile)

# Transformations
console.log "Processing..."

for filter in config.filters
    fname = filter.f
    
    fconfig =
        step_x: 1
        step_y: 1
    
    for key, defaultValue of filters[fname]
        fconfig[key] = filter[key] ? defaultValue
    
    console.log("Applying filter #{fname} with config:\n", fconfig)
    
    for y in [0 .. (img.height-1)] by fconfig.step_y
        for x in [0 .. (img.width-1)] by fconfig.step_x
            pixel = new Pixel(img, x, y)
            filters[fname].func(pixel, fconfig)

# Sauvegarder l'image
img.save(imagefile)

# Faire une copie de sauvegarde de l'image
if save_copy?

    if not fs.existsSync(save_copy)
        fs.mkdirSync(save_copy)
    
    n = (new Date).getTime()
    save_copy_path = path.join(save_copy, "#{path.basename(imagefile,'.bmp')}-#{n}.bmp")
    img.save(save_copy_path)
    

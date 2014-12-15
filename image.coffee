fs = require 'fs'

class Image
    constructor: (@file) ->
        @filecontent = fs.readFileSync @file
        
        @offset = @filecontent.readInt32LE(0x000A)
        @width =  @filecontent.readInt32LE(0x0012)
        @height = @filecontent.readInt32LE(0x0016)
        
        @bmp = new Buffer(@filecontent.length - @offset)
        @filecontent.copy(@bmp, 0, @offset)
    
    save: (file) ->
        file = @file if not file?
        
        @bmp.copy(@filecontent, @offset)
        
        fs.writeFile file, @filecontent, (err) ->
            console.log "Data written in #{file}"

module.exports = Image
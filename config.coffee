module.exports =
    
    # Image to write on
    imagefile: 'image.bmp'
    
    # Image backup to create (or use if use_backup)
    backupfile: 'image-backup.bmp'
    
    # Load the backup instead of imagefile
    use_backup: yes
    
    # Save a copy of the glitched image in a folder
    save_copy: 'copies/'
    
    # Filters to apply
    filters: [
        
        # {
        #   f: "Filter_Name"
        #   ... parameters
        # }
        
        # Shift colors
        #{f: 'shift', color: 'b', shift_x: 8, shift_y: 0}
        #{f: 'shift', color: 'r', shift_x: -1, shift_y: 1}
        
        # Pixelize
        #{f: 'pixelize', step_x: 2, step_y: 16}
        
        # Test filter
        #{f: 'test'}
        
        
    ]

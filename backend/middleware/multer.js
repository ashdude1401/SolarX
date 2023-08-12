const multer = require('multer');
const path = require('path');

module.exports = multer({
    storage: multer.memoryStorage(),
    
    fileFilter: (req, file, cb) => {
        let ext = path.extname(file.originalname);
        if (ext !== `.jpg` && ext !== `.jpeg` && ext !== `.png`&& ext !== `.blend`&& ext !== `.fbx`&& ext !== `.glb`&& ext !== `.gltf`&& ext !== `.mtl`&& ext !== `.obj`&& ext !== `.x3d`) {
            cb(new Error('Invalid file type'), false);
            return;
        }
        cb(null, true);
    }
})
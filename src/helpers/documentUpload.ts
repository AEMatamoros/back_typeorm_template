import  multer from 'multer';

//Multer Configuration
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, './src/form_inscriptions')
    },
    filename: function (req, file, cb) {
      cb(null, Date.now()+ '_' + file.originalname.replace(/ /g, ''))
    }
}) 

export const uploadDocument = multer({ storage: storage })
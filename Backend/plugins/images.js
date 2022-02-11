const path = require('path')
const multer = require('multer')

class ImagesDatabase {
    constructor(section) {

        this.storage = multer.diskStorage({
            destintaion: `../imagesDatabase/${section}`,
            filename: (req, file, allback) => {
                callback(null, file.filename + '_' + Data.now() + path.extname(file.originalname))
            }
        })
    }

    upload = multer({
        storage: this.storage,
        limits: {
            fileSize: 50000000
        },
        fileFilter(req, file, cb) {
            if (!file.originalname.match(/\.(png|jpg)$/)) {
                print('filtered')
                // upload only png and jpg format
                return cb(new Error('Please upload a Image'))
            }
            cb(undefined, true)
            cb(undefined, true)

        }
    })
}



module.exports = {
    getImageByFilePath: (section, filePath) => {

        return {
            path: path.resolve(`imagesDatabase/${section}/${filePath}`),
            options: {
                root: "",
                dotfiles: 'deny',
                headers: {
                    'x-timestamp': Date.now(),
                    'x-sent': true
                }
            }

        }

    },


    ImagesDatabase: ImagesDatabase,

}

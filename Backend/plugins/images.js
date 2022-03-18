const path = require('path')
const multer = require('multer')
const fs = require('fs')
class ImagesDatabase {
    constructor(section) {

        this.storage = multer.diskStorage({
            destintaion: `../assetsDatabase/${section}`,
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
	    const exts = ['.jpg', '.png', '.gif', '.jpeg']
	    var path_;
	    for (var ext in exts){
		    console.log(exts[ext])
		    if(fs.existsSync(path.resolve(`assetsDatabase/${section}/covers/${filePath}${exts[ext]}`))){
			    path_ = path.resolve(`assetsDatabase/${section}/covers/${filePath}${exts[ext]}`)
			    console.log('Found')
			    break
		    }
	    }

	    if (path_ === undefined) {
		    console.log('Not Found')
	    	return 
	    }

        return {
            path: path_,
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

    getUsersImageByFilePath: (section, subSection, filePath) => {
	    const exts = ['.jpg', '.png', '.gif', '.jpeg']
	    var path_;
	    for (var ext in exts){
		    console.log(exts[ext])
		    if(fs.existsSync(path.resolve(`assetsDatabase/${section}/${subSection}/${filePath}${exts[ext]}`))){
			    path_ = path.resolve(`assetsDatabase/${section}/${subSection}/${filePath}${exts[ext]}`)
			    break
		    }
	    }

	    if (path_ === undefined) {
	    	return 
	    }

        return {
            path: path_,
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

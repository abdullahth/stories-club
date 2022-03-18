const path = require('path')
const multer = require('multer')
const fs = require('fs')


module.exports = {
    getAssetByFilePath: (section, filePath) => {
	    var exts;
	    if (section === 'audios'){
		    exts = ['.mpeg', '.mp3',]
	    }
	    else if (section === 'videos'){
		    exts = ['.mp4']
	    }
	    else if (section === 'books'){
		    exts = ['.pdf']
	    }

	    var path_;
	    for (var ext in exts){
		    console.log(`assetsDatabase/${section}/assets/${filePath}${exts[ext]}`)
		    if(fs.existsSync(path.resolve(`assetsDatabase/${section}/assets/${filePath}${exts[ext]}`))){
			    path_ = path.resolve(`assetsDatabase/${section}/assets/${filePath}${exts[ext]}`)
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



}

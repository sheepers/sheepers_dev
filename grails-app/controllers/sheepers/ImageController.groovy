package sheepers
import grails.converters.JSON
import org.imgscalr.Scalr
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

import javax.imageio.ImageIO
import java.awt.image.BufferedImage

class ImageController {

    def upload() {
        try {
//            InputStream inputStream = selectInputStream(request)
//            File uploaded = createTemporaryFile()
            String newFilenameBase = UUID.randomUUID().toString()

            MultipartFile uploadedFile = ((MultipartHttpServletRequest) request).getFile('qqfile')
            String originalFileExtension = uploadedFile.originalFilename.substring(uploadedFile.originalFilename.lastIndexOf("."))
//            String originalFileExtension = request.queryString.substring(request.queryString.lastIndexOf("."))
            String newFilename = newFilenameBase + originalFileExtension
            String storageDirectory = servletContext.getRealPath("/") + grailsApplication.config.fileupload.directory?:'/Users/Ofir/sheepers_dev/user-images'
//            def auctionInstance = new Auction(params)

            def userID = sec.loggedInUserInfo(field: "id").toLong()
            storageDirectory += '/' + userID   + '/tmp'

            def folder = new File( "$storageDirectory" )
            if( !folder.exists() ){
                folder.mkdirs()
            }

            File newFile = new File("$storageDirectory/$newFilename")
            uploadedFile.transferTo(newFile)

            BufferedImage bufferedImage = Scalr.resize(ImageIO.read(newFile) , Scalr.Method.SPEED, Scalr.Mode.FIT_TO_WIDTH,200, 100, Scalr.OP_ANTIALIAS)
            ImageIO.write(bufferedImage,'jpg',newFile)
            return render(text: [success:true] as JSON, contentType:'text/json')

        } catch (Exception e) {

            log.error("Failed to upload file.", e)
            return render(text: [success:false] as JSON, contentType:'text/json')

        }

    }

//    private InputStream selectInputStream(HttpServletRequest request) {
//        if (request instanceof MultipartHttpServletRequest) {
//            MultipartFile uploadedFile = ((MultipartHttpServletRequest) request).getFile('qqfile')
//            return uploadedFile.inputStream
//        }
//        return request.inputStream
//    }
    def index() {}

    def getImages(Long id){

        def userID = sec.loggedInUserInfo(field: "id").toLong()
        String storageDirectory = servletContext.getRealPath("/") + grailsApplication.config.fileupload.directory

        String HTMLResp   =  ""
        storageDirectory +=  '/' + userID + '/' + id
        def folder = new File("$storageDirectory")

        folder.eachFile {
            if (it.isFile()) {
                if (HTMLResp == "")
                {
                    HTMLResp =  "<div class='item'><img alt ='300x200' src='../" + grailsApplication.config.fileupload.directory + "/" + userID + "/" + id + "/" + it.name +"'/></div>"
                }
                else
                {
                    HTMLResp = HTMLResp  + "<div class='item'><img alt ='300x200' src='../" + grailsApplication.config.fileupload.directory + "/" + userID + "/" + id + "/" + it.name  + "'/></div>"
                }
            }
        }
        render HTMLResp
    }



}

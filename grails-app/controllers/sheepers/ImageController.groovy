package sheepers
import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest
//import uk.co.desirableobjects.ajaxuploader.AjaxUploadController
//import uk.co.desirableobjects.ajaxuploader.exception.FileUploadException
//class ImageController extends AjaxUploadController {
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
            String storageDirectory = grailsApplication.config.fileupload.directory?:'/Users/Ofir/sheepers_dev/user-images'
//            def auctionInstance = new Auction(params)

            def userID = sec.loggedInUserInfo(field: "id").toLong()
            storageDirectory += '/' + userID   + '/tmp'

            def folder = new File( "$storageDirectory" )
            if( !folder.exists() ){
                folder.mkdirs()
            }

            File newFile = new File("$storageDirectory/$newFilename")
            uploadedFile.transferTo(newFile)



//            ajaxUploaderService.upload(inputStream, newFile)
//            newFile << inputStream
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

    def getImages(Long auctionID){

        def userID = sec.loggedInUserInfo(field: "id").toLong()
        String storageDirectory = grailsApplication.config.fileupload.directory

        storageDirectory +=  '/' + userID + '/' + auctionID
        def folder = new File("$storageDirectory")

        ArrayList images = new ArrayList()

        folder.eachFile {
            if (it.isFile()) {
               images.add(it.name)
                }
            }

        return images as JSON


    }



}

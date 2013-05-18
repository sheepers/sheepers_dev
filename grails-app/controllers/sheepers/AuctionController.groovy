package sheepers

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile

class AuctionController {
    //static scaffold = true
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def geocodeService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        if (!sec.loggedInUserInfo(field: 'id'))
        {
            [auctionInstanceList: Auction.list(max: 0), auctionInstanceTotal: 0]
        }
        else
        {
            //def auctionList = Auction.find("from Auction as auc where auc.profile.id = :un",[un: Profile.find("from Profile as prof where prof.user.id = :pid",[pid: sec.loggedInUserInfo(field: 'id').toLong()]).id])
            def user = User.get(sec.loggedInUserInfo(field: 'id').toLong())
            def auctionList = user.profile.auctions
            if (!auctionList)
            {
                [auctionInstanceList: Auction.list(max: 0), auctionInstanceTotal: 0]
            }
            else
            {
                [auctionInstanceList: auctionList , auctionInstanceTotal: auctionList.size()]
            }
        }

    }


    def create() {

       [auctionInstance: new Auction(params)]

    }


    def save() {
        def user = User.get(sec.loggedInUserInfo(field: "id").toLong())
        params.setProperty("profile",user.profile)
        params.setProperty("deadlineDate",new Date((String)params.deadlineDate))
        params.setProperty("status" , "open")

        def auctionInstance = new Auction(params)
        if (!auctionInstance.save(flush: true)) {
            //todo: add to delete the tmp file directory
            render(view: "create", model: [auctionInstance: auctionInstance])
            return
        }
        //copy photos from tmp to auctionID directory
        transfer(user.getId(),auctionInstance.getId())
        flash.message = message(code: 'default.created.message', args: [message(code: 'auction.label', default: 'Auction'), auctionInstance.id])
        redirect(uri: "/")
    }

    def show(Long id) {
        def auctionInstance = Auction.get(id)
        if (!auctionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'auction.label', default: 'Auction'), id])
            redirect(action: "list")
            return
        }

        [auctionInstance: auctionInstance]
    }

    def edit(Long id) {
        def auctionInstance = Auction.get(id)
        if (!auctionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'auction.label', default: 'Auction'), id])
            redirect(action: "list")
            return
        }

        [auctionInstance: auctionInstance]
    }

    def update(Long id, Long version) {
        def auctionInstance = Auction.get(id)
        if (!auctionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'auction.label', default: 'Auction'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (auctionInstance.version > version) {
                auctionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'auction.label', default: 'Auction')] as Object[],
                        "Another user has updated this Auction while you were editing")
                render(view: "edit", model: [auctionInstance: auctionInstance])
                return
            }
        }
        params.setProperty("deadlineDate",new Date((String)params.deadlineDate))
        auctionInstance.properties = params
        auctionInstance.items.removeAll{it.deleted}


        if (!auctionInstance.save(flush: true)) {
            render(view: "edit", model: [auctionInstance: auctionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'auction.label', default: 'Auction'), auctionInstance.id])
        redirect(action: "show", id: auctionInstance.id)
    }

    def delete(Long id) {
        def auctionInstance = Auction.get(id)
        if (!auctionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'auction.label', default: 'Auction'), id])
            redirect(action: "list")
            return
        }

        try {
            auctionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'auction.label', default: 'Auction'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'auction.label', default: 'Auction'), id])
            redirect(action: "show", id: id)
        }
    }

//    def tryGeocode () {
//        geocodeService = new GeocodeService()
//        geocodeService.autoCompleteRequest("tel_aviv")
//
//    }

    def search (){

    }

    def searchp(){

//        Auction.findAll("from Auction auc where  ( 6371 * acos( cos( radians(37) ) * cos( radians( :ulat ) ) * cos( radians( :ulng ) - radians(-122) ) + sin( radians(37) ) * sin( radians( :ulat ) ) ) ) AS distance1  HAVING distance < 25 ORDER BY distance LIMIT 0 , 20", [ulat:"32.1111", ulng :"34.0001"] );
//         def res = Auction.executeQuery("SELECT id FROM Auction AS a WHERE a.fromAdrLat IS NOT NULL AND a.fromAdrLng IS NOT NULL AND 6371.0*ACOS(COS(RADIANS(a.fromAdrLat))*COS(RADIANS(:qlat))*COS(RADIANS(a.fromAdrLng)-RADIANS(:qlng)) + SIN(RADIANS(a.fromAdrLat))*SIN(RADIANS(:qlat)) ) < :qradius ", [qlat:32.819434d, qlng:34.9989550d, qradius:50d])  ;
//         def aucs =  Auction.findById(res)
//        def searchDate = params.date('searchDate', 'dd-MM-yyyy'  )


//      Query the db according to user params
        def sd = new Date(params.searchDate)
        def res = Auction.executeQuery("""
            SELECT id FROM Auction AS a WHERE a.fromAdrLat IS NOT NULL AND a.fromAdrLng IS NOT NULL AND a.toAdrLat IS NOT NULL AND a.toAdrLng IS NOT NULL
            AND 6371.0*ACOS(COS(RADIANS(a.fromAdrLat))*COS(RADIANS(:qlatf))*COS(RADIANS(a.fromAdrLng)-RADIANS(:qlngf)) + SIN(RADIANS(a.fromAdrLat))*SIN(RADIANS(:qlatf)) ) < :qradius
            AND 6371.0*ACOS(COS(RADIANS(a.toAdrLat))*COS(RADIANS(:qlatt))*COS(RADIANS(a.toAdrLng)-RADIANS(:qlngt)) + SIN(RADIANS(a.toAdrLat))*SIN(RADIANS(:qlatt)) ) < :qradius
            AND a.deadlineDate <= :qsearchDate AND a.status ='open' """,
            [qlatf:"${params.fromAdrLat}", qlngf:"${params.fromAdrLng}",qlatt:"${params.toAdrLat}",qlngt:"${params.toAdrLng}", qradius:15d, qsearchDate:sd]);

//      Get the relevant auctions
        def auctions =  Auction.findAllByIdInList(res)




    }

    def transfer(Long userId, Long auctionId){
        String tmpStorageDirectory = grailsApplication.config.fileupload.directory?:'/Users/Ofir/sheepers_dev/user-images'

        String newStorageDirectory = tmpStorageDirectory + '/' + userId + '/' + auctionId
        tmpStorageDirectory += '/' + userId   + '/tmp'

        def newStorageDirectoryFolder = new File(newStorageDirectory)
        if( !newStorageDirectoryFolder.exists() ){
            newStorageDirectoryFolder .mkdirs()
        }

        def folder = new File( "$tmpStorageDirectory" )
        folder.eachFile {
            if (it.isFile()){
                def tmpFile = new File (it.path)
                def newFile = new File (newStorageDirectory + '/' + it.name)
                tmpFile.withInputStream { is->
                    newFile << is
                }
            }
        }
        folder.deleteDir()
    }

}

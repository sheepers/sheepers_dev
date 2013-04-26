package sheepers

import sheepers.AuctionItem
import  sheepers.Address
import grails.converters.JSON

class Auction {



    //BigInteger auctionId
    String fromAdr
    String fromAdrGoogleMapsRef
    String toAdr
    String toAdrGoogleMapsRef

    String fromFloor
    String toFloor
    Set<byte[]> photos

    String status

    //String name
    Date dateCreated
    Date deadlineDate
    boolean IsElevator
    boolean disassmble
    Integer maxAmount
    String comments
    List items

    static belongsTo = Profile
    static hasOne = [profile : Profile]
    static hasMany = [bids: Bid, items:AuctionItem]
    //static embedded = ['toAdr','fromAdr']


    static constraints = {
        maxAmount (nullable: true)
        comments (nullable: true)
        status inList: ['open','expired','closed']


        //photos nullable: true

        //photos size : 0..15

    }

    static mapping = {
        bids sort: 'amount'
        items cascade:"all-delete-orphan"

    }
    /*replace with dynamic sorting in the future */

}
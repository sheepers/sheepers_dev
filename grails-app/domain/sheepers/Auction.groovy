package sheepers

class Auction {



    //BigInteger auctionId
    String fromAdr
    Double fromAdrLat
    Double fromAdrLng
    String toAdr
    Double toAdrLat
    Double toAdrLng

    String fromFloor
    String toFloor

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




    }

    static mapping = {
        bids sort: 'amount'
        items cascade:"all-delete-orphan"

    }
    /*replace with dynamic sorting in the future */

}
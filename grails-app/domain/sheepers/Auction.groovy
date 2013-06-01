package sheepers

class Auction {

    String fromAdr
    Double fromAdrLat
    Double fromAdrLng
    String toAdr
    Double toAdrLat
    Double toAdrLng

    String fromFloor
    String toFloor

    String status
    Date dateCreated
    Date deadlineDate
    boolean IsElevator
    boolean disassmble
    Integer maxAmount
    String comments
    List items

    String type


    static belongsTo = Profile
    static hasOne = [profile : Profile]
    static hasMany = [bids: Bid, items:AuctionItem]
    //static embedded = ['toAdr','fromAdr']


    static constraints = {
        maxAmount (nullable: true)
        comments (nullable: true)
        status inList: ['open','expired','closed']
        type inList: [ 'הובלה קטנה','סטודיו קטן','סטודיו גדול/דירת חדר','2 חדרים','3 חדרים','4 חדרים','5 חדרים','5+ חדרים']



    }

    static mapping = {
        bids sort: 'amount'
        items cascade:"all-delete-orphan"

    }
    /*replace with dynamic sorting in the future */

}
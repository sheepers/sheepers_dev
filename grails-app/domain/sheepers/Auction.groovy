package sheepers

import sheepers.AuctionItem
import  sheepers.Address

class Auction {



    //BigInteger auctionId
    String fromAdr
    String toAdr
    String fromFloor
    String toFloor
    Set<byte[]> photos

    //String name
    Date dateCreated
    Date deadlineDate
    boolean IsElevator
    boolean disassmble
    Integer maxAmount
    String comments



    static belongsTo = Profile
    static hasOne = [profile : Profile]

    static hasMany = [bids: Bid, items:AuctionItem]
    //static embedded = ['toAdr','fromAdr']



    static constraints = {
        maxAmount (nullable: true)
        comments (nullable: true)
        //photos nullable: true

        //photos size : 0..15

    }

    static mapping = { bids sort: 'amount'}
    /*replace with dynamic sorting in the future */

}
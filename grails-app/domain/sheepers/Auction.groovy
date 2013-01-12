package sheepers

import sheepers.AuctionItem
import  sheepers.Address

class Auction {

    //BigInteger auctionId
    Address fromAdr
    Address toAdr
    String name

    static belongsTo = Profile
    static hasOne = [profile : Profile]

    static hasMany = [bids: Bid, items:AuctionItem]
    static embedded = ['toAdr','fromAdr']



    static constraints = {
    }

    static mapping = { bids sort: 'amount'}
    /*replace with dynamic sorting in the future */

}
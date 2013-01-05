package sheepers

import sheepers.AuctionItem
import  sheepers.Address

class Auction {

    BigInteger auctionId
    Address fromAdr
    Address toAdr
    String name

    static hasMany = [bids: Bid, items:AuctionItem]
    static embedded = ['toAdr','fromAdr']

    //

    static constraints = {
    }


}
package sheepers

import sheepers.AuctionItem
import  sheepers.Address

class Auction {

    BigInteger auctionId
    Address fromAdr
    Address toAdr
    String name
    ArrayList<AuctionItem>  items
    static hasMany = [bids: Bid]


    static constraints = {
    }


}
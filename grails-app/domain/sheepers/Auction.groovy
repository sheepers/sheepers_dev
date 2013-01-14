package sheepers

import sheepers.AuctionItem
import  sheepers.Address

class Auction {



    //BigInteger auctionId
    String fromAdr
    String toAdr
    String name
    Date dateCreated
    Date deadlineDate




    static belongsTo = User
    static hasOne = [user : User]

    static hasMany = [bids: Bid, items:AuctionItem]
    //static embedded = ['toAdr','fromAdr']



    static constraints = {
    }

    static mapping = { bids sort: 'amount'}
    /*replace with dynamic sorting in the future */

}
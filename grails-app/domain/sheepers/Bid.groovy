package sheepers



class Bid {


     static belongsTo = [ auction : Auction, bid_user:  Profile]


    //BigInteger bidId
    float amount
    Date dateCreated

    static constraints = {
        amount blank:false

    }
}

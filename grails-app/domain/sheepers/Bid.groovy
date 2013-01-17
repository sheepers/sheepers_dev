package sheepers



class Bid {


     static belongsTo = [Auction, User]
     static hasOne = [bid_user: User,  auction: Auction]


    //BigInteger bidId
    float amount
    Date dateCreated

    static constraints = {
        amount blank:false

    }
}

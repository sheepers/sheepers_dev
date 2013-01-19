package sheepers



class Bid {


     static belongsTo = [Auction, Profile]
     static hasOne = [bid_profile: Profile,  auction: Auction]


    //BigInteger bidId
    float amount
    Date dateCreated

    static constraints = {
        amount blank:false

    }
}

package sheepers



class Bid {


     static belongsTo = [ auction : Auction, bid_user:SUser]


    BigInteger _bidId
    float _amount
    Date _date

    //SUser _bid_user




    static constraints = {
    }
}

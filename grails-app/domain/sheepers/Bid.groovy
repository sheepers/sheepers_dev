package sheepers



class Bid {


     static belongsTo = [ _auction : Auction]


    BigInteger _bidId
    float _amount
    Date _date
   // Auction _auction
    SUser _bid_user




    static constraints = {
    }
}

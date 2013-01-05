package sheepers

class SUser extends User{

    enum UserType  {Customer,Carrier}
    String PhoneNumber
    static hasMany = [bids:Bid, auctions:Auction]


    static constraints = {

    }
}

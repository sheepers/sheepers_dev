package sheepers

class Profile extends User{

    enum UserType  {Customer,Carrier}
    String PhoneNumber
    static hasMany = [bids:Bid, auctions:Auction]


    static constraints = {

    }
}

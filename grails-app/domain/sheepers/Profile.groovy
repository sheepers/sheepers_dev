package sheepers

class Profile extends User{

    enum UserType  {Customer,Carrier}
    String userPhoneNumber
    static hasMany = [bids:Bid, auctions:Auction]


    static constraints = {
        userPhoneNumber blank: true
    }
}

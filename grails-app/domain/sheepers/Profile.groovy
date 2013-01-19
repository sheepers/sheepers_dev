package sheepers

class Profile {

    enum UserType  {Customer,Carrier}
    String userPhoneNumber

    static belongsTo = User
    static hasOne = [user: User]
    static hasMany = [ bids: Bid, auctions: Auction]

    static constraints = {
       userPhoneNumber nullable: true
    }
}

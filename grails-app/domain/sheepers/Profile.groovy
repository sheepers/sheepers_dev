package sheepers

class Profile {

    EUserType userType
    String userPhoneNumber

    static belongsTo = User

    static hasMany = [ bids: Bid, auctions: Auction]

    static constraints = {
       userPhoneNumber nullable: true
       userType nullable: true
    }
}

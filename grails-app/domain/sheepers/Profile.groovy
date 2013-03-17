package sheepers

class Profile {

    UserType userType
    String userPhoneNumber

    static belongsTo = [user : User ]

    static hasMany = [ bids: Bid, auctions: Auction]

    static constraints = {
       userPhoneNumber nullable: true

    }
}

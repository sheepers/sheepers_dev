package sheepers

class Profile {

    //EUserType userType
    String userPhoneNumber
    String userType
    static belongsTo = [user : User]

    static hasMany = [ bids: Bid, auctions: Auction]

    static constraints = {
       userPhoneNumber nullable: true
       userType inList:["Carrier","Customer"]

    }
}

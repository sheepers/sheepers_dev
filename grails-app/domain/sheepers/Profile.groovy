package sheepers

class Profile {


    String userPhoneNumber
    String perName
    String perAdd
    String aboutTxt
    String userType
    static belongsTo = [user : User]

    static hasMany = [ bids: Bid, auctions: Auction]

    static constraints = {
       userPhoneNumber nullable: true
        aboutTxt nullable: true
        perName nullable: true
        perAdd nullable: true
       userType inList:["Carrier","Customer"]

    }
}

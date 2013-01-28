package sheepers



class AuctionItem {

    static belongsTo = [Auction]
    static hasOne = [auction: Auction]
    //BigInteger id

    EtypeOfItem typeOfItem
    ESize size

    String comments
    int amountOfBoxes
    //boolean isFragile
    //Set<byte[]> pictures



static constraints = {
        comments( nullable: true)
        amountOfBoxes (nullable : true)

    }



}



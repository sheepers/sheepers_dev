package sheepers


class AuctionItem {

    static belongsTo = [Auction]
    static hasOne = [auction: Auction]
    //BigInteger id
    enum typeOfItem {Closet,Bed,Piano,Refrigerator, Stove, Table, Box, Extra}

    enum size {Small,Medium,Large,XtraLarge}
    String comments
    int amountOfBoxes
    //boolean isFragile
    //Set<byte[]> pictures

    static constraints = {
        comments( nullable: true)
        amountOfBoxes (nullable : true)
    }
}

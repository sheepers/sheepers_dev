package sheepers


class AuctionItem {

    static belongsTo = [Auction]
    static hasOne = [auction: Auction]
    //BigInteger id
    String typeOfItem

    String size
    boolean isFragile
    Set<byte[]> pictures

    static constraints = {

    }
}

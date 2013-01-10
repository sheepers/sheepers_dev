package sheepers


class AuctionItem {

    static belongsTo = [auction : Auction]

    //BigInteger id
    String typeOfItem

    String size
    boolean isFragile
    Set<byte[]> pictures

    static constraints = {

    }
}

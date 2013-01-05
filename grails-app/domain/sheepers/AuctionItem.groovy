package sheepers


class AuctionItem {

    static belongsTo = [auction : Auction]

    //BigInteger id
    String typeOfItem

    String size
    boolean isFragile
    Set<List<Byte>> pictures

    static constraints = {
    }
}

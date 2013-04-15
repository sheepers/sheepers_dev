package sheepers

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 1/23/13
 * Time: 9:08 AM
 * To change this template use File | Settings | File Templates.
 */
public enum EtypeOfItem {
    Closet, Bed, Piano, Refrigerator, Stove, Table, Box, Extra
}

public enum ESize {
    Small,Medium,Large,XtraLarge


}

public enum EUserType {
    Customer('Customer'),
    Carrier('Carrier')

    String name
    void setEUserType(EUserType e) {
        name = e?.name()
    }
    EUserType (String name)
    {this.name = name}
}
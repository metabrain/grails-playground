package parreira

class Person {

    String name
    Integer balance = 200 //should be a BigInt, but I'll use int to simplify this exercise
    String email

    static hasMany = [transactions: Txn]
    static mappedBy = [transactions: 'sender', transactions: 'receiver']

    static constraints = {
        name size: 4..64, blank: false, nullable: false
        email size: 5..32, blank: false, nullable: false
        //All accounts have a starting balance of £200
        // There are no overdrafts
        balance min: 0, defaultValue: 200, nullable: false
    }

    String toString() {
        return name
    }
}
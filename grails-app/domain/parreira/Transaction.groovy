package parreira

class Transaction {

    Person sender
    Person receiver
    Integer amount
    static belongsTo = [sender: Person, receiver: Person]

    static constraints = {
//        sender nullable: false, blank: false
//        receiver nullable: false, blank: false
        amount min: 1 //transfering 0 money makes no sense?
    }

    String toString() {
        if(sender != null && receiver != null && sender.name != null && receiver.name != null && amount != null)
            return ('Sent ' + amount + '$ to ' + receiver.name + ' from ' + sender.name )
        else
            return super.toString()
    }
}

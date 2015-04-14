package parreira

class Txn {

    Person sender
    Person receiver
    Integer amount
    static belongsTo = [sender: Person, receiver: Person]

    static constraints = {
//        sender nullable: false, blank: false
//        receiver nullable: false, blank: false
        amount(min: 1, //transfering 0 money makes no sense?
//                validator: { amount, txn, errors ->
//                    println "VALIDING!"
//                    if (amount > txn.sender.balance) {
//                        errors.rejectValue( "amount", "transaction.insufficient_balance", "The transaction amount cannot be lesser than the balance of the origin account.")
//                        return false
//                    }
//                    return true;
//                }, /
//                Message: Ambiguous method overloading for method grails.spring.BeanBuilder#registerBeans.
//                Cannot resolve which method to invoke for [null] due to overlapping prototypes between:
//                [interface org.codehaus.groovy.grails.commons.spring.RuntimeSpringConfiguration]
//                        [interface org.springframework.beans.factory.support.BeanDefinitionRegistry]
//                Line | Method
        )
    }

    String toString() {
        if(sender != null && receiver != null && sender.name != null && receiver.name != null && amount != null)
            return ('Sent ' + amount + '$ to ' + receiver.name + ' from ' + sender.name )
        else
            return super.toString()
    }
}
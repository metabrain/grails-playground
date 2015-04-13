package parreira

import grails.transaction.Transactional

@Transactional
class TransactionService {

    @Transactional //need to be atomic
    def performTransaction(Transaction txn) {
        Person sender = txn.sender
        Person receiver = txn.receiver
        Integer amount = txn.amount

        sender.balance = sender.balance - amount
        receiver.balance = receiver.balance + amount

//        sender.save
//        receiver.save
    }
}

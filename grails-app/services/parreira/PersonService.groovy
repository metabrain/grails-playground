package parreira

import grails.transaction.Transactional

@Transactional
class PersonService {

    @Transactional(readOnly = true)
    def getAllTxnsForAccount(Person person) {
//        return person.transactions //Why doesnt this work?!
        return Txn.findAllByReceiverOrSender(person, person)
    }

    @Transactional(readOnly = true)
    def getAccountForId(int id) {
        return Person.get(id)
    }

    @Transactional(readOnly = true)
    def notifyIntervenientsByEmail(Txn txnInstance, mailService) {

    }
}

package parreira


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional


@Transactional(readOnly = true)
class TxnController {
    def mailService
    def txnService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Txn.list(params), model: [txnInstanceCount: Txn.count()]
    }

    def show(Txn txnInstance) {
        respond txnInstance
    }

    def create() {
        respond new Txn(params)
    }

    @Transactional
    def save(Txn txnInstance) {
        if (txnInstance == null) {
            notFound()
            return
        }

        // Couldnt use "correct way to validate" using custom validator in domain class, see note in Txn.groovy...
        if(txnInstance.amount > txnInstance.sender.balance) {
            txnInstance.errors.rejectValue( "amount", "transaction.insufficient_balance", "Sender account does not have enough funds.")
        }

        if (txnInstance.hasErrors()) {
            respond txnInstance.errors, view: 'create'
            return
        }

        //all clear, make transfer
        txnService.performTransaction(txnInstance)

        // Cant load the plugin for some reason...
//        sendMail {
//            to txnInstance.receiver.email
//            subject "Transfer received successfully"
//            body 'Received '+txnInstance.amount+'$ from '+txnInstance.sender.name+'.'
//        }
//        sendMail {
//            to txnInstance.sender.email
//            subject "Transfer sent successfully"
//            body 'Sent '+txnInstance.amount+'$ to '+txnInstance.receiver.name+'.'
//        }

        txnInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = "Tranfer has been completed successfully!"
                redirect txnInstance
            }
            '*' { respond txnInstance, [status: CREATED] }
        }
    }

    def edit(Txn txnInstance) {
        respond txnInstance
    }

    @Transactional
    def update(Txn txnInstance) {
        if (txnInstance == null) {
            notFound()
            return
        }

        if (txnInstance.hasErrors()) {
            respond txnInstance.errors, view: 'edit'
            return
        }

        txnInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Txn.label', default: 'Txn'), txnInstance.id])
                redirect txnInstance
            }
            '*' { respond txnInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Txn txnInstance) {

        if (txnInstance == null) {
            notFound()
            return
        }

        txnInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Txn.label', default: 'Txn'), txnInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'txn.label', default: 'Txn'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}

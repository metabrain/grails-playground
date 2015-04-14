import parreira.Person

class BootStrap {

    def init = { servletContext ->
        def AAAAA = new Person(name: "AAAAA", email: "AAAAA", balance:200)
        AAAAA.save()
        def BBBBB = new Person(name: "BBBBB", email: "BBBBB", balance:200)
        BBBBB.save()
        def CCCCC = new Person(name: "CCCCC", email: "CCCCC", balance:200)
        CCCCC.save()

        println "initializing data..."
    }
    def destroy = {
    }
}

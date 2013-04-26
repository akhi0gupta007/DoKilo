package codebee
import com.codebee.User
class SecurityFilters {

    def filters = {

             all(controller:'*', action:'*') {
            before = {

                if (!session.user) {
                    def user = User.findByDomain(request.getServerName())
                   // log.info(request.getServerName() +  user)

                    if(user){
                        session["user"] = user
                        session["flag"] = "customer"
                        redirect(controller: "sales",action: "store")
                    }

                  //  log.info("The website accesed")

                  //  return false
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->
               // log.info "Finished running ${controllerName} -

            }
        }

        all(controller:'product', action:'*') {
            before = {
                if (!session.user) {
                    redirect(uri: "/")
                     flash.message = "Session Expired"
                    return false

                }

                if(session.user && session.flag){
                    redirect(controller: "sales",action: "store")
                  //  flash.message = "Session Expired"
                    return false
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->
               // log.info "Finished running ${controllerName} -

            }
        }

        all(controller:'xlsUploader', action:'*') {
            before = {
                if (!session.user) {
                    redirect(uri: "/")
                     flash.message = "Session Expired"
                    return false

                }

                if(session.user && session.flag){
                    redirect(controller: "sales",action: "store")
                    //  flash.message = "Session Expired"
                    return false
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->
                // log.info "Finished running ${controllerName} -

            }
        }
        all(controller:'customCollection', action:'*') {
            before = {
                if (!session.user) {
                    redirect(uri: "/")
                     flash.message = "Session Expired"
                    return false

                }

                if(session.user && session.flag){
                    redirect(controller: "sales",action: "store")
                    //  flash.message = "Session Expired"
                    return false
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->
                // log.info "Finished running ${controllerName} -

            }
        }

            all(controller:'templates', action:'*') {
            before = {
                if (!session.user) {
                    redirect(uri: "/")
                    flash.message = "Session Expired"
                    return false

                }

                if(session.user && session.flag){
                    redirect(controller: "sales",action: "store")
                    //  flash.message = "Session Expired"
                    return false
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->
                // log.info "Finished running ${controllerName} -

            }
        }
           all(controller:'homepage', action:'*') {
            before = {
                if (!session.user) {
                    redirect(uri: "/")
                    flash.message = "Session Expired"
                    return false

                }

                if(session.user && session.flag){
                    redirect(controller: "sales",action: "store")
                    //  flash.message = "Session Expired"
                    return false
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->
                // log.info "Finished running ${controllerName} -

            }
        }
         all(controller:'profile', action:'*') {
            before = {
                if (!session.user) {
                    redirect(uri: "/")
                    flash.message = "Session Expired"
                    return false

                }

                if(session.user && session.flag){
                    redirect(controller: "sales",action: "store")
                    //  flash.message = "Session Expired"
                    return false
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->
                // log.info "Finished running ${controllerName} -

            }
        }

             all(controller:'shipping', action:'*') {
            before = {
                if (!session.user) {
                    redirect(uri: "/")
                    flash.message = "Session Expired"
                    return false

                }

                if(session.user && session.flag){
                    redirect(controller: "sales",action: "store")
                    //  flash.message = "Session Expired"
                    return false
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->
                // log.info "Finished running ${controllerName} -

            }
        }

        all(controller:'newsLetters', action:'*') {
            before = {
                if (!session.user) {
                    redirect(uri: "/")
                    flash.message = "Session Expired"
                    return false

                }

                if(session.user && session.flag){
                    redirect(controller: "sales",action: "store")
                    //  flash.message = "Session Expired"
                    return false
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->
                // log.info "Finished running ${controllerName} -

            }
        }

             all(controller:'blog', action:'*') {
            before = {
                if (!session.user) {
                    redirect(uri: "/")
                    flash.message = "Session Expired"
                    return false

                }

                if(session.user && session.flag){
                    redirect(controller: "sales",action: "store")
                    //  flash.message = "Session Expired"
                    return false
                }

            }
            after = { Map model ->

            }
            afterView = { Exception e ->
                // log.info "Finished running ${controllerName} -

            }
        }

    }
}

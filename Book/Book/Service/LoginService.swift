import UIKit

class LoginService{
    
    func login(email: String, senhaHash: String){
        HttpService().get(url: "/books");

    }
    

}

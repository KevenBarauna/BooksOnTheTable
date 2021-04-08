import UIKit

class LoginService{
    
    func login(email: String, senhaHash: String){
        let retorno = HttpService().get(url: "/books");
        print(retorno)
    }
    
    func registrar(usuario: Usuario){
        let body = [
            "name" : usuario.nome,
            "email" : usuario.email,
            "password" : usuario.senha
        ];
        do{
            
            let json = try JSONSerialization.data(withJSONObject: body, options: [])
            let retorno = HttpService().post(url: "/users", body: json)
            print(retorno)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    

}

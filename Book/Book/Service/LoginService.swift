import UIKit

class LoginService{
    
    func login(email: String, senhaHash: String){
        let retorno = HttpService().get(url: "/books");
        print(retorno)
    }
    
    func registrar(usuario: Usuario){
        
        var retorno: Data?
       
            let body = [
                "name" : usuario.nome,
                "email" : usuario.email,
                "password" : usuario.senha
            ];
            do{
                
                let json = try JSONSerialization.data(withJSONObject: body, options: [])
                
                let serialQueue = DispatchQueue(label: "serial")
                serialQueue.async {
                   retorno = HttpService().post(url: "/users", body: json)
                }
                
                guard let resposta = retorno else { print("Retorna"); return }
                
                let res = try JSONDecoder().decode(ErroApi.self , from: resposta)
                print(res.error)
                print(res.reason)
                
            } catch {
                print(error.localizedDescription)
            }
        
        
    }
    
    

}

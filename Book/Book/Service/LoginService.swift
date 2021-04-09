import UIKit

class LoginService{
    
    func login(email: String, senha: String) -> Bool{
        //let retorno = HttpService().get(url: "/books");
        //print(retorno)
            
        let body = [
            "email" : email,
            "password" : senha
        ];
        
        do{
            let json = try JSONSerialization.data(withJSONObject: body, options: [])
            let retorno = HttpService().post(url: "/security/token", body: json)
            print(retorno);
            return true;
            
        } catch {
            print(error.localizedDescription);
            return false
        }
        
        
        
    }
    
    func registrar(usuario: Usuario) -> Bool {
        
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
                print("Retorno: \(retorno)")
                
                guard let resposta = retorno else { print("Retorna"); return false }
                                
                let resErro = try JSONDecoder().decode(ErroApi.self , from: resposta);
                
                let resUsuario = try JSONDecoder().decode(Usuario.self, from: resposta);
                
                print(resErro.error)
                print(resErro.reason)
                print(resUsuario.email)
                print(resUsuario.senha)
                
            } catch {
                print(error.localizedDescription)
            }
        return true
        
    }
    
    

}

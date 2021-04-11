import Foundation

class App {
    
    
    func MontarError(dados: [String:Any]?) -> ErroApi?{

        guard let erro = dados?["error"] else {
            print("Erro converter erro **")
            return nil
        }
        guard let reason = dados?["reason"] else {
            print("Erro converter reano **")
            return nil
        }
        
        guard let reasonStr = reason as? String else {
            return nil
        }
        
        return ErroApi(error: true, reason: reasonStr)
        
    }
    
    func montarUsuario(dados: [String:Any]?) -> Usuario?{
        guard let nome = dados?["name"] else {
            print("Erro converter nome **")
            return nil
        }
        guard let email = dados?["email"] else {
            print("Erro converter email **")
            return nil
        }
        
        guard let nomeStr = nome as? String else {
            return nil
        }
        guard let emailStr = email as? String else {
            return nil
        }
        
       return Usuario(id: nil, nome: nomeStr, email: emailStr, senha: "")

    }
    
}

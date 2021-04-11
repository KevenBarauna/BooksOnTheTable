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
        //
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
    
    func montarUsuarioToken(dados: [String:Any]?) -> String?{
        //{"token":"E8D3B322-5001-4DCC-874B-B1FFEDCE0C60","createdAt":"2021-04-04T14:16:09Z","expiresAt":"2021-04-05T14:16:09Z"}
        guard let token = dados?["token"] else {
            print("Erro converter nome **")
            return nil
        }
        guard let criacao = dados?["createdAt"] else {
            print("Erro converter email **")
            return nil
        }
        guard let validade = dados?["expiresAt"] else {
            print("Erro converter email **")
            return nil
        }
        
        print("Criação \(criacao) - validade: \(validade) - token: \(token)")
        
        guard let tokenStr = token as? String else {
            return nil
        }
               
       return tokenStr

    }
}

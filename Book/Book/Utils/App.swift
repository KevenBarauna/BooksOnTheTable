import Foundation

class App {
    
    
    func mountError(dados: [String:Any]?) -> ErroApi?{
        //VERIFICA SE "DADOS" É UM ErroApi

        guard let reason = dados?["reason"] else {
            print("* Não foi possível converter a reason - montarErro")
            return nil
        }
        
        guard let reasonStr = reason as? String else {
            return nil
        }
        
        return ErroApi(error: true, reason: reasonStr)
        
    }
    
    func mountUsuario(dados: [String:Any]?) -> Usuario?{
        //VERIFICA SE "DADOS" É UM Usuario
        guard let nome = dados?["name"] else {
            print("* Não foi possível converter o nome - montarUsuario")
            return nil
        }
        guard let email = dados?["email"] else {
            print("* Não foi possível converter o email - montarUsuario");
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
    
    func mountToken(dados: [String:Any]?) -> String?{
        //VERIFICA SE "DADOS" TEM UM TOKEN
        guard let token = dados?["token"] else {
            print("* Não foi possível converter o token - montarToken");
            return nil
        }
        
        guard let tokenStr = token as? String else {
            return nil
        }
               
        self.printSucesso(tokenStr)
        
       return tokenStr

    }
    
    func mountBookList(dados: [String:Any]?) -> String?{
        print("------------------------------------------")

        guard let itens = dados?["items"] else {
            print("* Não foi possível converter o itens - mountBookList");
            return nil
        }

        let quantidade = (itens as AnyObject).count;
        let books: [String:Any]
        
        //if(quantidade ?? 0 > 0){
            let converted = dados?.compactMapValues { $0 as? String }
            print("convertido \(converted)")
//            for livro in converted{
//
//            }
      //  }
        
        do{
            var str = itens as? String
            let dataObj: Data? = str?.data(using: .utf8)
            guard let data = dataObj else {print("nil k");return nil}
            let livros = try JSONDecoder().decode(LivroApi.self, from: data)
            
            print("1 livros \(livros)")
            
//            for livro in livros ?? [] {
//                print("Livro: , \(livro)!")
//            }
            
        }catch{
            print("* Erro na conversão book")
            return nil
        }
                
       return nil

    }
    
    //MARK: - PRINT
    
    func printErro(_ error: Error){
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        print("Error Http Serive: \(error)")
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    }
    func printSucesso(_ sucesso: String){
        print("##############################")
        print("Response data string: \(sucesso)")
        print("##############################")
        
    }
}

import Foundation

class App {
    
    
    func mountError(dados: [String:Any]?) -> ErroApi?{
        //VERIFICA SE "DADOS" É UM ErroApi

        guard let reason = dados?["reason"] else {
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
            debugPrint("* Não foi possível converter o token - montarToken");
            return nil
        }
        
        guard let tokenStr = token as? String else {
            return nil
        }
                       
       return tokenStr

    }
    
    func mountBookList(dados: [String:Any]?) -> [Livro]?{
        //VERIFICA SE TEM LISTA DE LIVRO
        print("------------------------------------------")

        guard let itens = dados?["items"] else {
            print("* Não foi possível converter o itens - mountBookList");
            return nil
        }
        
        do{
            
            var books: [Livro]?
            
            if let rows = itens as? [[String: String]] {
                
                for r in rows{
                   
                    guard
                        let id = r["id"],
                        let titulo = r["title"],
                        let autor = r["author"],
                        let genero = r["genre"],
                        let status = r["status"]
                    else { return nil }

                    let liv = Livro(id: id, titulo: titulo, autor: autor, genero: genero, status: status)
                    books?.append(liv);
                }
            }
            return books
                        
        }catch{
            print("* Erro na conversão book - \(LocalizedError.self)")
            return nil
        }
                
    }
    
//    func testeF(){
//        fetchData { (dict, error) in
//            if let rows = dict?["rows"] as? [[String: Any]] {
//                if let firstRow = rows.first {
//                    print("firstRow is")
//                    print(firstRow["elements"])
//                    //Unwrap and cast `firstRow["elements"]`.
//                    if let elements = firstRow["elements"] as? [[String: Any]] {
//                        //The value for "duration" is a Dictionary, you need to cast it again.
//                        if let duration = elements.first?["duration"] as? [String: Any] {
//                            print(duration["text"] as? String)
//                            print(duration["value"] as? Int)
//                        }
//                    }
//                }
//            }
//        }
//    }
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

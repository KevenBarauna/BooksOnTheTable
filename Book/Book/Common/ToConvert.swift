//CLASSE RESPONSAVEL PARA CONVERTER ITENS DA API

class ToConvert {
    
    func mountError(dados: [String:Any]?) -> ErrorApi?{

        guard let reason = dados?["reason"] else {
            return nil
        }
        
        guard let reasonStr = reason as? String else {
            return nil
        }
        
        return ErrorApi(error: true, reason: reasonStr)
        
    }
    
    func mountUsuario(dados: [String:Any]?) -> User?{
        guard let nome = dados?["name"] else {
            debugPrint("* Não foi possível converter o nome - montarUsuario")
            return nil
        }
        guard let email = dados?["email"] else {
            debugPrint("* Não foi possível converter o email - montarUsuario");
            return nil
        }
        
        guard let nomeStr = nome as? String else {
            return nil
        }
        guard let emailStr = email as? String else {
            return nil
        }
        
       return User(id: nil, name: nomeStr, email: emailStr, password: "")

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
    
    func mountBookList(dados: [String:Any]?) -> [BookModel]?{
        //VERIFICA SE TEM LISTA DE LIVRO
        guard let itens = dados?["items"] else {
            debugPrint("* Não foi possível converter o itens - mountBookList");
            return nil
        }
        

            var books: [BookModel] = [];
            
            if let rows = itens as? [[String: String]] {
                
                for r in rows{
                   
                    guard
                        let id = r["id"],
                        let titulo = r["title"],
                        let autor = r["author"],
                        let genero = r["genre"],
                        let status = r["status"]
                    else { return nil }

                    let liv = BookModel(author: autor, id: id, title: titulo, status: status, genre: genero)
                    books.append(liv);
                }
            }
            return books
                
    }
    
}

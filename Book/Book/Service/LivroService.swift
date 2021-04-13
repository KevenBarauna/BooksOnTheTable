// -- RESPONSAVEL POR MONTAR AS REQUISIÇÕES DO LIVRO --\\

import UIKit
import Alamofire

class LivroService{
    
    //MARK: - HTTP REQUEST
    
    func cadastrar(livro: Livro, view: UIViewController){
        let body = [
            "title" : livro.titulo,
            "author" : livro.autor,
            "genre" : livro.genero,
            "status" : livro.status
        ];
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)"
        ]
        
        HttpService().post(body, "/books", headers) { (add, data) in
            self.handleCadastrar(add, data, view);
        }
    }
    
    func getAll(page: String = "10", tamMax: String = "3", view: UIViewController){
        
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(token)"
            ]

        HttpService().get("/books?page=\(page)&per=\(tamMax)", headers) { (add, data) in
            self.handleGetAll(add, data, view);
        }
        
        //"http://127.0.0.1:8080/books?page=<page number>&per=<records per page>" \
        //
        //    -H "Content-Type: application/json" \
        //    -H "Authorization: Bearer {token}"
    }
    
    
    
    
    //MARK: - HANDLE
    
    func handleCadastrar(_ add: Bool, _ data: Any, _ view: UIViewController){
        if add {
            let isErro = App().mountError(dados: data as? [String : Any]);
            if(isErro?.error == true){
                guard let mensagem = isErro?.reason else {return}
                AlertaUtil().showMensagem(titulo: msgErro, mensagem: "\(mensagem)", view: view)
            }else{
                AlertaUtil().showMensagemActionButton(titulo: msgSucesso, mensagem: "", view: view, funcCompletion: {_ in
                    let TelaHome = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idHome) as? HomeViewController
                    view.navigationController?.pushViewController(TelaHome ?? view, animated: true)
                })
            }
        } else {
            AlertaUtil().showMensagem(titulo: msgErro, mensagem: msgErroInesperado, view: view)
        }
    }
    
    func handleGetAll(_ add: Bool, _ data: Any, _ view: UIViewController){
        if add {
            let isErro = App().mountError(dados: data as? [String : Any]);
            if(isErro?.error == true){
                guard let mensagem = isErro?.reason else {return}
                AlertaUtil().showMensagem(titulo: msgErro, mensagem: "\(mensagem)", view: view)
            }else{
                let convet = App().mountBookList(dados: data as? [String : Any])
                print(data)
               // App().printSucesso(data as! String)
            }
        } else {
            AlertaUtil().showMensagem(titulo: msgErro, mensagem: msgErroInesperado, view: view)
        }
    }


}

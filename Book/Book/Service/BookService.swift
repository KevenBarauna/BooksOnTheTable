// -- RESPONSAVEL POR MONTAR AS REQUISIÇÕES DO LIVRO --\\

import UIKit
import Alamofire

class BookService{
    
    //MARK: - HTTP REQUEST
    
    func register(_ book: BookModel, view: UIViewController){
        
        let body = [
            "title" : book.title,
            "author" : book.author,
            "genre" : book.genre,
            "status" : book.status
        ];
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(tokenData)"
        ]
        
        HttpService().post(body, "/books", headers) { (add, data) in
            self.handleCadastrar(add, data, view);
        }
    }
    
    
    func getAll(page: String = "10", tamMax: String = "3", view: UIViewController? = nil){
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(tokenData)"
        ]
        HttpService().get("/books?page=\(page)&per=\(tamMax)", headers) { (add, data) in
            self.handleGetAll(add, data, view);
        }
        
    }
    
    
    
    
    //MARK: - HANDLE
    
    func handleCadastrar(_ sucess: Bool, _ data: Any, _ view: UIViewController){
        let convert = ToConvert();
        let alert = Alert();
        if sucess {
            let isError = convert.mountError(dados: data as? [String : Any]);
            if(isError?.error == true){
                guard let message = isError?.reason else {return}
                alert.showMensagem(titulo: msgErro, mensagem: "\(message)", view: view)
            }else{
                alert.showMensagemActionButton(titulo: msgSucesso, mensagem: "", view: view, funcCompletion: {_ in
                    let TelaHome = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idHome) as? HomeViewController
                    view.navigationController?.pushViewController(TelaHome ?? view, animated: true)
                })
            }
        } else {
            alert.showMensagem(titulo: msgErro, mensagem: msgErroInesperado, view: view)
        }
    }
    
    func handleGetAll(_ sucess: Bool, _ data: Any, _ view: UIViewController?){
        let convert = ToConvert();
        let alert = Alert();
        if sucess {
            let isError = convert.mountError(dados: data as? [String : Any]);
            if(isError?.error == true){
                guard let message = isError?.reason else {return}
                if let telaView = view {
                    alert.showMensagem(titulo: msgErro, mensagem: "\(message)", view: telaView)
                }
            }else{
                let convert = convert.mountBookList(dados: data as? [String : Any])
                booksData = convert
            }
        } else {
            if let telaView = view {
                alert.showMensagem(titulo: msgErro, mensagem: msgErroInesperado, view: telaView)
                
            }
        }
    }
    
    
}

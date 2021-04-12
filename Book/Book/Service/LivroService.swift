// -- RESPONSAVEL POR MONTAR AS REQUISIÇÕES DO LIVRO --\\

import UIKit

class LivroService{
    
    //MARK: - HTTP REQUEST
    
    func cadastrar(livro: Livro, view: UIViewController){
        let body = [
            "title" : livro.titulo,
            "author" : livro.autor,
            "genre" : livro.genero,
            "status" : livro.status
        ];
        
        HttpService().post(body, "/books") { (add, data) in
            self.handleCadastrar(add, data, view);
        }
    }
    
    
    
    
    //MARK: - HANDLE
    
    func handleCadastrar(_ add: Bool, _ data: Any, _ view: UIViewController){
        if add {
            let isErro = App().mountError(dados: data as? [String : Any]);
            if(isErro?.error == true){
                guard let mensagem = isErro?.reason else {return}
                AlertaUtil().showMensagem(titulo: msgErro, mensagem: "\(mensagem)", view: view)
            }else{
                AlertaUtil().showMensagemActionButton(titulo: msgSucesso, mensagem: msgUsuarioCriadoSucesso, view: view, funcCompletion: {_ in
                    let TelaHome = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idHome) as? HomeViewController
                    view.navigationController?.pushViewController(TelaHome ?? view, animated: true)
                })
            }
        } else {
            AlertaUtil().showMensagem(titulo: msgErro, mensagem: msgErroInesperado, view: view)
        }
    }
    


}

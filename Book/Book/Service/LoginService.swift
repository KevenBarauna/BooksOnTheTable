// -- RESPONSAVEL POR MONTAR AS REQUISIÇÕES DO USUARIO --\\

import UIKit
import Alamofire

class LoginService{
    
    //MARK: - HTTP REQUEST
    
    func login(email: String, senha: String, view: UIViewController){
        let body = [
            "email" : email,
            "password" : senha
        ];
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
            ]
        
        HttpService().post(body, "/security/token", headers) { (add, data) in
            self.handleLogin(add, data, view);
        }
    }
    
    
    func registrar(usuario: Usuario, view: UIViewController){
       
        let body = [
            "name" : usuario.nome,
            "email" : usuario.email,
            "password" : usuario.senha
        ];
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
            ]
        
        HttpService().post(body, "/users", headers) { (add, data) in
            self.handleRegistrar(add, data, view)
        }
    }
    
    
    //MARK: - HANDLE
    
    func handleRegistrar(_ add: Bool, _ data: Any, _ view: UIViewController){
        if add {
            let isErro = App().mountError(dados: data as? [String : Any]);
            if(isErro?.error == true){
                guard let mensagem = isErro?.reason else {return}
                AlertaUtil().showMensagem(titulo: msgErro, mensagem: "\(mensagem)", view: view)
            }else{
                AlertaUtil().showMensagemActionButton(titulo: msgSucesso, mensagem: msgUsuarioCriadoSucesso, view: view, funcCompletion: {_ in
                    let TelaLogin = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idLogin) as? LoginViewController
                    view.navigationController?.pushViewController(TelaLogin ?? view, animated: true)
                    
                })
            }
        } else {
            AlertaUtil().showMensagem(titulo: msgErro, mensagem: msgErroInesperado, view: view)
        }
    }
    
    
    func handleLogin(_ add: Bool, _ data: Any, _ view: UIViewController){
        if add {
            let isErro = App().mountError(dados: data as? [String : Any]);
            if(isErro?.error == true){
                guard let mensagem = isErro?.reason else {return}
                AlertaUtil().showMensagem(titulo: msgErro, mensagem: "\(mensagem)", view: view)
            }else{
                
                let returnToken = App().mountToken(dados: data as? [String : Any]);
                
                let TelaHome = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idHome) as? HomeViewController
                view.navigationController?.pushViewController(TelaHome ?? view, animated: true)
                view.dismiss(animated: true, completion: nil)
                token = returnToken ?? ""
                App().printSucesso(returnToken ?? "Token convet error")
            }
        } else {
            AlertaUtil().showMensagem(titulo: msgErro, mensagem: msgErroInesperado, view: view)
        }
    }
    
    
    
    

}

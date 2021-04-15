// -- RESPONSAVEL POR MONTAR AS REQUISIÇÕES DO USUARIO --\\

import UIKit
import Alamofire

class UserService{
    
    //MARK: - HTTP REQUEST
    
    func login(_ email: String, _ password: String, view: UIViewController){
        let body = [
            "email" : email,
            "password" : password
        ];
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        HttpService().post(body, "/security/token", headers) { (sucess, data) in
            self.handleLogin(sucess, data, view);
        }
    }
    
    
    func registrar(usuario: User, view: UIViewController){
        
        let body = [
            "name" : usuario.name,
            "email" : usuario.email,
            "password" : usuario.password
        ];
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        HttpService().post(body, "/users", headers) { (add, data) in
            self.handleRegistrar(add, data, view)
        }
    }
    
    
    //MARK: - HANDLE
    
    func handleRegistrar(_ sucess: Bool, _ data: Any, _ view: UIViewController){
        let convert = ToConvert();
        let alert = Alert();
        if sucess {
            let isError = convert.mountError(dados: data as? [String : Any]);
            if(isError?.error == true){
                guard let message = isError?.reason else {return}
                alert.showMensagem(titulo: msgErro, mensagem: "\(message)", view: view)
            }else{
                alert.showMensagemActionButton(titulo: msgSucesso, mensagem: msgUsuarioCriadoSucesso, view: view, funcCompletion: {_ in
                let TelaLogin = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idLogin) as? LoginViewController
                view.navigationController?.pushViewController(TelaLogin ?? view, animated: true)
                })
            }
        } else {
            alert.showMensagem(titulo: msgErro, mensagem: msgErroInesperado, view: view)
        }
    }
    
    
    func handleLogin(_ sucess: Bool, _ data: Any, _ view: UIViewController){
        let convert = ToConvert();
        let alert = Alert();
        if sucess {
            let isError = convert.mountError(dados: data as? [String : Any]);
            
            if(isError?.error == true){
                guard let message = isError?.reason else {return}
                alert.showMensagem(titulo: msgErro, mensagem: "\(message)", view: view)
            }else{
                let returnToken = convert.mountToken(dados: data as? [String : Any]);
                tokenData = returnToken ?? ""
            }
            
            let TelaHome = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idHome) as? HomeViewController
            view.navigationController?.pushViewController(TelaHome ?? view, animated: true)
            view.dismiss(animated: true, completion: nil)
            
        } else {
            alert.showMensagem(titulo: msgErro, mensagem: msgErroInesperado, view: view)
        }
    }

    

}

// -- RESPONSAVEL POR MONTAR AS REQUISIÇÕES DO USUARIO --\\

import UIKit

class LoginService{
    
    func login(email: String, senha: String) -> Bool{
        let body = [
            "email" : email,
            "password" : senha
        ];
        
        do{
            let json = try JSONSerialization.data(withJSONObject: body, options: [])
            HttpService().post(url: "/security/token", body: json)
             return true;
            
        } catch {
            print(error.localizedDescription);
            return false
        }
        
    }
    
    func registrar(usuario: Usuario, view: UIViewController){
       
        let body = [
            "name" : usuario.nome,
            "email" : usuario.email,
            "password" : usuario.senha
        ];
        
        HttpService().post(body, "/users") { (add, data) in
            if add {
                let isErro = App().MontarError(dados: data as? [String : Any]);
                
                
                if(isErro?.error == true){
                    guard let mensagem = isErro?.reason else {return}
                    AlertaUtil().showMensagem(titulo: msgErro, mensagem: "\(mensagem)", view: view)
                }else{
                  AlertaUtil().showMensagem(titulo: msgSucesso, mensagem: msgUsuarioCriadoSucesso, view: view);
                   let TelaHome = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idLogin) as? HomeViewController
                   view.navigationController?.pushViewController(TelaHome ?? view, animated: true)
                   view.dismiss(animated: true, completion: nil)
                }
       
            } else {
                print("Erro no registrar - LoginService - \(data)")
            }
        }

    }

}

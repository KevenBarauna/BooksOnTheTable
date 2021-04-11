// -- RESPONSAVEL POR MONTAR AS REQUISIÇÕES DO USUARIO --\\

import UIKit

class LoginService{
    
    func login(email: String, senha: String, view: UIViewController) -> Bool{
        let body = [
            "email" : email,
            "password" : senha
        ];
        
        
        HttpService().post(body, "/security/token") { (add, data) in
            if add {
                let isErro = App().MontarError(dados: data as? [String : Any]);
                
                if(isErro?.error == true){
                    guard let mensagem = isErro?.reason else {return}
                    AlertaUtil().showMensagem(titulo: msgErro, mensagem: "\(mensagem)", view: view)
                }else{
                    let token = App().montarUsuarioToken(dados: data as? [String : Any]);
                    
                   // AlertaUtil().showMensagemActionButton(titulo: msgSucesso, mensagem: "\(token)", view: view, funcCompletion: )
                    
                    AlertaUtil().showMensagem(titulo: msgSucesso, mensagem: "\(token)", view: view);
                   let TelaHome = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idLogin) as? HomeViewController
                   view.navigationController?.pushViewController(TelaHome ?? view, animated: true)
                   view.dismiss(animated: true, completion: nil)
                }
       
            } else {
                print("Erro no login - LoginService - \(data)")
            }
        }
        
        
        
        
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
                    
                    AlertaUtil().showMensagemActionButton(titulo: msgSucesso, mensagem: msgUsuarioCriadoSucesso, view: view, funcCompletion: {_ in
                        print("Olá")
                        let TelaLogin = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idLogin) as? LoginViewController
                        view.navigationController?.pushViewController(TelaLogin ?? view, animated: true)
                        
                    })
                    
                    
                   //AlertaUtil().showMensagem(titulo: msgSucesso, mensagem: msgUsuarioCriadoSucesso, view: view);
                   //let TelaHome = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idLogin) as? HomeViewController
                   //view.navigationController?.pushViewController(TelaHome ?? view, animated: true)
                   //view.dismiss(animated: true, completion: nil)

                    
                }
       
            } else {
                print("Erro no registrar - LoginService - \(data)")
            }
        }

    }

}

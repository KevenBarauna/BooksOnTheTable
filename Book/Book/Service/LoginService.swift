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
    
    func registrar(usuario: Usuario) -> Bool {
        
        var retorno: Data?
       
            let body = [
                "name" : usuario.nome,
                "email" : usuario.email,
                "password" : usuario.senha
            ];
            do{
                
                let json = try JSONSerialization.data(withJSONObject: body, options: [])
                

                HttpService().post(url: "/users", body: json)
                
//                var tentativaMax = 3000;
//                var tentativa = 0
//
//                while tentativa < tentativaMax {
//                   print( "Tentativa: \(tentativa) - retorno: \(retorno)")
//                    if(retorno != nil){
//                        print("Achou \(retorno)")
//                        tentativa = tentativaMax;
//                    }
//                   tentativa = tentativa + 1
//                }
                
                
                
                //print("Retorno: \(retorno)")
                guard let resposta = retorno else { print("Retorna pq não achou nada"); return false}
                //FIM DO PROBLEMA

                                
                let resErro = App().MontarError(dados: resposta);
                if(resErro != nil){
                    print("Erro");
                    return false;
                }
                
                let resUsuario = try JSONDecoder().decode(Usuario.self, from: resposta);
                
                print(resUsuario.email)
                print(resUsuario.senha)
                
            } catch {
                print(error.localizedDescription)
            }
        return true
        
    }
    
    func verificaValor(valor: Data?){
        var tentativaMax = 30;
        var tentativa = 0

        while tentativa < tentativaMax {
           print( "Value of index is \(index)")
           tentativa = tentativa + 1
        }
    }
    

}

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
            let retorno = HttpService().post(url: "/security/token", body: json)
            print(retorno);
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
                
                //PROBLEMA PARA CORRIGIR
                //A VARIAVEL RETORNO DEVE CONTER O VALOR QUE CHEGA DA API, POREM O PRINT DA LINHA 47 EXIBE ANTES DA VARIAVEL SER ATRIBUIDA
                let serialQueue = DispatchQueue(label: "serial")
                serialQueue.async {
                   retorno = HttpService().post(url: "/users", body: json)
                }
                print("Retorno: \(retorno)")
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
    
    

}

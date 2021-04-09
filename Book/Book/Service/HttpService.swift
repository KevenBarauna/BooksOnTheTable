// -- RESPONSAVEL POR ACESSAR A API --\\

import UIKit

class HttpService{
    
    //MARK: - GET
    
    func get(url: String, paramtros: String = "") -> Data? {
        
        var resposta: Data?;
        let url = URL(string: "\(apiRota)\(url)");
        guard let requestUrl = url else { fatalError() }
        let request = URLRequest(url: requestUrl );
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

        if let error = error {
            self.printErro(error)
            return
        }
     
        if let data = data, let dataString = String(data: data, encoding: .utf8) {
            self.printSucesso(dataString)
            resposta = data
                
        }
    }
        task.resume();
        return resposta
    }
    
    //MARK: - POST
    
    func post(url: String, body:Data) -> Data? {
        var resposta: Data?;
        let url = URL(string: "\(apiRota)\(url)");
        guard let requestUrl = url else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
            if let error = error {
                self.printErro(error);
                return ;
            }
         

           if let data = data, let dataString = String(data: data, encoding: .utf8) {
                self.printSucesso(dataString)
                resposta = data;
                    
           }
        }
        task.resume()
        return resposta;
    }
    
    //MARK: - PRINT
    
    private func printErro(_ error: Error){
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        print("Error Http Serive: \(error)")
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
    }
    private func printSucesso(_ sucesso: String){
        print("##############################")
        print("Response data string: \(sucesso)")
        print("##############################")    }
}

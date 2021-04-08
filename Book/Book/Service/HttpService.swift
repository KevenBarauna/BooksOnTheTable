import UIKit

class HttpService{
    
    func get(url: String, paramtros: String = "") -> Data? {
        
        var resposta: Data?;
        let url = URL(string: "\(apiRota)\(url)");
        guard let requestUrl = url else { fatalError() }
        print("#### Url \(requestUrl)");
        let request = URLRequest(url: requestUrl );
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            
        if let error = error {
                print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                print("Error Http Serive: \(error)")
                print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
            return
            }
     
            // Convert HTTP Response Data to a String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("##############################")
                print("Response data string:\n \(dataString)")
                print("##############################")
                resposta = data
                
            }
    }
        task.resume();
        return resposta
    }
    
    
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
                print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                print("Error Http Serive: \(error)")
                print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                return ;
            }
         

                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("##############################")
                    print("Response data string:\n \(dataString)")
                    print("##############################")
                    resposta = data;
                    
                }
        }
        task.resume()
        return resposta;
    }
}

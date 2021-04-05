import UIKit

class LoginService{
    
    func login(email: String, senhaHash: String){
        HttpService().get(url: "/books");
//        guard let url = URL(string:"\(apiRota)/security/authenticate") else {return}
//        let request = URLRequest(url: url );
//
//        let task = URLSession.shared.dataTask(with: request) { (data, response, erro) in
//            if(erro == nil){
//                do{
//                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
//                            //print("Response data string:\n \(dataString)")
//                        }
//                   // let res = try JSONDecoder().decode(ApiResponse.self, from: data!)
//                    //print(res.login)
//                    //print("$ Retorno Data: \(String(describing: data))" )
//                    //print("$$ Headrs Response: \(String(describing: response))" )
//
//                }catch{
//                    print(error.localizedDescription)
//                }
//            }else{
//                print(erro ?? "Erro")
//            }
//    }
//        task.resume();
    }
    

}

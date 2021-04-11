// -- RESPONSAVEL POR ACESSAR A API --\\

import UIKit
import Alamofire


class HttpService{
    
    // MARK - POST2
    
    func addUserService(_ params:Dictionary<String, Any>, completion:@escaping(_ add:Bool, _ data:Any) -> Void){
        guard let url = URL(string: apiRota + "/users") else {return}
        print(url)
        
        Alamofire.request(url, method: .post, parameters: params,encoding: JSONEncoding.default).responseJSON {
            AFdata in
            switch AFdata.result{
            case .success:
                //let jsonString = Utils().generateJsonString(data: AFdata.data!)
                let jsonString = String(data: AFdata.data!, encoding: .utf8);
                //let user = try! JSONDecoder().decode(Login.Users.self, from: jsonString!.data(using: .utf8)!)
                completion(true, jsonString)
                break
            case .failure( _):
                completion(false, "User Not Found")
                break
            }
        }
    }
    
    //MARK: - GET
    
    func get(url: String, paramtros: String = "")  {
        
    }
    
    //MARK: - POST
    
    func post(url: String, body:Data)  {
 
        let body = [
            "name" :"2",
            "email" : "2",
            "password" : "2"
        ];

        addUserService(body) { (add, data) in
            if add {
                print(data)
       
            } else {
                print("Erroooo")
            }
   }
       

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
        print("##############################")
        
    }
}

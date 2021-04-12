// -- RESPONSAVEL POR ACESSAR A API --\\

import UIKit
import Alamofire


class HttpService{
    
    // MARK - POST
    
    func post(_ params:Dictionary<String, Any>, _ url: String ,completion:@escaping(_ add:Bool, _ data:Any) -> Void){
        guard let url = URL(string: apiRota + url) else {return}
        
        Alamofire.request(url, method: .post, parameters: params,encoding: JSONEncoding.default).responseJSON {
            resData in
            switch resData.result{
            case .success:
                do{
                    let json = try JSONSerialization.jsonObject(with: resData.data!, options: []) as? [String : Any]
                    completion(true, json!)
                    break
                }catch{
                    completion(false,"Erro converter Json")
                    break
                }
            case .failure( _):
                completion(false, "Falha")
                break
            }
        }
    }
    
    //MARK: - GET
    
    func get(url: String, paramtros: String = "")  {
        
    }
    

}

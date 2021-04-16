// -- RESPONSAVEL POR ACESSAR A API --\\

import UIKit
import Alamofire


class HttpService{
    
    let alert = Alert();
    
    // MARK - POST
    
    func post(_ params:Dictionary<String, Any>, _ url: String, _ headers: HTTPHeaders ,completion:@escaping(_ sucess:Bool, _ data:Any) -> Void){
        
        guard let url = URL(string: apiRota + url) else {
            alert.showDebug("Erro ao converter url");
            return
        }
        
        Alamofire.request(url, method: .post, parameters: params,encoding: JSONEncoding.default, headers: headers).responseJSON {
            resData in
            switch resData.result{
            case .success:
                do{
                    let json = try JSONSerialization.jsonObject(with: resData.data!, options: []) as? [String : Any]
                    completion(true, json!)
                    break
                }catch{
                    completion(false, "Erro converter Json")
                    break
                }
            case .failure( _):
                completion(false, "Falha")
                break
            }
        }
    }
    
    //MARK: - GET
    
    func get(_ url: String, _ headers: HTTPHeaders, completion:@escaping(_ sucess:Bool, _ data:Any) -> Void) {
        
        guard let url = URL(string: apiRota + url) else {
            alert.showDebug("Erro ao converter url");
            return
        }
        
        let request = Alamofire.request(url, headers: headers)
        request.responseJSON { (resData) in
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
    
    func put(_ params:Dictionary<String, Any>, _ url: String, _ headers: HTTPHeaders ,completion:@escaping(_ sucess:Bool, _ data:Any) -> Void){
        
        guard let url = URL(string: apiRota + url) else {
            alert.showDebug("Erro ao converter url");
            return
        }
        
        Alamofire.request(url, method: .put, parameters: params,encoding: JSONEncoding.default, headers: headers).responseJSON {
            resData in
            switch resData.result{
            case .success:
                do{
                    let json = try JSONSerialization.jsonObject(with: resData.data!, options: []) as? [String : Any]
                    completion(true, json!)
                    break
                }catch{
                    completion(false, "Erro converter Json")
                    break
                }
            case .failure( _):
                completion(false, "Falha")
                break
            }
        }
    }
}

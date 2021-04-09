import Foundation

class App {
    
    func MontarError(dados: Data) -> ErroApi?{
                        
        do{
           return try JSONDecoder().decode(ErroApi.self , from: dados);
        }catch{
            return nil;
        }
        
    }
    
}

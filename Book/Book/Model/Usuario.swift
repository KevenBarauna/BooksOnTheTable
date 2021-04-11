import  Foundation

struct Usuario: Codable {
        
    let id: String?;
    let nome: String;
    let email: String;
    let senha: String;
    
}

class Login: NSObject {

    struct Users: Codable {
        var password_hash:String
        var email:String
        var user_id:String
    }
}

//extension Usuario{
//
//    enum CodingKeys: String, CodingKey{
//        case id = "id"
//        case nome = "full_name"
//        case email = "email"
//        case password_hash = "senha"
//    }
//
//}

import  Foundation

struct Usuario: Codable {
        
    let id: String?;
    let nome: String;
    let email: String;
    let senha: String;
    
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

import  Foundation

struct Usuario {
    
    let id: String?;
    let nome: String;
    let email: String;
    let senha: String;
    
}

extension Usuario{
    
    enum CodingKeys: String, CodingKey{
        case id
        case nome = "full_name"
        case email
        case password_hash = "senha"
    }
    
}

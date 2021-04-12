import  Foundation

struct Livro: Codable {
        
    let id: String?;
    let titulo: String;
    let autor: String;
    let genero: String;
    let status: String;
    
}

struct LivroApi: Codable{
    
    let author: String
    let id: String?
    let title: String
    let status: String
    let genre: String
}

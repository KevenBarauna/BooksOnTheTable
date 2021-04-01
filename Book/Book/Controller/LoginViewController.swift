import UIKit

class LoginViewController: UIViewController {

        // MARK - IBOutlet
        
        @IBOutlet weak var usuarioTxt: UITextField?
        @IBOutlet weak var senhaTxt: UITextField?
        @IBOutlet weak var viewHeader: UIView?
        @IBOutlet weak var viewBtnEntrar: UIView?
        @IBOutlet weak var viewScroll: UIScrollView?
    
        // MARK - VARIAVEIS
    var tecladoIsOpen: Bool = false;
    
        override func viewDidLoad() {
            super.viewDidLoad()
            addStyle();
            // SE TECLADO SUBIR
            NotificationCenter.default.addObserver(self, selector: #selector(subirTeclado), name: UIResponder.keyboardWillShowNotification, object: nil)
            // SE TECLADO DESCER
            NotificationCenter.default.addObserver(self, selector: #selector(descerTeclado), name: UIResponder.keyboardWillHideNotification, object: nil)
            
        }
    @objc func subirTeclado(){
        if(!tecladoIsOpen){
            self.viewScroll?.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 200);
            tecladoIsOpen = true;
        }
    }
    
    @objc func descerTeclado(){
        if(tecladoIsOpen){
            self.viewScroll?.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height - 200);
            tecladoIsOpen = false;
        }
    }
    func addStyle(){
        self.viewHeader?.layer.cornerRadius = 50
        self.viewBtnEntrar?.layer.cornerRadius = 25
        
        let imageViewUser = UIImageView();
        imageViewUser.image = UIImage(named: "usuario.png");
        
        self.usuarioTxt?.layer.cornerRadius = 20
        self.usuarioTxt?.layer.borderWidth = 1
        self.usuarioTxt?.layer.borderColor = UIColor.systemGray5.cgColor
        usuarioTxt?.leftView = imageViewUser ;
        usuarioTxt?.leftViewMode = UITextField.ViewMode.always
        
        let imageViewSenha = UIImageView();
        imageViewSenha.image = UIImage(named: "senha.png");
        
        self.senhaTxt?.isSecureTextEntry = true;
        self.senhaTxt?.layer.cornerRadius = 20
        self.senhaTxt?.layer.borderWidth = 1
        self.senhaTxt?.layer.borderColor = UIColor.systemGray5.cgColor
        senhaTxt?.leftView = imageViewSenha ;
        senhaTxt?.leftViewMode = UITextField.ViewMode.always
    }
    
    
    @IBAction func entrar() {
        print("Email: \(usuarioTxt?.text), Senha: \(senhaTxt?.text)")
    }
    
}

import UIKit

class LoginViewController: UIViewController {

    //MARK - IBOutlet
        
        @IBOutlet weak var usuarioTxt: UITextField?
        @IBOutlet weak var senhaTxt: UITextField?
        
        //MARK - IBOutlet only style
        
        @IBOutlet weak var viewHeader: UIView?
        @IBOutlet weak var viewBtnEntrar: UIView?
        
        override func viewDidLoad() {
            super.viewDidLoad()
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

}

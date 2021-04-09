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
    
    // MARK: - IBAction
    
    @IBAction func entrar() {
        //VALIDAÇÕES
        if(usuarioTxt?.text?.isEmpty == true) {
            AlertaUtil().showMensagem(titulo: "Erro", mensagem: "Informa o Email", view: self)
            return
        }
        else if(senhaTxt?.text?.isEmpty == true) {
            AlertaUtil().showMensagem(titulo: "Erro", mensagem: "Informa a senha", view: self)
            return
        }
        guard let usuarioEmail = usuarioTxt?.text else {return}
        guard let usuarioSenha = senhaTxt?.text else {return}
        //PRINT

        let sucesso = LoginService().login(email: usuarioEmail, senha: usuarioSenha);
        
        if(sucesso){
            let TelaHome = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
            self.navigationController?.pushViewController(TelaHome ?? self, animated: true)
            
        }
        
    }
    
    
    @IBAction func esqueceuSenha() {
        //TO DO
        print("IR PARA TELA DE ESQUECEU SENHA")
        AlertaUtil().showMensagem(titulo: "Ops" , mensagem: "FALTA FAZER", view: self)
    }
    
    @IBAction func registrar() {
        
        let TelaRegistrar = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegistroViewController") as? RegistroViewController
        self.navigationController?.pushViewController(TelaRegistrar ?? self, animated: true)
        
    }
    
    // MARK - FUNC
    
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
        
        Styles().addStyleTextField(campoTextField: usuarioTxt, nomeImagem: "usuario.png")
        Styles().addStyleTextField(campoTextField: senhaTxt, nomeImagem: "senha.png")
        Styles().addStyleHeader(view: viewHeader);
        Styles().addStyleButton(viewButton: viewBtnEntrar);

    }
}

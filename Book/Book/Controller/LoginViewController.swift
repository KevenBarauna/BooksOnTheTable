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
    
    // MARK: - FUNC PADRAO
    
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
        let valido = self.valicadao(usuario: usuarioTxt, senha: senhaTxt);
        if(valido){
            guard let usuarioEmail = usuarioTxt?.text else {return}
            guard let usuarioSenha = senhaTxt?.text else {return}

        UserService().login(usuarioEmail, usuarioSenha, view: self);
            
        }
    }
    
    
    @IBAction func esqueceuSenha() {
        //TO DO
        Alert().showMensagem(titulo: msgOps , mensagem: msgDesenvolvimento, view: self)
    }
    
    @IBAction func registrar() {
        
        let TelaRegistrar = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idRegistrar) as? RegistroViewController
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
        let style = Styles();
        style.addStyleTextField(campoTextField: usuarioTxt, nomeImagem: "usuario.png")
        style.addStyleTextField(campoTextField: senhaTxt, nomeImagem: "senha.png")
        style.addStyleHeader(view: viewHeader);
        style.addStyleButton(viewButton: viewBtnEntrar);
    }
    
    func valicadao(usuario: UITextField?, senha: UITextField?) -> Bool {
        if(usuario?.text?.isEmpty == true) {
            Alert().showMensagem(titulo: msgErro, mensagem: msgInformeEmail, view: self)
            return false
        }
        else if(senha?.text?.isEmpty == true) {
            Alert().showMensagem(titulo: msgErro, mensagem: msgInformeSenha, view: self)
            return false
        }
        return true;
    }
}

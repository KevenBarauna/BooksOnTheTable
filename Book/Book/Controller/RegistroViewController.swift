import UIKit

class RegistroViewController: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var viewHeader: UIView?
    @IBOutlet weak var nomeTxt: UITextField?
    @IBOutlet weak var emailTxt: UITextField?
    @IBOutlet weak var senhaTxt: UITextField?
    @IBOutlet weak var senhaConfirmeTxt: UITextField?
    @IBOutlet weak var btnRegistrar: UIButton?
    @IBOutlet weak var viewBtnRegistrar: UIView?
    @IBOutlet weak var viewScroll: UIScrollView?
    @IBOutlet weak var viewBtnVoltar: UIView?
    
    // MARK - VARIAVEIS
    var tecladoIsOpen: Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addStyle();
        
        // SE TECLADO SUBIR
        NotificationCenter.default.addObserver(self, selector: #selector(subirTeclado), name: UIResponder.keyboardWillShowNotification, object: nil)
        // SE TECLADO DESCER
        NotificationCenter.default.addObserver(self, selector: #selector(descerTeclado), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    //MARK: - ABAction

    @IBAction func registrar() {

        let valid = self.validation(nomeTxt, emailTxt, senhaTxt, senhaConfirmeTxt);
        
        if(valid){
            guard
                let name = nomeTxt?.text,
                let email = emailTxt?.text,
                let password = senhaTxt?.text
            else { return }
            
            let usuario = User(id: nil, name: name, email: email, password: password);
            
            UserService().register(usuario: usuario, view: self);

        }
    }
    
    
    @IBAction func voltar() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Func
        
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
        Styles().addStyleTextField(campoTextField: nomeTxt)
        Styles().addStyleTextField(campoTextField: emailTxt)
        Styles().addStyleTextField(campoTextField: senhaTxt)
        Styles().addStyleTextField(campoTextField: senhaConfirmeTxt)
        Styles().addStyleHeader(view: viewHeader);
        Styles().addStyleButton(viewButton: viewBtnRegistrar);
        Styles().addStyleButton(viewButton: viewBtnVoltar)
    }
    
    func validation(_ name: UITextField?, _ email: UITextField?, _ password: UITextField?, _ confPassword: UITextField?) -> Bool{
        let alert = Alert();
        
        if(name?.text?.isEmpty == true) {
            alert.showMensagem(titulo: msgErro, mensagem: msgInformeNome, view: self)
            return false
        }
        else if(email?.text?.isEmpty == true) {
            alert.showMensagem(titulo: msgErro, mensagem: msgInformeEmail, view: self)
            return false
        }
        else if(password?.text?.isEmpty == true) {
            alert.showMensagem(titulo: msgErro, mensagem: msgInformeSenha, view: self)
            return false
        }
        else if(confPassword?.text?.isEmpty == true) {
            alert.showMensagem(titulo: msgErro, mensagem: msgInformeConfSenha, view: self)
            return false
        }
        else if(password?.text != confPassword?.text) {
            alert.showMensagem(titulo: msgErro, mensagem: msgSenhasDif, view: self)
            return false
        }
        
        return true;
    }
}

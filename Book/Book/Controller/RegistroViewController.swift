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
        addStyle();
        
        // SE TECLADO SUBIR
        NotificationCenter.default.addObserver(self, selector: #selector(subirTeclado), name: UIResponder.keyboardWillShowNotification, object: nil)
        // SE TECLADO DESCER
        NotificationCenter.default.addObserver(self, selector: #selector(descerTeclado), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    //MARK: - ABAction

    @IBAction func registrar() {

        let valido = self.validacao(nome: nomeTxt, email: emailTxt, senha: senhaTxt, confSenha: senhaConfirmeTxt);
        
        if(valido){
            guard
                let nomeUsuario = nomeTxt?.text,
                let emailUsuario = emailTxt?.text,
                let senhaUsuario = senhaTxt?.text
            else { return }
            
            let usuario = Usuario(id: nil, nome: nomeUsuario, email: emailUsuario, senha: senhaUsuario);
            
            LoginService().registrar(usuario: usuario, view: self);

//            if(sucesso){
//                AlertaUtil().showMensagem(titulo: msgSucesso, mensagem: msgUsuarioCriadoSucesso, view: self);
//                let TelaHome = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idLogin) as? HomeViewController
//                self.navigationController?.pushViewController(TelaHome ?? self, animated: true)
//                self.dismiss(animated: true, completion: nil)
//
//            }
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
    
    func validacao(nome: UITextField?, email: UITextField?, senha: UITextField?, confSenha: UITextField?) -> Bool{
        if(nome?.text?.isEmpty == true) {
            AlertaUtil().showMensagem(titulo: msgErro, mensagem: msgInformeNome, view: self)
            return false
        }
        else if(email?.text?.isEmpty == true) {
            AlertaUtil().showMensagem(titulo: msgErro, mensagem: msgInformeEmail, view: self)
            return false
        }
        else if(senha?.text?.isEmpty == true) {
            AlertaUtil().showMensagem(titulo: msgErro, mensagem: msgInformeSenha, view: self)
            return false
        }
        else if(confSenha?.text?.isEmpty == true) {
            AlertaUtil().showMensagem(titulo: msgErro, mensagem: msgInformeConfSenha, view: self)
            return false
        }
        else if(senhaConfirmeTxt?.text != senhaTxt?.text) {
            AlertaUtil().showMensagem(titulo: msgErro, mensagem: msgSenhasDif, view: self)
            return false
        }
        return true;
    }
}

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
        //VALIDAÇÕES
        if(nomeTxt?.text?.isEmpty == true) {
            AlertaUtil().showMensagem(titulo: "Erro", mensagem: "Informe o nome", view: self)
            return
        }
        if(emailTxt?.text?.isEmpty == true) {
            AlertaUtil().showMensagem(titulo: "Erro", mensagem: "Informe o email", view: self)
            return
        }
        if(senhaTxt?.text?.isEmpty == true) {
            AlertaUtil().showMensagem(titulo: "Erro", mensagem: "Informe a senha", view: self)
            return
        }
        if(senhaConfirmeTxt?.text?.isEmpty == true) {
            AlertaUtil().showMensagem(titulo: "Erro", mensagem: "Informe a confirmação de senha", view: self)
            return
        }

        if(senhaConfirmeTxt?.text != senhaTxt?.text) {
            AlertaUtil().showMensagem(titulo: "Erro", mensagem: "As senhas estão diferentes", view: self)
            return
        }
        
        guard
            let nomeUsuario = nomeTxt?.text,
            let emailUsuario = emailTxt?.text,
            let senhaUsuario = senhaTxt?.text
        else { return }
        
        let usuario = Usuario(id: nil, nome: nomeUsuario, email: emailUsuario, senha: senhaUsuario);

        print("Nome: \(nomeUsuario),Email: \(emailUsuario), Senha: \(senhaUsuario)")
        
        LoginService().registrar(usuario: usuario)
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
}

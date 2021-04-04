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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addStyle();
    }
    
    //MARK: - ABAction

    @IBAction func registrar() {
        //TO DO
        print("Registrar")
    }
    
    //MARK: - Func
    
    func addStyle(){
        Styles().addStyleTextField(campoTextField: nomeTxt)
        Styles().addStyleTextField(campoTextField: emailTxt)
        Styles().addStyleTextField(campoTextField: senhaTxt)
        Styles().addStyleTextField(campoTextField: senhaConfirmeTxt)
        Styles().addStyleHeader(view: viewHeader);
        Styles().addStyleButton(viewButton: viewBtnRegistrar);
    }
}

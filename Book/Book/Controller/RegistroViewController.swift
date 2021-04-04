import UIKit

class RegistroViewController: UIViewController {
    
    
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

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registrar() {
    }
    
    func addStyle(){
        Styles().addStyleTextField(campoTextField: nomeTxt)
        Styles().addStyleTextField(campoTextField: emailTxt)
        Styles().addStyleTextField(campoTextField: senhaTxt)
        Styles().addStyleTextField(campoTextField: senhaConfirmeTxt)
        Styles().addStyleHeader(view: viewHeader);
        Styles().addStyleButton(viewButton: viewBtnRegistrar);
    }
}

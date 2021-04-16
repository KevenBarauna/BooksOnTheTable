import UIKit

class DetalheViewController: UIViewController {
    
    //MARK: - ABOutlet
    
    @IBOutlet weak var viewHeader: UIView?
    @IBOutlet weak var tituloLivroLbl: UILabel?
    @IBOutlet weak var autorLbl: UILabel?
    @IBOutlet weak var generoLbl: UILabel?
    @IBOutlet weak var statusLbl: UILabel?
    @IBOutlet weak var viewBtnMarcarLido: UIView?
    @IBOutlet weak var viewBtnFazerResumo: UIView?
    @IBOutlet weak var btnMarcarLido: UIButton?
    @IBOutlet weak var btnFazerResumo: UIButton?
    @IBOutlet weak var viewContainer: UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addStyle();

    }
    
    //MARK: - IBAction
    
    @IBAction func editar() {
        //TO DO
        Alert().showMensagem(titulo: "Editar" , mensagem: msgDesenvolvimento, view: self)
    }
    
    @IBAction func apagar() {
        //TO DO
        Alert().showMensagem(titulo: "Apagar" , mensagem: msgDesenvolvimento, view: self)
        
    }
    //MARK: - Func
    
    func addStyle(){
        Styles().addStyleHeader(view: viewHeader);
        Styles().addStyleButton(viewButton: viewBtnFazerResumo);
        Styles().addStyleButton(viewButton: viewBtnMarcarLido);
        
        viewContainer?.layer.cornerRadius = 20
        viewContainer?.layer.borderWidth = 1
        viewContainer?.layer.borderColor = UIColor.systemOrange.cgColor
        
    }
}

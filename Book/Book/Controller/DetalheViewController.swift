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
    @IBOutlet weak var viewBtnVoltar: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addStyle();
        configure();

    }
    
    //MARK: - IBAction
    
    @IBAction func editar() {
        //TO DO
        let TelaCadastrar = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idCadastrarLivro) as? CadastrarLivroViewController
        self.navigationController?.popViewController(animated: true)
        self.navigationController?.pushViewController(TelaCadastrar ?? self, animated: true)
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func apagar() {
        //TO DO
        Alert().showMensagem(titulo: "Apagar" , mensagem: msgDesenvolvimento, view: self)
        
    }
    
    @IBAction func voltar(_ sender: Any) {
        bookSelectData = nil;
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func fazerResumo() {
        //TO DO
        Alert().showMensagem(titulo: "Fazer resumo" , mensagem: msgDesenvolvimento, view: self)
    }
    
    @IBAction func marcarLido() {
        //TO DO
        Alert().showMensagem(titulo: "Marcar como lido" , mensagem: msgDesenvolvimento, view: self)
    }
    
    //MARK: - Func
    
    func configure(){
        guard let bookShow = bookSelectData else {return}
        
        self.tituloLivroLbl?.text = bookShow.title;
        self.autorLbl?.text = bookShow.author
        self.statusLbl?.text = bookShow.status
        
    }
    
    func addStyle(){
        Styles().addStyleHeader(view: viewHeader);
        Styles().addStyleButton(viewButton: viewBtnFazerResumo);
        Styles().addStyleButton(viewButton: viewBtnMarcarLido);
        Styles().addStyleButton(viewButton: viewBtnVoltar);
        
        viewContainer?.layer.cornerRadius = 20
        viewContainer?.layer.borderWidth = 1
        viewContainer?.layer.borderColor = UIColor.systemOrange.cgColor
        
    }
}

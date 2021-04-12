import UIKit

class HomeViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func AddnewBook() {
        let TelaCadastro = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idCadastrarLivro) as? CadastrarLivroViewController
        self.navigationController?.pushViewController(TelaCadastro ?? self, animated: true)
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

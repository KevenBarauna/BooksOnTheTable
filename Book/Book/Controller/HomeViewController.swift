import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource {
    
      
    @IBOutlet weak var collectionViewLendo: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        LivroService().getAll(page: "1", tamMax: "3", view: self)
        collectionViewLendo.dataSource = self;
        
    }
    
    @IBAction func AddnewBook() {
        let TelaCadastro = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idCadastrarLivro) as? CadastrarLivroViewController
        self.navigationController?.pushViewController(TelaCadastro ?? self, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    //MAR: - CollectioView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celulaLivro = collectionView.dequeueReusableCell(withReuseIdentifier: "CelulaLivroLendo", for: indexPath) as! LivrosCollectionViewCell
        
        celulaLivro.configure(title:celulaLivro.testeLivro[indexPath.row])

        return celulaLivro;
    }
    


}

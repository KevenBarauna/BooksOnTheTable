import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource {
    
      
    @IBOutlet weak var collectionViewLendo: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        LivroService().getAll(page: "1", tamMax: "3", view: self)
        collectionViewLendo.dataSource = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("WillApar");
        let dispatch = DispatchQueue.init(label: "Will")
        dispatch.async {
            LivroService().getAll(page: "1", tamMax: "3", view: self)
        }
        collectionViewLendo.dataSource = self;
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        print("init")
        LivroService().getAll(page: "1", tamMax: "3", view: self)
        
    }
    
    @IBAction func AddnewBook() {
        print(livrosData)
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
        
        print(" Livros global: \(livrosData)")
        if (livrosData != nil && livrosData!.count > 0){
            celulaLivro.configure(title: livrosData?[indexPath.row].titulo ?? " ")
        }else{
            celulaLivro.configure(title: "")
        }

        return celulaLivro;
    }
    


}

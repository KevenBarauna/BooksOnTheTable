import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource {
    
      
    @IBOutlet weak var collectionViewLendo: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        BookService().getAll(view: self)
        collectionViewLendo.dataSource = self;
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionViewLendo.reloadData()
        BookService().getAll(view: self)
    }
    
    
    @IBAction func AddnewBook() {
        let TelaCadastro = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idCadastrarLivro) as? CadastrarLivroViewController
        self.navigationController?.pushViewController(TelaCadastro ?? self, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    //MAR: - CollectioView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = booksData?.count
        if(count != nil && count! >= 3 ){
            return 3
        }
        return count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celulaLivro = collectionView.dequeueReusableCell(withReuseIdentifier: "CelulaLivroLendo", for: indexPath) as! LivrosCollectionViewCell
                
        if (booksData != nil && booksData!.count > 0){
           
            var text = "x"
            if let title = booksData?[indexPath.row].title {
                text = title
            }
            else if let author = booksData?[indexPath.row].author{
                text = author
            }
            
            celulaLivro.configure(title: text)
        }else{
            celulaLivro.configure(title: "")
        }

        return celulaLivro;
    }
    


}

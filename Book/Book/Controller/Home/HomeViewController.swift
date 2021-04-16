import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
      
    @IBOutlet weak var collectionViewLendo: UICollectionView!
    @IBOutlet weak var viewAddBook: UIView!
    @IBOutlet weak var barraPesquisa: UISearchBar!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.styles();
        BookService().getAll(view: self)
        collectionViewLendo.dataSource = self;
        collectionViewLendo.delegate = self;
        barraPesquisa.delegate = self;
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
           
            var text = ""
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        bookSelectData = booksData?[indexPath.row];
        
        let TelaDetalhe = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idDetalhe) as? DetalheViewController
        self.navigationController?.pushViewController(TelaDetalhe ?? self, animated: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        debugPrint(searchText);
        
    }
    
    func styles(){
        viewAddBook.layer.cornerRadius = viewAddBook.frame.size.width/2
        viewAddBook.clipsToBounds = true
        
        viewAddBook?.layer.borderWidth = 7
        viewAddBook?.layer.borderColor = UIColor.systemGray5.cgColor
        
    }


}

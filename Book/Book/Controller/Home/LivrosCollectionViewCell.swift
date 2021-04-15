import UIKit

class LivrosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitulo: UILabel!
        
    func configure(title: String){
        self.lblTitulo.text = title;
        self.lblTitulo.textColor = UIColor.black
        self.layer.cornerRadius = 15
        
    }
    
}

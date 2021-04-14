//
//  LivrosCollectionViewCell.swift
//  Book
//
//  Created by administrator on 4/13/21.
//

import UIKit

class LivrosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitulo: UILabel!
    
    let testeLivro = ["Livro 1","Livro legal", "Last livro"]
    
    func configure(title: String){
        self.lblTitulo.text = title;
        self.lblTitulo.textColor = UIColor.black
        //self.backgroundColor =  UIColor.red
        self.layer.cornerRadius = 15
        
    }
    
}

//
//  ViewController.swift
//  Book
//
//  Created by administrator on 3/30/21.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK - IBOutlet
    
    @IBOutlet weak var usuarioTxt: UITextField?
    @IBOutlet weak var senhaTxt: UITextField?
    
    //MARK - IBOutlet only style
    
    @IBOutlet weak var viewHeader: UIView?
    @IBOutlet weak var viewBtnEntrar: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewHeader?.layer.cornerRadius = 50
        self.viewBtnEntrar?.layer.cornerRadius = 25
        
        let imageView = UIImageView();
        imageView.image = UIImage(named: "usuario.png");
        
        self.usuarioTxt?.layer.cornerRadius = 20
        self.usuarioTxt?.layer.borderWidth = 1
        self.usuarioTxt?.layer.borderColor = UIColor.systemGray5.cgColor
        usuarioTxt?.leftView = imageView ;
        usuarioTxt?.leftViewMode = UITextField.ViewMode.always
        
        let imageVieww = UIImageView();
        imageVieww.image = UIImage(named: "senha.png");
        
        self.senhaTxt?.isSecureTextEntry = true;
        self.senhaTxt?.layer.cornerRadius = 20
        self.senhaTxt?.layer.borderWidth = 1
        self.senhaTxt?.layer.borderColor = UIColor.systemGray5.cgColor
        senhaTxt?.leftView = imageVieww ;
        senhaTxt?.leftViewMode = UITextField.ViewMode.always
    }


}


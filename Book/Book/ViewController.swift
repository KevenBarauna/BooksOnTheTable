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
    
    //MARK - IBOutlet style
    
    @IBOutlet weak var viewHeader: UIView?
    @IBOutlet weak var viewBtnEntrar: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewHeader?.layer.cornerRadius = 50
        self.viewBtnEntrar?.layer.cornerRadius = 25
    }


}


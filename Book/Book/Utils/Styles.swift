import UIKit

class Styles{
    
    func addStyleHeader(view: UIView?){
        view?.layer.cornerRadius = 50
    }
    
    func addStyleButton(viewButton: UIView?){
        viewButton?.layer.cornerRadius = 25
    }
    
    func addStyleTextField(campoTextField: UITextField?, nomeImagem: String = ""){
        
        campoTextField?.layer.cornerRadius = 20
        campoTextField?.layer.borderWidth = 1
        campoTextField?.layer.borderColor = UIColor.systemGray5.cgColor
        
        if(nomeImagem != ""){
            let image = UIImageView();
            image.image = UIImage(named: nomeImagem);
            campoTextField?.leftView = image;
            campoTextField?.leftViewMode = UITextField.ViewMode.always
            
        }


    }
}
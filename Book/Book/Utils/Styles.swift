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
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: campoTextField?.frame.height ?? CGFloat(10.1)))
        campoTextField?.leftView = paddingView;
        campoTextField?.leftViewMode = UITextField.ViewMode.always
        
        if(nomeImagem != ""){
            let image = UIImageView();
            image.image = UIImage(named: nomeImagem);
            campoTextField?.leftView = image;
            campoTextField?.leftViewMode = UITextField.ViewMode.always
            
        }


    }
}

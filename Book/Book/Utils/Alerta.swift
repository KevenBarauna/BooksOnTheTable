// -- CLASS RESPONSAVEL PELO ALERT --\\

import UIKit

class AlertaUtil{
    
    
    func showMensagem(titulo: String, mensagem: String, view: UIViewController, funcCompletion: (() -> Void)? = nil) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert);
        let btnPadrao = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(btnPadrao)
        view.present(alerta, animated: true, completion: funcCompletion)
    }

}

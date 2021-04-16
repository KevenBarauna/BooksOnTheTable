// -- CLASS RESPONSAVEL PELO ALERT --\\

import UIKit

class Alert{

    func showMensagem(titulo: String, mensagem: String, view: UIViewController, funcCompletion: (() -> Void)? = nil) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert);
        let btnPadrao = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(btnPadrao)
        view.present(alerta, animated: true, completion: funcCompletion)
    }
    
    func showMensagemActionButton(titulo: String, mensagem: String, view: UIViewController, funcCompletion:@escaping ((UIAlertAction) -> Void)) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert);
        let btnPadrao = UIAlertAction(title: "Ok", style: .default, handler: funcCompletion)
        alerta.addAction(btnPadrao)
        view.present(alerta, animated: true, completion: nil)
    }
    
    func showDebug(_ message: String){
        debugPrint("##########")
        debugPrint(message)
        debugPrint("##########")
    }
}

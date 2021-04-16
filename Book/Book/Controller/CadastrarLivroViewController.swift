import UIKit

class CadastrarLivroViewController: UIViewController {

    @IBOutlet weak var viewHeader: UIView?
    @IBOutlet weak var viewSalvar: UIView?
    @IBOutlet weak var viewScroll: UIScrollView?
    @IBOutlet weak var tituloTxt: UITextField?
    @IBOutlet weak var autorTxt: UITextField?
    @IBOutlet weak var txtGenero: UITextField?
    @IBOutlet weak var txtStatus: UITextField?
    @IBOutlet weak var viewBtnVoltar: UIView?
    
    // MARK - VARIAVEIS
    var tecladoIsOpen: Bool = false;
    var isEdit: Bool = false;
    var idbook: String = "";

    override func viewDidLoad() {
        super.viewDidLoad()
        self.style();
        self.addOrEdit();
        
        // SE TECLADO SUBIR
        NotificationCenter.default.addObserver(self, selector: #selector(subirTeclado), name: UIResponder.keyboardWillShowNotification, object: nil)
        // SE TECLADO DESCER
        NotificationCenter.default.addObserver(self, selector: #selector(descerTeclado), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    //MARK: - IBAction

    @IBAction func salvar() {
        let valid = self.validation(tituloTxt, autorTxt, txtGenero, txtStatus);
        if(valid){
            guard
                let title = tituloTxt?.text,
                let author = autorTxt?.text,
                let genero = txtGenero?.text,
                let status = txtStatus?.text
            else { return }

            let livro = BookModel(author: author, id: idbook, title: title, status: status, genre: genero)
            
            bookSelectData = nil;
            
            if(isEdit){
                BookService().edit(livro, view: self)
            }else{
                BookService().register(livro, view: self)
                
            }
           
        }
    }
    
    
    @IBAction func voltar() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Func
    
    @objc func subirTeclado(){
        if(!tecladoIsOpen){
            self.viewScroll?.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 200);
            tecladoIsOpen = true;
        }
    }

    @objc func descerTeclado(){
        if(tecladoIsOpen){
            self.viewScroll?.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height - 200);
            tecladoIsOpen = false;
        }
    }
    
    func addOrEdit(){
        if(bookSelectData != nil){
            //CARREGA CAMPOS
            idbook = bookSelectData?.id ?? ""
            tituloTxt?.text = bookSelectData?.title
            autorTxt?.text = bookSelectData?.author
            txtGenero?.text = bookSelectData?.genre
            txtStatus?.text = bookSelectData?.status
            isEdit = true
        }else{
            isEdit = false
        }
    }
    
    func style(){
        let style = Styles();
        style.addStyleTextField(campoTextField: tituloTxt)
        style.addStyleTextField(campoTextField: autorTxt)
        style.addStyleTextField(campoTextField: txtGenero)
        style.addStyleTextField(campoTextField: txtStatus)
        style.addStyleHeader(view: viewHeader);
        style.addStyleButton(viewButton: viewSalvar);
        style.addStyleButton(viewButton: viewBtnVoltar);
    }
    
    
    func validation(_ title: UITextField?, _ author: UITextField?, _ genero: UITextField?, _ status: UITextField?) -> Bool {
        var mensagem: String = "";
        
        if(title?.text?.isEmpty == true) {
           mensagem = msgInformeTitulo
        }
        else if(author?.text?.isEmpty == true) {
            mensagem = msgInformeAutor
        }
        else if(genero?.text?.isEmpty == true) {
            mensagem = msgInformeGenero
        }
        else if(status?.text?.isEmpty == true) {
            mensagem = msgInformeStatus
        }
        
        if(mensagem != ""){
            Alert().showMensagem(titulo: msgErro, mensagem: mensagem, view: self)
            return false
        }
      
        return true;
    }

}

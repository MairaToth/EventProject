import UIKit

class ViewController: UIViewController {
    
    var viewTable = InitialEventView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTable.delegate = self
        
        view = viewTable
    }
}

extension ViewController: InitialEventViewDelegate {
    func clickAction() {
        let detailsViewController = DetailsViewController()
        detailsViewController.modalPresentationStyle = .fullScreen
        present(detailsViewController, animated: true, completion: nil)
    }
}

import UIKit

class ViewController: UIViewController {
    
    var viewTable = InitialEventView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewTable.delegate = self
        fetchData()
        
        view = viewTable
    }
        private func fetchData() {
            
            WebService.getEvents() { event in
                
                if let eventList = event {
                    let eventViewModel = EventListViewModel(eventLists: eventList)
                    
                    DispatchQueue.main.async {
                        self.viewTable.configure(viewModel: eventViewModel)
                    }
                }
            }
        }
    }
    
extension ViewController: InitialEventViewDelegate {
    func clickAction(viewModel: EventViewModel) {
        let detailsViewController = SecondaryDetailsViewController(eventVM: viewModel)
        detailsViewController.modalPresentationStyle = .fullScreen
        present(detailsViewController, animated: true, completion: nil)
    }
}

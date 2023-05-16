import UIKit

class SecondaryDetailsViewController: UIViewController {
    var viewDetails = SecondaryDetailsView()
    var eventVM: EventViewModel
    
    
    init(eventVM: EventViewModel) {
        self.eventVM = eventVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDetails.delegate = self
        viewDetails.configure(viewModel: eventVM)
        view = viewDetails
    }
}

extension SecondaryDetailsViewController: SecondaryDetailsViewDelegate {
    func didTap() {
        print("dogs")
    }
    
    func clickAction() {
        print("cats")
    }
}

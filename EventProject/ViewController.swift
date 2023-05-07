import UIKit

class ViewController: UIViewController {
    
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(EventImageInitialCell.self, forCellReuseIdentifier: EventImageInitialCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        configConstraints()
        view.backgroundColor = .white
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint (equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint (equalTo: view.bottomAnchor),
            
        ])
    }
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: EventImageInitialCell.identifier, for: indexPath) as? EventImageInitialCell else {
            return UITableViewCell()
        }
            cell.delegate = self
            cell.selectionStyle = .none
            return cell
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning ()
    }
}
    extension ViewController: EventImageInitialCellDelegate {
        func clickAction ()
        {
            let detailsViewControlle = DetailsViewController ()
            present (detailsViewControlle, animated: true, completion: nil)
        }
    }

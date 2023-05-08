import Foundation
import UIKit

protocol InitialEventViewDelegate: AnyObject {
    func clickAction()
}

class InitialEventView: UIView {
    
    weak var delegate: InitialEventViewDelegate?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.register(EventInitialCell.self, forCellReuseIdentifier: EventInitialCell.identifier)
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    init() {
        super.init (frame: .zero)
        backgroundColor = .white
        configConstraints()
    }
    
    private func configConstraints() {
        addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint (equalTo: bottomAnchor),
        ])
    }
}

extension InitialEventView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventInitialCell.identifier, for: indexPath) as? EventInitialCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
   
}

extension InitialEventView: EventInitialCellDelegate {
    func clickAction() {
        delegate?.clickAction()
    }
}

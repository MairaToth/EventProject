import UIKit
protocol DetailsViewDelegate: AnyObject {
    func didTap()
    func clickAction()
}

class DetailsView: UIView {
    
    weak var delegate: DetailsViewDelegate?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.register(ScreenEventDetailsCell.self, forCellReuseIdentifier: ScreenEventDetailsCell.identifier)
        tableView.separatorStyle = .singleLine
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

extension DetailsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScreenEventDetailsCell.identifier, for: indexPath) as? ScreenEventDetailsCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.delegate = self
        return cell
    }
}

extension DetailsView: ScreenEventDetailsCellDelegate {
        func didTap() {
            delegate?.didTap()
        }
        
        func clickAction() {
            delegate?.clickAction()
    }
}

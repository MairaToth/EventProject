import UIKit
protocol SecondaryDetailsViewDelegate: AnyObject {
    func didTap()
    func clickAction()
}

class SecondaryDetailsView: UIView {
    
    weak var delegate: SecondaryDetailsViewDelegate?
    private var eventVM: EventViewModel?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.dataSource = self
        tableView.register(SecondaryEventDetailsCell.self, forCellReuseIdentifier: SecondaryEventDetailsCell.identifier)
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    init() {
        super.init (frame: .zero)
        configConstraints()
    }
    
    
    
    private func configConstraints() {
        backgroundColor = .white

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

extension SecondaryDetailsView {
    func configure(viewModel: EventViewModel?) {
        eventVM = viewModel
        tableView.reloadData()
    }
}

extension SecondaryDetailsView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SecondaryEventDetailsCell.identifier, for: indexPath) as? SecondaryEventDetailsCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.configure(viewModel: eventVM)
        cell.delegate = self
        return cell
    }
}

extension SecondaryDetailsView: SecondaryEventDetailsCellDelegate {
        func didTap() {
            delegate?.didTap()
        }
        
        func clickAction() {
            delegate?.clickAction()
    }
}

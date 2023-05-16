import Foundation
import UIKit

protocol InitialEventViewDelegate: AnyObject {
    func clickAction(viewModel: EventViewModel)
}

class InitialEventView: UIView {
    
    weak var delegate: InitialEventViewDelegate?
    private var eventListVM: EventListViewModel?

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

extension InitialEventView {
    func configure(viewModel: EventListViewModel?) {
        eventListVM = viewModel
        tableView.reloadData()
    }
}

extension InitialEventView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return eventListVM?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventListVM?.numberOfRowInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EventInitialCell.identifier, for: indexPath) as? EventInitialCell else {
            return UITableViewCell()
        }
        
        let eventVM = eventListVM?.eventAtIndex(indexPath.row)
        cell.configure(viewModel: eventVM)
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
   
}

extension InitialEventView: EventInitialCellDelegate {
    func clickAction(viewModel: EventViewModel) {
        delegate?.clickAction(viewModel: viewModel)
    }
}

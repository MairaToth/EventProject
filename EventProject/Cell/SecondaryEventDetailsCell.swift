import Foundation
import UIKit

protocol SecondaryEventDetailsCellDelegate: AnyObject {
    func didTap()
    func clickAction()
}

class SecondaryEventDetailsCell: UITableViewCell {
    
    weak var delegate: SecondaryEventDetailsCellDelegate?
    static let identifier: String = "ScreenEventDetailsCell"
    
    private lazy var eventImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            eventTitleLabel,
            dataLabel
        ])
        stackView.spacing = 6
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    private lazy var eventTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            sharedButton,
            checkInButton
        ])
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.backgroundColor = .clear
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        return stackView
    }()
    
    lazy var sharedButton: UIButton = {
        let button = UIButton ( )
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitle("Compartilhar", for: .normal)
        button.layer.cornerRadius = 8
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget (self, action: #selector (clickAction), for: .touchUpInside)
        return button
    }()
    
    lazy var checkInButton: UIButton = {
        let button = UIButton ( )
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .systemPink
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 8
        button.setTitle("Check-in", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget (self, action: #selector (didTap), for: .touchUpInside)
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    @objc private func clickAction() {
        delegate?.clickAction()
    }
    
    @objc private func didTap() {
        delegate?.didTap()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setConstraints()
    }
    
    func configure(viewModel: EventViewModel?) {
        guard let viewModel = viewModel else { return }
        eventTitleLabel.text = viewModel.title
        dataLabel.text = viewModel.date
        descriptionLabel.text = viewModel.description
        eventImage.downloaded(from: viewModel.image, contentMode: .scaleAspectFill)
        
    }
    
    private func setConstraints() {
        contentView.addSubview(eventImage)
        contentView.addSubview(labelStackView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(buttonStackView)
        
        eventImage.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            eventImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            eventImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            eventImage.widthAnchor.constraint(equalToConstant: 350),
            eventImage.heightAnchor.constraint(equalToConstant: 250),
            
            labelStackView.topAnchor.constraint(equalTo: eventImage.bottomAnchor, constant: 20),
            labelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            labelStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),

            descriptionLabel.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 14),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            buttonStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
            buttonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            buttonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            buttonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            
            sharedButton.widthAnchor.constraint(equalToConstant: 335),
            sharedButton.heightAnchor.constraint(equalToConstant: 40),
            
            checkInButton.widthAnchor.constraint(equalToConstant: 335),
            checkInButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}

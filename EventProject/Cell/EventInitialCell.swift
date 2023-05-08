import Foundation
import UIKit

protocol EventInitialCellDelegate: AnyObject {
    func clickAction()
}

class EventInitialCell: UITableViewCell {
    
    weak var delegate: EventInitialCellDelegate?
    static let identifier: String = "ModeImageCell"
    
    private lazy var initialImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dogs")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4.0
        return imageView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            eventLabel,
            dateLabel,
            detailsButton
        ])
        stackView.spacing = 4
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.backgroundColor = .clear
        stackView.layoutMargins = UIEdgeInsets(top: 24, left: 20, bottom: 24, right: 20)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    lazy var eventLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont (ofSize: 18)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Feira de adoção de animais na Redenção"
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "12/05/2023"
        return label
    }()
    
    lazy var detailsButton: UIButton = {
        let button = UIButton ( )
        button.titleLabel?.textAlignment = .left
        button.backgroundColor = .clear
        button.addTarget (self, action: #selector (clickAction), for: .touchUpInside)
        return button
    }()
    
    private func setConditionsButtonTitle() {
        detailsButton.backgroundColor = .clear
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray3,
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributedText = NSAttributedString (string: "Mais detalhes", attributes: attributes)
        detailsButton.setAttributedTitle(attributedText,for: .normal)
    }
    
    @objc private func clickAction() {
        delegate?.clickAction ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder: implement" )
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init (style: style, reuseIdentifier: reuseIdentifier)
        setConditionsButtonTitle()
        setConstrainst()
    }
    
        func setConstrainst() {
            contentView.addSubview(initialImage)
            contentView.addSubview(mainStackView)
            
            initialImage.translatesAutoresizingMaskIntoConstraints = false
            mainStackView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                initialImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
                initialImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                initialImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
                initialImage.widthAnchor.constraint(equalToConstant: 170),
                initialImage.heightAnchor.constraint(equalToConstant: 140),
                
                mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                mainStackView.leadingAnchor.constraint(equalTo: initialImage.trailingAnchor, constant: 4),
                mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
                mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32),
            ])
        }
    }

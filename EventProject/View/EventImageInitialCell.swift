import Foundation
import UIKit

protocol EventImageInitialCellDelegate: AnyObject {
    func clickAction()
}

class EventImageInitialCell: UITableViewCell {
    
    weak var delegate: EventImageInitialCellDelegate?
    static let identifier: String = "ModeImageCell"
    
    private lazy var initialImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dark 2")
        imageView.tintColor = (UIColor(red: 0.139, green: 0.501, blue: 0.226, alpha: 1))
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var eventLabel: UILabel = {
        let label = UILabel()
        label.text = "High School Music"
        label.font = UIFont.boldSystemFont (ofSize: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var detailsButton: UIButton = {
        let button = UIButton ( )
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .clear
        button.addTarget (self, action: #selector (clickAction), for: .touchUpInside)
        return button
    }()
    
    private func setConditionsButtonTitle() {
        detailsButton.backgroundColor = .clear
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray,
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
        
        func setConstrainst() {
            contentView.addSubview(initialImage)
            contentView.addSubview(eventLabel)
            contentView.addSubview(detailsButton)
            
            initialImage.translatesAutoresizingMaskIntoConstraints = false
            eventLabel.translatesAutoresizingMaskIntoConstraints = false
            detailsButton.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                initialImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
                initialImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                initialImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
                initialImage.widthAnchor.constraint(equalToConstant: 150),
                initialImage.heightAnchor.constraint(equalToConstant: 150),
                
                eventLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
                eventLabel.leadingAnchor.constraint(equalTo: initialImage.leadingAnchor, constant: 16),
                eventLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
                
                detailsButton.topAnchor.constraint(equalTo: eventLabel.topAnchor, constant: 16),
                detailsButton.leadingAnchor.constraint(equalTo: initialImage.leadingAnchor, constant: 8),
                detailsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
                detailsButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32)
                
            ])
        }
    }
}

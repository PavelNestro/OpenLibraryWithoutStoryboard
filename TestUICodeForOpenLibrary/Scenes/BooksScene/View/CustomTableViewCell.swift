//
//  CustomTableViewCell.swift
//  TestUICodeForOpenLibrary
//
//  Created by Pavel Nesterenko on 15.05.23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    static let identifier = "CustomTableView"
    let headerLabel = UILabel()
    let publishDateLabel = UILabel()
    let imageViewCell = UIImageView()
    let view = UIView()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func configure(with text: String) {
        headerLabel.text = text
        // Определение оптимального ширины для nameLabel на основе текста
        let textWidth = text.width(withConstrainedHeight: headerLabel.frame.height, font: headerLabel.font)
        
        // Ограничение максимальной ширины для nameLabel
        let maxWidth = bounds.width - 100 // Учтите отступы слева и справа
        let finalWidth = min(textWidth, maxWidth)
        
        // Установка ширины для nameLabel
        headerLabel.widthAnchor.constraint(equalToConstant: finalWidth).isActive = true
    }
    
    private func setupUI() {

        headerLabel.font = UIFont.boldSystemFont(ofSize: 16)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.numberOfLines = 0

        publishDateLabel.font = UIFont.systemFont(ofSize: 14)
        publishDateLabel.numberOfLines = 0
        publishDateLabel.translatesAutoresizingMaskIntoConstraints = false

        imageViewCell.contentMode = .scaleAspectFit
        imageViewCell.layer.cornerRadius = 12
        imageViewCell.clipsToBounds = true
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false

        contentView.backgroundColor = .black

        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(view)
        view.addSubview(publishDateLabel)
        view.addSubview(headerLabel)
        view.addSubview(imageViewCell)

        NSLayoutConstraint.activate([
            imageViewCell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            imageViewCell.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            imageViewCell.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            imageViewCell.widthAnchor.constraint(equalToConstant: 120),
            imageViewCell.heightAnchor.constraint(equalToConstant: 166),

            headerLabel.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: 10),
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            
            publishDateLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            publishDateLabel.leadingAnchor.constraint(equalTo: imageViewCell.trailingAnchor, constant: 10),
            
            view.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)

        ])

    }

}

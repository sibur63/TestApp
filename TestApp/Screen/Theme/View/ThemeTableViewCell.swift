//
//  ThemeTableViewCell.swift
//  TestApp
//
//  Created by Сергей Аршинов on 02.07.2024.
//

import UIKit

class ThemeTableViewCell: UITableViewCell {

    private var themeTitle: UILabel!
    private var checkmarkImageView: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewData: ThemeViewData) {
        themeTitle.text = viewData.title
    }
    
    private func setupUI() {
        themeTitle = UILabel()
        contentView.addSubview(themeTitle)
        
        checkmarkImageView = UIImageView(image: .checkmarkIcon)
        contentView.addSubview(checkmarkImageView)
        checkmarkImageView.contentMode = .scaleAspectFit
    }
    
    private func setupConstraints() {
        themeTitle.translatesAutoresizingMaskIntoConstraints = false
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            themeTitle.heightAnchor.constraint(equalToConstant: 24),
            themeTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            themeTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            themeTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 24),
            checkmarkImageView.leadingAnchor.constraint(equalTo: themeTitle.trailingAnchor, constant: 8),
            checkmarkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            checkmarkImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            checkmarkImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        checkmarkImageView.isHidden = !isSelected
    }
}

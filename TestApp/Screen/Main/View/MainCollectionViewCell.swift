//
//  MainCollectionViewCell.swift
//  TestApp
//
//  Created by Сергей Аршинов on 07.03.2024.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    var numberLabel: UILabel!
    
    override var isHighlighted: Bool {
        didSet {
            let scale = isHighlighted ? 0.8 : 1
            
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                guard let self = self else {
                    return
                }
                transform = CGAffineTransform(scaleX: scale, y: scale)
            })
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupColors()
        setupConstraints()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        ThemeManager.shared.weakAttach(self)
    }
    
    private func setupUI() {
        layer.borderWidth = 2
        layer.cornerRadius = 10
        
        numberLabel = UILabel()
        contentView.addSubview(numberLabel)
        numberLabel.textAlignment = .center
    }
    
    private func setupConstraints() {
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            numberLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            numberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            numberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setupColors() {
        backgroundColor = .cellColor
        layer.borderColor = UIColor.cellBorderColor.cgColor
        numberLabel.textColor = .cellTextColor
    }
}

extension MainCollectionViewCell: ThemeObserverProtocol {
    
    func themedidChange() {
        setupColors()
    }
}

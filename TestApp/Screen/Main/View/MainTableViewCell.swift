//
//  MainTableViewCell.swift
//  TestApp
//
//  Created by Сергей Аршинов on 06.03.2024.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    var collectionView: UICollectionView!
    private var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    private var viewData = [Int]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData(viewData: [Int]) {
        self.viewData = viewData
        collectionView.reloadData()
    }
    
    func updateData(value: Int, index: Int) {
        guard index < viewData.count else {
            return
        }
        viewData[index] = value
        
        guard let cell = collectionView.cellForItem(at: IndexPath(row: index, section: 0)) as? MainCollectionViewCell else {
            return
        }
        cell.numberLabel.text = String(value)
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = .init(width: 60, height: 60)
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        contentView.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
    
    private func setupConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension MainTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        cell.numberLabel.text = String(viewData[indexPath.row])
        return cell
    }
}

//
//  MainViewController.swift
//  TestApp
//
//  Created by Сергей Аршинов on 06.03.2024.
//

import UIKit

@MainActor
protocol MainViewProtocol: AnyObject {
    
    func setData(viewData: [[Int]])
    func updateData(value: Int, tableIndex: Int, collectionIndex: Int)
}

class MainViewController: UIViewController {

    var presenter: MainPresenterProtocol!
    
    private var themeSettingsButton: UIButton!
    private var tableView: UITableView!
    private var collectionViewContentOffset = [Int: CGPoint]()
    private var viewData = [[Int]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupColors()
        setupConstraints()
        setup()
    }

    private func setup() {
        ThemeManager.shared.weakAttach(self)
        presenter.view = self
        presenter.showData()
    }
    
    private func setupUI() {
        themeSettingsButton = UIButton()
        view.addSubview(themeSettingsButton)
        themeSettingsButton.setTitle("Изменить тему", for: .normal)
        themeSettingsButton.setImage(.paletteIcon, for: .normal)
        themeSettingsButton.addTarget(self, action: #selector(actionSettings), for: .touchUpInside)
        
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 70
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
    }
    
    private func setupConstraints() {
        themeSettingsButton.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            themeSettingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            themeSettingsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: themeSettingsButton.bottomAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupColors() {
        view.backgroundColor = .backgroundColor
        themeSettingsButton.setTitleColor(.mainTextColor, for: .normal)
        themeSettingsButton.tintColor = .mainTextColor
    }
    
    @objc
    private func actionSettings() {
        presenter.showThemeSettings()
    }
}

extension MainViewController: MainViewProtocol {
    
    func setData(viewData: [[Int]]) {
        self.viewData = viewData
        tableView.reloadData()
    }
    
    func updateData(value: Int, tableIndex: Int, collectionIndex: Int) {
        guard tableIndex < viewData.count,
              collectionIndex < viewData[tableIndex].count else {
            return
        }
        viewData[tableIndex][collectionIndex] = value
        
        guard let cell = tableView.cellForRow(at: IndexPath(row: tableIndex, section: 0)) as? MainTableViewCell else {
            return
        }
        cell.updateData(value: value, index: collectionIndex)
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
        cell.setData(viewData: viewData[indexPath.row])
        cell.collectionView.setContentOffset(collectionViewContentOffset[indexPath.row] ?? .zero, animated: false)
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! MainTableViewCell
        collectionViewContentOffset[indexPath.row] = cell.collectionView.contentOffset
    }
}

extension MainViewController: ThemeObserverProtocol {
    
    func themedidChange() {
        setupColors()
    }
}

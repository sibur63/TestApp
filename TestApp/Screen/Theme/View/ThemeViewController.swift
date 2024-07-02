//
//  ThemeViewController.swift
//  TestApp
//
//  Created by Сергей Аршинов on 02.07.2024.
//

import UIKit

protocol ThemeViewProtocol: AnyObject {
    
    func setThemes(viewData: [ThemeViewData])
}

class ThemeViewController: UIViewController {

    var presenter: ThemePresenterProtocol!
    var themesViewData = [ThemeViewData]()
    
    private var navigationBar: UINavigationBar!
    private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setup()
    }
    
    private func setup() {
        presenter.showThemes()
    }
    
    private func setupUI() {
        sheetPresentationController?.detents = [.medium(), .large()]
        view.backgroundColor = .white
        
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ThemeTableViewCell.self, forCellReuseIdentifier: "ThemeTableViewCell")
        
        let closeScreenButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        closeScreenButton.setImage(.closeIcon, for: .normal)
        closeScreenButton.tintColor = .black
        closeScreenButton.addTarget(self, action: #selector(didTapCloseScreen), for: .touchUpInside)
        
        let navigationItem = UINavigationItem(title: "Темы")
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeScreenButton)
        
        navigationBar = UINavigationBar()
        view.addSubview(navigationBar)
        navigationBar.items = [navigationItem]
        navigationBar.isHidden = navigationController != nil
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        navigationBarAppearance.backgroundColor = .white
        navigationBar.standardAppearance = navigationBarAppearance
        navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationBar.compactAppearance = navigationBarAppearance
    }
    
    private func setupConstraints() {
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor)
        ])
    }
    
    @objc
    private func didTapCloseScreen() {
        presenter.closeScreen()
    }
}

extension ThemeViewController: ThemeViewProtocol {
    
    func setThemes(viewData: [ThemeViewData]) {
        themesViewData = viewData
        tableView.reloadData()
    }
}

extension ThemeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return themesViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let theme = themesViewData[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThemeTableViewCell", for: indexPath) as! ThemeTableViewCell
        cell.configure(viewData: theme)
        
        if theme.isSelected {
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
        
        return cell
    }
}

extension ThemeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.setTheme(index: indexPath.row)
    }
}

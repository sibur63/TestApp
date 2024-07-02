//
//  MainPresenter.swift
//  TestApp
//
//  Created by Сергей Аршинов on 06.03.2024.
//

import Foundation

protocol MainPresenterProtocol: AnyObject {
    
    var view: MainViewProtocol? { get set }
    func showData()
    func showThemeSettings()
}

class MainPresenter {
    
    weak var view: (any MainViewProtocol)?
    var router: (any MainRouterProtocol)?
    private var dataManager = DataManager()
    
    init() {
        dataManager.delegate = self
        dataManager.startUpdate()
    }
}

extension MainPresenter: MainPresenterProtocol {
    
    func showData() {
        Task {
            let data = await dataManager.getData()
            await view?.setData(viewData: data)
        }
    }
    
    func showThemeSettings() {
        router?.presentThemeSettings()
    }
}

extension MainPresenter: DataManagerDelegate {
    
    func dataManager(_ sender: DataManager, didUpdate value: Int, tableIndex: Int, collectionIndex: Int) async {
        await view?.updateData(value: value, tableIndex: tableIndex, collectionIndex: collectionIndex)
    }
}

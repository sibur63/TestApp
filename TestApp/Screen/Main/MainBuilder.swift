//
//  MainBuilder.swift
//  TestApp
//
//  Created by Сергей Аршинов on 02.07.2024.
//

import Foundation

class MainBuilder {
    
    func build() -> MainViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter()
        let router = MainRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController
        
        return viewController
    }
}

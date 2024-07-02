//
//  ThemeBuilder.swift
//  TestApp
//
//  Created by Сергей Аршинов on 02.07.2024.
//

import Foundation

class ThemeBuilder {
    
    func build() -> ThemeViewController {
        let viewController = ThemeViewController()
        let presenter = ThemePresenter()
        let router = ThemeRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        router.view = viewController
        
        return viewController
    }
}

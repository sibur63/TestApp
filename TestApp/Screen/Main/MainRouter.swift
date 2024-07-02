//
//  MainRouter.swift
//  TestApp
//
//  Created by Сергей Аршинов on 02.07.2024.
//

import UIKit

protocol MainRouterProtocol: AnyObject {
    
    func presentThemeSettings()
}

class MainRouter {
    
    weak var view: UIViewController?
}

extension MainRouter: MainRouterProtocol {
    
    func presentThemeSettings() {
        let viewController = ThemeBuilder().build()
        view?.present(viewController, animated: true)
    }
}

//
//  ThemeRouter.swift
//  TestApp
//
//  Created by Сергей Аршинов on 02.07.2024.
//

import UIKit

protocol ThemeRouterProtocol: AnyObject {
    
    func dismiss()
}

class ThemeRouter {
    
    weak var view: UIViewController?
}

extension ThemeRouter: ThemeRouterProtocol {
    
    func dismiss() {
        view?.dismiss(animated: true)
    }
}

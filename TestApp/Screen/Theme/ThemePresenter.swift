//
//  ThemePresenter.swift
//  TestApp
//
//  Created by Сергей Аршинов on 02.07.2024.
//

import Foundation

protocol ThemePresenterProtocol: AnyObject {
    
    func showThemes()
    func setTheme(index: Int)
    func closeScreen()
}

class ThemePresenter {
    
    weak var view: (any ThemeViewProtocol)?
    var router: (any ThemeRouterProtocol)?
    let themeManager = ThemeManager.shared
}

extension ThemePresenter: ThemePresenterProtocol {
    
    func showThemes() {
        let themesViewData = AppTheme.allCases.compactMap { appTheme in
            var theme = ThemeViewData()
            theme.title = appTheme.rawValue
            theme.isSelected = themeManager.themeType == appTheme
            return theme
        }
        
        view?.setThemes(viewData: themesViewData)
    }
    
    func setTheme(index: Int) {
        let theme = AppTheme.allCases[index]
        themeManager.apply(theme: theme)
    }
    
    func closeScreen() {
        router?.dismiss()
    }
}

//
//  ThemeManager.swift
//  TestApp
//
//  Created by Сергей Аршинов on 21.11.2023.
//

import Foundation

class ThemeManager {
    
    static let shared = ThemeManager()
    private(set) var theme: Theme!
    private(set) var themeType: AppTheme!
    
    private var weakThemeObservers = [ThemeObserver]()
    private var strongThemeObservers = [ThemeObserverProtocol]()
    
    private init() {
        let themeName = UserDefaults.standard.string(forKey: "appTheme") ?? AppTheme.green.rawValue
        let themeType = AppTheme(rawValue: themeName) ?? .green
        apply(theme: themeType)
    }
    
    func apply(theme: AppTheme) {
        UserDefaults.standard.set(theme.rawValue, forKey: "appTheme")
        themeType = theme
        self.theme = theme.theme
        
        weakThemeObservers.forEach { $0.themedidChange() }
        strongThemeObservers.forEach { $0.themedidChange() }
    }
    
    func weakAttach(_ observer: ThemeObserverProtocol) {
        deleteNilObservers()
        if !weakThemeObservers.contains(where: { $0 === observer }) {
            let newObserver = ThemeObserver(observer: observer)
            weakThemeObservers.append(newObserver)
        }
    }
    
    func strongAttach(_ observer: ThemeObserverProtocol) {
        deleteNilObservers()
        if !strongThemeObservers.contains(where: { $0 === observer }) {
            strongThemeObservers.append(observer)
        }
    }
    
    func detach(_ observer: ThemeObserverProtocol) {
        deleteNilObservers()
        if let index = weakThemeObservers.firstIndex(where: { $0 === observer }) {
            weakThemeObservers.remove(at: index)
        }
        
        if let index = strongThemeObservers.firstIndex(where: { $0 === observer }) {
            strongThemeObservers.remove(at: index)
        }
    }
    
    private func deleteNilObservers() {
        weakThemeObservers.removeAll { $0.observer == nil }
    }
}

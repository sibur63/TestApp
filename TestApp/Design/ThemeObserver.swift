//
//  ThemeObserver.swift
//  TestApp
//
//  Created by Сергей Аршинов on 21.11.2023.
//

import Foundation

protocol ThemeObserverProtocol: AnyObject {
    
    func themedidChange()
}

class ThemeObserver {
    
    weak var observer: ThemeObserverProtocol?
    
    init(observer: ThemeObserverProtocol) {
        self.observer = observer
    }
}

extension ThemeObserver: ThemeObserverProtocol {
    
    func themedidChange() {
        observer?.themedidChange()
    }
}

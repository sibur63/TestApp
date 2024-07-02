//
//  Color.swift
//  TestApp
//
//  Created by Сергей Аршинов on 21.11.2023.
//

import UIKit

extension UIColor {
    
    static var backgroundColor: UIColor { ThemeManager.shared.theme.backgroundColor }
    static var cellColor: UIColor { ThemeManager.shared.theme.cellColor }
    static var cellBorderColor: UIColor { ThemeManager.shared.theme.cellBorderColor }
    static var cellTextColor: UIColor { ThemeManager.shared.theme.cellTextColor }
    static var mainTextColor: UIColor { ThemeManager.shared.theme.mainTextColor }
}

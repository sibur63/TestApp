//
//  Theme.swift
//  TestApp
//
//  Created by Сергей Аршинов on 21.11.2023.
//

import UIKit

enum AppTheme: String, CaseIterable {
    case green = "Green"
    case blue = "Blue"
    case red = "Red"
    case light = "Light"
    case dark = "Dark"
    
    var theme: Theme {
        switch self {
        case .green:
            GreenTheme()
        case .blue:
            BlueTheme()
        case .red:
            RedTheme()
        case .light:
            LightTheme()
        case .dark:
            DarkTheme()
        }
    }
}

protocol Theme {
    
    var backgroundColor: UIColor { get }
    var cellColor: UIColor { get }
    var cellBorderColor: UIColor { get }
    var cellTextColor: UIColor { get }
    var mainTextColor: UIColor { get }
}

struct GreenTheme: Theme {
    
    let backgroundColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
    let cellColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    let cellBorderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    let cellTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let mainTextColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
}

struct BlueTheme: Theme {
    
    let backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    let cellColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    let cellBorderColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
    let cellTextColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
    let mainTextColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
}

struct RedTheme: Theme {
    
    let backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
    let cellColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    let cellBorderColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    let cellTextColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
    let mainTextColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
}

struct LightTheme: Theme {
    
    let backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    let cellColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    let cellBorderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    let cellTextColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let mainTextColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
}

struct DarkTheme: Theme {
    
    let backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    let cellColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    let cellBorderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    let cellTextColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    let mainTextColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
}

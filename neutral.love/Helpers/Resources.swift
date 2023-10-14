//
//  Resources.swift
//  neutral.love
//
//  Created by Sergei Smirnov on 14.10.2023.
//

import UIKit

enum Resources {
    
    enum Strings {
        
    }
    
    enum Colors {
        
        static let white = UIColor.white
        static let red = UIColor.red
        
        enum TabBarModule {
            static let tabBarFillColor = UIColor(hexString: "#2D2B2B")
            static let tabBarTintColor = UIColor.white
            static let tabBarUnselectedItem = UIColor(hexString: "#999898")
        }
    }
    
    enum Fonts {
        
    }

    enum Images {
        
        enum TabBarModule {
            static let favourities = UIImage(systemName: "star.fill") ?? UIImage()
            static let main = UIImage(systemName: "plus") ?? UIImage()
            static let settings = UIImage(systemName: "gear") ?? UIImage()
        }
    }
}


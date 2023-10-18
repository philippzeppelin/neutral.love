//
//  Resources.swift
//  neutral.love
//
//  Created by Sergei Smirnov on 14.10.2023.
//

import UIKit

enum Resources {

    enum Strings {
        enum MainModule {
            static let generateButton = "Generate"
        }
    }

    enum Colors {
        static let white = UIColor.white
        static let red = UIColor.red

        enum TabBarModule {
            static let tabBarFillColor = UIColor(hexString: "#2D2B2B")
            static let tabBarTintColor = UIColor.white
            static let tabBarUnselectedItem = UIColor(hexString: "#999898")
        }
        
        enum MainModule {
            static let backgroundMainViewController = UIColor(hexString: "#666666")
            
            static let mainCollectionBackground = UIColor(hexString: "#666666")
            static let mainCollectionCellBackground = UIColor(hexString: "#D9D9D9")
            
            static let generateButtonBackground = UIColor(hexString: "#5B5B93")
        }
    }

    enum Fonts {
            // Semi-bold
            static let SFProTextSemibold17 = UIFont(name: "SFProText-Semibold", size: 17)
    }

    enum Images {
        enum TabBarModule {
            static let favourities = UIImage(systemName: "star.fill") ?? UIImage()
            static let main = UIImage(systemName: "plus") ?? UIImage()
            static let settings = UIImage(systemName: "gear") ?? UIImage()
        }
    }
}

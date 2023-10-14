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
        
    }
    
    enum Fonts {
        
    }

    enum Images {
        
        enum TabBarModule {
            static let main = UIImage(named: "main") ?? UIImage()
            static let mainSelected = UIImage(named: "mainSelected") ?? UIImage()
            static let pet = UIImage(named: "pet") ?? UIImage()
            static let petSelected = UIImage(named: "petSelected") ?? UIImage()
            static let friends = UIImage(named: "friends") ?? UIImage()
            static let friendsSelected = UIImage(named: "friendsSelected") ?? UIImage()
        }
    }
}


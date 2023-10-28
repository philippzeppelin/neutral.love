//
//  Resources.swift
//  neutral.love
//
//  Created by Sergei Smirnov on 14.10.2023.
//

import UIKit

enum Resources {
    enum Strings {
        enum SignInModule {
            static let emailText: String = "Email"
            static let passwordAsterisksText: String = "******"
            static let signInButtonText: String = "Sign In"
            static let signUpButtonText: String = "Sign Up"
            static let passwordText: String = "Password"
            static let dontHaveAnAccountText: String = "Don't have an account?"
        }

        enum MainModule {
            static let generateButton = "Generate"
        }

        enum GenerateModule {
            static let headerLabel = "Generate"
            static let styleLabel = "Style"
            static let layoutLabel = "Layout"
            static let amountLabel = "Amount"
        }
    }

    enum Colors {
        static let white = UIColor.white
        static let red = UIColor.red
        static let backgroundGray = UIColor(hexString: "#666666")
        static let backgroundHeader = UIColor(hexString: "#2D2B2B")

        enum TabBarModule {
            static let tabBarFillColor = UIColor(hexString: "#2D2B2B")
            static let tabBarTintColor = UIColor.white
            static let tabBarUnselectedItem = UIColor(hexString: "#999898")
        }

        enum SignInModule {
            static let signButtonsColor = UIColor(hexString: "5B5B93")
        }

        enum MainModule {
            static let mainCollectionCellBackground = UIColor(hexString: "#D9D9D9")
            static let generateButtonBackground = UIColor(hexString: "#5B5B93")
        }

        enum GenerateModule {
            static let textFildTextColor = UIColor(hexString: "#8E8EAC")
            static let textFildBackgroundColor = UIColor(hexString: "#D1D1D6")
        }
    }

    enum Fonts {
        enum SignInModule {
            static let arial17 = UIFont(name: "Arial", size: 17)
            static let arial12 = UIFont(name: "Arial", size: 12)
        }

        enum TabBarModule {
            // Semi-bold
            static let SFProTextSemibold17 = UIFont(name: "SFProText-Semibold", size: 17)
            static let SFProTextSemibold35 = UIFont(name: "SFProText-Semibold", size: 35)
        }
    }

    enum Images {
        enum TabBarModule {
            static let favourities = UIImage(systemName: "star.fill") ?? UIImage()
            static let main = UIImage(systemName: "plus") ?? UIImage()
            static let settings = UIImage(systemName: "gear") ?? UIImage()
        }
    }
}

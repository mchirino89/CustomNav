//
//  NavBarController.swift
//  CustomNav
//
//  Created by Mauricio Chirino on 24/01/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import UIKit

class NavBarController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    func handleNavBar(for style: NavBarStyle, in navBar: UINavigationBar) {
        navBar.tintColor = .white
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        switch style {
        case .default:
            navBar.barTintColor = .red
        case .beyond:
            navBar.barTintColor = .blue
        case .finish:
            navBar.barTintColor = .green
        case .undefined:
            navBar.barTintColor = .yellow
        }
    }
}

extension NavBarController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        let style: NavBarStyle = (viewController as? NavBarStylable)?.viewStyle ?? .default
        handleNavBar(for: style, in: self.navigationBar)
    }
}



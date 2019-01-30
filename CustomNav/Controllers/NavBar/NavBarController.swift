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
}

extension NavBarController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        let style: NavBarStyle = (viewController as? NavBarStylable)?.viewStyle ?? .default
        style.handleNavBar(for: self.view, in: self.navigationBar)
    }
}

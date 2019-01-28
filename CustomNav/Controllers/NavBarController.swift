//
//  NavBarController.swift
//  CustomNav
//
//  Created by Mauricio Chirino on 24/01/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import UIKit

class NavBarController: UINavigationController, NavBarStatable {

    // 0. Define initial state
    var current: NavBar = .root

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

extension NavBarController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        // 1. A new state is generated
        current = current.queryState(basedOn: viewController)
    }
}

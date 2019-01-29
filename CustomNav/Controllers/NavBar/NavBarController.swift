//
//  NavBarController.swift
//  CustomNav
//
//  Created by Mauricio Chirino on 24/01/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import UIKit

class NavBarController: UINavigationController, NavBarCustomizable {

    weak var updatableDelegate: NavBarUpdatable?

    /// 1. Set init state
    var current: NavBar = .root {
        didSet {
            setNavUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

extension NavBarController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        // 2. A new state is generated
        current = .queryState(basedOn: viewController)
    }
}

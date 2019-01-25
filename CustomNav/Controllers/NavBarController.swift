//
//  NavBarController.swift
//  CustomNav
//
//  Created by Mauricio Chirino on 24/01/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import UIKit

protocol NavBarHandable: class {

}

class NavBarController: UINavigationController {

    var size: CGRect{
        return CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: 100))
    }
    lazy var customView: UIView = {
        let custom = UIView(frame: size)
        custom.translatesAutoresizingMaskIntoConstraints = false
        custom.backgroundColor = .blue
        return custom
    }()
    weak var navDelegate: NavBarHandable?

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
}

extension NavBarController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {

    }
}

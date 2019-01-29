//
//  NavBarDisplayController.swift
//  CustomNav
//
//  Created by Mauricio Chirino on 28/01/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import UIKit

class NavBarDisplayController: UIViewController {

    let headerImageView = UIImageView(image: nil)

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let navController = navigationController as? NavBarController else { return }
        navController.view.backgroundColor = .clear
        navController.updatableDelegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let navController = navigationController else { return }
        clearStyle(for: navController.navigationBar)
    }

    func clearStyle(for navBar: UINavigationBar) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension NavBarDisplayController: NavBarUpdatable {
    /// Update UI with incoming style object
    func setHeaderStyle(basedOn style: NavBarStyle) {
        print("Incoming style: \(style)")
        title = style.title
        navigationController?.view.backgroundColor = style.color
    }
}

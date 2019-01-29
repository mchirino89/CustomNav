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
        setInitSettings()
    }

    private func setInitSettings() {
        guard let navController = navigationController as? NavBarController else { return }
        navController.view.backgroundColor = .clear
        navController.updatableDelegate = self
        self.view.addSubview(headerImageView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let navController = navigationController else { return }
        clearStyle(for: navController.navigationBar)
    }

    private func clearStyle(for navBar: UINavigationBar) {
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        headerImageView.constraints.forEach { $0.isActive = false }
    }
}

extension NavBarDisplayController: NavBarUpdatable {
    /// Update UI with incoming style object
    func setHeaderStyle(basedOn style: NavBarStyle) {
        headerImageView.backgroundColor = style.color
        setTitle(with: style.title)
        setHeaderSize(with: style.height)
    }

    private func setTitle(with text: String) {
        let textAttributes = [NSAttributedString.Key.foregroundColor:  UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        title = text
    }

    private func setHeaderSize(with heightValue: CGFloat) {
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        let top = headerImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        let right = headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        let left = headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        let height = headerImageView.heightAnchor.constraint(equalToConstant: heightValue)
        NSLayoutConstraint.activate([top, right, left, height])
    }
}

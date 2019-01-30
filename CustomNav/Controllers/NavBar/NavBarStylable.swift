//
//  NavBarStylable.swift
//  CustomNav
//
//  Created by Mauricio Chirino on 28/01/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import UIKit

enum NavBarStyle {
    case `default`
    case beyond
    case finish
    case undefined
}

protocol NavBarStylable: class {
    var viewStyle: NavBarStyle { get }
}

protocol NavBarCustomizable where Self: UINavigationController {
    func handleNavBar(for style: NavBarStyle, in navBar: UINavigationBar)
}

extension NavBarCustomizable {
    func handleNavBar(for style: NavBarStyle, in navBar: UINavigationBar) {
        navBar.tintColor = .white
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        setHeaderSize()
        switch style {
        case .default:
            navBar.barTintColor = .white
        case .beyond:
            navBar.barTintColor = .blue
        case .finish:
            navBar.barTintColor = .green
        case .undefined:
            navBar.barTintColor = .black
        }
    }

    private func setHeaderSize() {
        let size = CGRect(origin: .zero, size: CGSize(width: 320, height: 100))
        let headerView = UIView(frame: size)
        let profileView = UIImageView(image: UIImage(imageLiteralResourceName: "profile"))
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.contentMode = .scaleAspectFit
        profileView.tintColor = .gray
        profileView.layer.cornerRadius = profileView.frame.width / 2
        headerView.addSubview(profileView)
        view.addSubview(headerView)
        headerView.backgroundColor = .white
        headerView.translatesAutoresizingMaskIntoConstraints = false
        let topView = headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0)
        let rightView = headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0)
        let leftView = headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        let heightView = headerView.heightAnchor.constraint(equalToConstant: size.height)
        let centerXProfile = profileView.centerXAnchor.constraint(equalTo: headerView.centerXAnchor)
        let topProfile = profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let widthProfile = profileView.widthAnchor.constraint(equalToConstant: size.height * 0.75)
        let heightProfile = profileView.heightAnchor.constraint(equalToConstant: size.height * 0.75)
        NSLayoutConstraint.activate([topView, rightView, leftView, heightView, centerXProfile, topProfile, widthProfile, heightProfile])
    }
}

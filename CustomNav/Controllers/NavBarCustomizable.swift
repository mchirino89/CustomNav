//
//  NavBarCustomizable.swift
//  CustomNav
//
//  Created by Mauricio Chirino on 27/01/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import UIKit

enum NavBar {
    case root
    case beyond
    case finish
    case undefined

    static func queryState(basedOn incomingView: UIViewController) -> NavBar {
        if incomingView.isKind(of: RootViewController.self) {
            return .root
        } else if incomingView.isKind(of: BeyondViewController.self) {
            return .beyond
        } else if incomingView.isKind(of: ReturnViewController.self) {
            return .finish
        } else {
            return .undefined
        }
    }
}

protocol NavBarStatable where Self: UIViewController {
    var current: NavBar { get set }
}

extension NavBarStatable {
    var current: NavBar {
        return .queryState(basedOn: self)
    }
}

protocol NavBarCustomizable: NavBarStatable {
    func setNavUI()
    func updateNav(with title: String, and color: UIColor)
}

extension NavBarCustomizable {

    func setNavUI() {
        print("Updating state for \(current)")
        switch current {
        case .root:
            updateNav(with: "Root view", and: .green)
        case .beyond:
            updateNav(with: "Beyond view", and: .blue)
        case .finish:
            updateNav(with: "Final view", and: .red)
        default:
            updateNav(with: "Undefined view", and: .clear)
        }
    }

    func updateNav(with title: String, and color: UIColor) {
//        navigationController?.title = title
        UINavigationBar.appearance().tintColor = color
    }

}

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

    func queryState(basedOn incomingView: UIViewController) -> NavBar {
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
    init() {
        self.init()
        current = .undefined
    }
}

protocol NavBarCustomizable: NavBarStatable {
    func setUI()
}

extension NavBarCustomizable {
    func setUI() {
        switch current {
        case .root:
            title = "Root view"
            navigationController?.navigationBar.tintColor = .green
        case .beyond:
            title = "Beyond view"
            navigationController?.navigationBar.tintColor = .blue
        case .finish:
            title = "Final view"
            navigationController?.navigationBar.tintColor = .red
        default:
            title = "Undefined view"
            navigationController?.navigationBar.tintColor = .clear
        }
    }
}

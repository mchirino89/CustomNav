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

    /// (WIP: polishing is required here) - returns state based on current
    /// view controller being displayed
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

struct NavBarStyle {
    var title: String
    var color: UIColor
    var height: CGFloat
}

protocol NavBarCustomizable where Self: UIViewController {
    var current: NavBar { get set }
    var updatableDelegate: NavBarUpdatable? { get set }
    func setNavUI()
}

extension NavBarCustomizable {

    var current: NavBar {
        return .queryState(basedOn: self)
    }

    var updatableDelegate: NavBarUpdatable? {
        return self.updatableDelegate
    }

    /// 3. Update UI accordingly
    func setNavUI() {
        var newStyle: NavBarStyle
        switch current {
        case .root:
            newStyle = NavBarStyle(title: "Root view",
                                       color: .green,
                                       height: 84)
        case .beyond:
            newStyle = NavBarStyle(title: "Beyond view",
                                       color: .blue,
                                       height: 104)
        case .finish:
            newStyle = NavBarStyle(title: "Final view",
                                       color: .red,
                                       height: 124)
        default:
            newStyle = NavBarStyle(title: "Undefined view",
                                       color: .clear,
                                       height: 44)
        }
        updatableDelegate?.setHeaderStyle(basedOn: newStyle)
    }
}

protocol NavBarUpdatable: class {
    func setHeaderStyle(basedOn style: NavBarStyle)
}

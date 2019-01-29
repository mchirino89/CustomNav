//
//  RootViewController.swift
//  CustomNav
//
//  Created by Mauricio Chirino on 24/01/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
}

extension RootViewController: NavBarStylable {
    var viewStyle: NavBarStyle {
        return .default
    }
}

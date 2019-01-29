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

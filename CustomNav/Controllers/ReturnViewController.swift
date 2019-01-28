//
//  ReturnViewController.swift
//  CustomNav
//
//  Created by Mauricio Chirino on 25/01/2019.
//  Copyright © 2019 Mauricio Chirino. All rights reserved.
//

import UIKit

class ReturnViewController: UIViewController {
    @IBAction func returnAction() {
        navigationController?.popToRootViewController(animated: true)
    }
}

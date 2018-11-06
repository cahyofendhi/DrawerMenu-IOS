//
//  TableExtention.swift
//  E-Service
//
//  Created by Rumah Ulya on 03/09/18.
//  Copyright © 2018 Rumah Ulya. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerNib(xibName: String, identifier: String) {
        let nib = UINib(nibName: xibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}


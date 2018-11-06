//
//  SideMenuVC.swift
//  E-Service
//
//  Created by Rumah Ulya on 03/09/18.
//  Copyright © 2018 Rumah Ulya. All rights reserved.
//

import UIKit
import SideMenu

protocol MenuDelegate {
    func didMenuSelected(_ name: String, _ index: Int)
}

class SideMenuVC: UIViewController {

    let menus = ["Menu 1", "Menu 2", "Menu 3", "Menu 4", "Menu 5"]
    var delegate: MenuDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // refresh cell blur effect in case it changed
        tableView.reloadData()
        
        guard SideMenuManager.default.menuBlurEffectStyle == nil else {
            return
        }
    }
    
    func initTableView() {
        self.tableView.registerNib(xibName: Constant.HEADER_MENU_CELL, identifier: Constant.HEADER_MENU_CELL)
        self.tableView.registerNib(xibName: Constant.MENU_CELL, identifier: Constant.MENU_CELL)
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 85
    }
    
}

extension SideMenuVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell    = tableView.dequeueReusableCell(withIdentifier: Constant.HEADER_MENU_CELL) as! HeaderMenuCell
            return cell
        } else {
            let cell    = tableView.dequeueReusableCell(withIdentifier: Constant.MENU_CELL) as! MenuCell
            cell.labelName.text = menus[indexPath.row - 1]
            cell.blurEffectStyle = SideMenuManager.default.menuBlurEffectStyle
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 0 {
            let index = indexPath.row - 1
            if index == 0 {
                performSegue(withIdentifier: Constant.ROOT_MENU, sender: nil)
            } else {
                delegate?.didMenuSelected(menus[index], index)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
}

//
//  ViewController.swift
//  E-Service
//
//  Created by Rumah Ulya on 03/09/18.
//  Copyright © 2018 Rumah Ulya. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController, MenuDelegate {
    

    @IBOutlet weak var buttonMenu: UIBarButtonItem!
    
    @IBOutlet weak var labelMain: UILabel!
    
    lazy var menu1: Menu1VC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var vc = storyboard.instantiateViewController(withIdentifier: "Menu1VC") as! Menu1VC
        self.addViewControllerAsChildViewController(childViewController: vc)
        return vc
    }()
    
    lazy var menu2: Menu2VC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var vc = storyboard.instantiateViewController(withIdentifier: "Menu2VC") as! Menu2VC
        self.addViewControllerAsChildViewController(childViewController: vc)
        return vc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupSideMenu()
        pageSelected(0)
    }

    fileprivate func setupSideMenu() {
        // Define the menus
        SideMenuManager.default.menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
        
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuWidth = view.frame.width * CGFloat(0.75)
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear
        SideMenuManager.default.menuAnimationFadeStrength = 0.5
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController{
            if let menuVC = navVC.viewControllers[0] as? SideMenuVC{
                menuVC.delegate = self
            }
        }
    }
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController) {
//        addChildViewController(childViewController)
        view.addSubview(childViewController.view)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        childViewController.didMove(toParentViewController: self)
    }
    
    private func removeViewControllerAsChildViewController(childViewController: UIViewController){
        childViewController.willMove(toParentViewController: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParentViewController()
    }
    
    func didMenuSelected(_ name: String, _ index: Int) {
        self.labelMain.text = name
        self.pageSelected(index)
    }
    
    private func pageSelected(_ index: Int) {
        if index % 2 == 0 {
            menu1.view.isHidden = false
            menu2.view.isHidden = true
        } else {
            menu1.view.isHidden = true
            menu2.view.isHidden = false
        }
    }
    
}

extension ViewController: UISideMenuNavigationControllerDelegate {
    
    func sideMenuWillAppear(menu: UISideMenuNavigationController, animated: Bool) {
//        print("SideMenu Appearing! (animated: \(animated))")
    }
    
    func sideMenuDidAppear(menu: UISideMenuNavigationController, animated: Bool) {
//        print("SideMenu Appeared! (animated: \(animated))")
    }
    
    func sideMenuWillDisappear(menu: UISideMenuNavigationController, animated: Bool) {
//        print("SideMenu Disappearing! (animated: \(animated))")
    }
    
    func sideMenuDidDisappear(menu: UISideMenuNavigationController, animated: Bool) {
//        print("SideMenu Disappeared! (animated: \(animated))")
    }
    
}


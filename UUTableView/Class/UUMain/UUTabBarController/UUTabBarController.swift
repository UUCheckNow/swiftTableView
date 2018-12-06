//
//  UUTabBarController.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class UUTabBarController: UUBaseTabBarController,UUTabBarViewDelegate {

    let items = [["image" : "tab_first", "selected_image" : "tab_first_selected", "title" : ""],
                 ["image" : "tab_second", "selected_image" : "tab_second_selected", "title" : ""],
                 ["image" : "tab_center", "selected_image" : "tab_center_selected", "title" : ""],
                 ["image" : "tab_third", "selected_image" : "tab_third_selected", "title" : ""],
                 ["image" : "tab_fourth", "selected_image" : "tab_fourth_selected", "title" : ""]]
    let vcs = [HomeViewController(), HotViewController(), UIViewController(), FindViewController(), UUMoreVC()]
    let bar = UUTabBar()
    let tabBarView = UUTabBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(bar, forKey: "tabBar")
        viewControllers = vcs.map { (vc) -> UIViewController in
            if vc.isKind(of: UUBaseViewController.self) {
                return UUBaseNavigationController(rootViewController: vc)
            }
            return UUBaseNavigationController()
        }
        tabBarView.delegate = self
        tabBarView.setupItems(arr: items)
        tabBar.addSubview(tabBarView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tabBarView.frame = bar.bounds
    }
    
    func tabBarSelect(index: Int) {
        if index == 2 {
            centerAction()
            return
        }
        tabBarTransitionAnimation(index: index)
        selectedIndex = index
    }
    
    func tabBarTransitionAnimation(index: Int) {
        if let vc = (viewControllers?[index] as? UUBaseNavigationController)?.topViewController as? UUBaseViewController {
            vc.contentView.alpha = 0
            UIView.animate(withDuration: 0.4) {
                vc.contentView.alpha = 1
            }
        }
    }
    
    func centerAction() {
        present(CenterViewController(), animated: true)
    }

}

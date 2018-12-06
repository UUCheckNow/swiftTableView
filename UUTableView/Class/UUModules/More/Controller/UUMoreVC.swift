//
//  UUMoreVC.swift
//  UUTableView
//
//  Created by lhn on 2018/11/30.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class UUMoreVC: UUBaseViewController {

    let animator = UUAnimator()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "Fourth"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAnimator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem?.isEnabled = true
    }
    
    func setupView() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "tab_mine_selected"), style: .plain, target: self, action: #selector(FindViewController.enterMine))
    }
    
    func setupAnimator() {
        weak var weakSelf = self
        animator.setup(panGestureVC: self, transitionAction: {
            weakSelf?.enterMine()
        }) { (fromVC, toVC, operation) -> Dictionary<String, Any>? in
            return ["duration" : "0.4", "delegate" : UUMinePresentAnimation()]
        }
    }
    
    @objc func enterMine() {
        let vc = MineViewController()
        animator.registerDelegate(vc: vc)
        present(vc, animated: true)
    }
}


//
//  FindViewController.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class FindViewController: UUBaseViewController {



let animator = UUAnimator()

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
}

override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    title = "Third"
}

override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupAnimator()
}

override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationItem.leftBarButtonItem?.isEnabled = true
    navigationItem.rightBarButtonItem?.isEnabled = true
}

func setupView() {
    view.backgroundColor = .white
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "tab_mine_selected"), style: .plain, target: self, action: #selector(FindViewController.enterMine))
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "tab_third_selected"), style: .plain, target: self, action: #selector(FindViewController.enterDetail))
}

func setupAnimator() {
    weak var weakSelf = self
    animator.setup(panGestureVC: self, transitionAction: {
        weakSelf?.enterMine()
    }) { (fromVC, toVC, operation) -> Dictionary<String, Any>? in
        if toVC is UUSettingVC {
            return nil
        }
        switch operation {
        case .present:
            if toVC is UUThirdDetailVC {
                return ["duration" : "0.4", "delegate" : UUThirdDetailPresentAnimation()]
            } else if toVC is MineViewController {
                return ["duration" : "0.4", "delegate" : UUMinePresentAnimation()]
            }
        default: break
        }
        return nil
    }
}

@objc func enterDetail() {
    navigationItem.leftBarButtonItem?.isEnabled = false
    navigationItem.rightBarButtonItem?.isEnabled = false
    let vc = UUThirdDetailVC()
    animator.registerDelegate(vc: vc)
    present(vc, animated: true)
}

@objc func enterMine() {
    let vc = MineViewController()
    animator.registerDelegate(vc: vc)
    present(vc, animated: true)
}
}

//
//  HomeViewController.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class HomeViewController: UUBaseViewController {
        
        let imageView = UIImageView()
        let animator = UUAnimator()
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
            super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
            title = "首页"
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupView()
            setupAnimator()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            animator.registerDelegate(vc: self)
            navigationItem.leftBarButtonItem?.isEnabled = true
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
        
        func setupView() {
            view.backgroundColor = .white
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "tab_mine_selected"), style: .plain, target: self, action: #selector(HomeViewController.enterMine))
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "tab_third_selected"), style: .plain, target: self, action: #selector(HomeViewController.enterDetail))
            
            imageView.image = UIImage(named: "Image")
            imageView.backgroundColor = .lightGray
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 20
            imageView.layer.masksToBounds = true
            contentView.addSubview(imageView)
            setupConstraints()
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
                case .push:
                    return ["duration" : "1", "delegate" : UUFirstDetailPushAnimation()]
                case .present:
                    return ["duration" : "0.4", "delegate" : UUMinePresentAnimation()]
                default: break
                }
                return nil
            }
        }
        
        func setupConstraints() {
            imageView.snp.makeConstraints { (make) in
                make.width.equalTo(300)
                make.height.equalTo(200)
                make.center.equalToSuperview()
            }
        }
        
        @objc func enterDetail() {
            navigationItem.leftBarButtonItem?.isEnabled = false
            navigationItem.rightBarButtonItem?.isEnabled = false
            navigationController?.pushViewController(UUFirstDetailVC(), animated: true)
        }
        
        @objc func enterMine() {
            let vc = MineViewController()
            animator.registerDelegate(vc: vc)
            present(vc, animated: true)
        }
}

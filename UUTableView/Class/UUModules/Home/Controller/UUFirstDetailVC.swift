//
//  UUFirstDetailVC.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class UUFirstDetailVC: UUBaseViewController {
    
    let backBtn = UIButton()
    let imageView = UIImageView()
    let label = UILabel()
    let animator = UUAnimator()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "FirstDetail"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAnimator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animator.registerDelegate(vc: self)
    }
    
    func setupView () {
        view.backgroundColor = .white
        
        label.text = "有毒的草开迷人的花\n伤你的人说爱你的话"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.numberOfLines = 0
        label.frame = CGRect(x: 30, y: 320, width: UIScreen.main.bounds.width - 60, height: 80)
        view.addSubview(label)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Image")
        view.addSubview(imageView)
        
        backBtn.setImage(UIImage(named: "tab_first_selected"), for: .normal)
        backBtn.addTarget(self, action: #selector(UUFirstDetailVC.back), for: .touchUpInside)
        view.addSubview(backBtn)
        setupConstraints()
    }
    
    func setupAnimator() {
        weak var weakSelf = self
        animator.setup(panGestureVC: self, transitionAction: {
            weakSelf?.back()
        }) { (fromVC, toVC, operation) -> Dictionary<String, Any>? in
            return ["duration" : "1", "delegate" : UUFirstDetailPopAnimation()]
        }
    }
    
    func setupConstraints() {
        backBtn.snp.makeConstraints { (make) in
            make.size.equalTo(44)
            make.top.equalTo(kStatusBarHeight)
            make.left.equalTo(6)
        }
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
}

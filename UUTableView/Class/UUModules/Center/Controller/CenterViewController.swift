//
//  CenterViewController.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class CenterViewController: UUBaseViewController {
    
    let backBtn = UIButton()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "smilesmile"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        
        backBtn.setImage(UIImage(named: "tab_first_selected"), for: .normal)
        backBtn.addTarget(self, action: #selector(CenterViewController.back), for: .touchUpInside)
        view.addSubview(backBtn)
        setupConstraints()
    }
    
    func setupConstraints() {
        backBtn.snp.makeConstraints { (make) in
            make.size.equalTo(44)
            make.top.equalTo(kStatusBarHeight)
            make.left.equalTo(6)
        }
    }
    
    @objc func back() {
        dismiss(animated: true)
    }
}


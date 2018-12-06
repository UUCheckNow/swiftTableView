//
//  UUBaseViewController.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit
import SnapKit

class UUBaseViewController: UIViewController,UIGestureRecognizerDelegate {
    
    let contentView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = .white
        view.addSubview(contentView)
        contentView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


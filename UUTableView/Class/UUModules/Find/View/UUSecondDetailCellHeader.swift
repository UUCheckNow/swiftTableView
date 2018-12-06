//
//  UUSecondDetailCellHeader.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class UUSecondDetailCellHeader: UIView {
    
    var model: UUSecondDetailSectionModel?
    let title = UILabel()
    let btn = UIButton()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect())
        
        title.font = .lvPFM12()
        title.textColor = .lvBlack2
        addSubview(title)
        addSubview(btn)
        setupConstraints()
    }
    
    func setupConstraints() {
        title.snp.remakeConstraints { (make) in
            make.left.equalTo(16)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        btn.snp.remakeConstraints { (make) in
            make.size.equalTo(22)
            make.left.equalTo(title.snp.right)
            make.centerY.equalTo(title)
        }
    }
    
    func setupData(data: Any?) {
        model = data as? UUSecondDetailSectionModel
        if let m = model {
            title.text = m.title
            if m.iconPath != nil {
//                btn.setImage(Iconic.image(withIcon: Icon(named: iconPath), size: CGSize(width: 12, height: 12), color: .lvGray2), for: .normal)
                btn.addTarget(self, action: #selector(UUSecondDetailCellHeader.btnPressed(sender:)), for: .touchUpInside)
            }
        }
    }
    
    @objc func btnPressed(sender: UIButton) {
        UUPopView().show(text: "包含文本字段，会使得只有数字字段的数据源在搜索结果中被排除；选择包含文本字段，则会使只有文本字段的数据源在搜索结果中被排除。", width: frame.width, sender: sender)
    }
}


//
//  UUTabBarView.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

protocol UUTabBarViewDelegate : class {
    func tabBarSelect(index: Int)
}


class UUTabBarView: UIView {

    weak var delegate : UUTabBarViewDelegate?
    var items = [UUTabBarItem]()
    var lastIndex = 0
    
    func setupItems(arr:[[String:String]]) {
        backgroundColor = .white
        for (index,value) in arr.enumerated() {
            let item = UUTabBarItem()
            item.tag = index
            item.title = value["title"]
            item.normalIamge = UIImage(named: value["image"] ?? "")
            item.selectImage = UIImage(named: value["selected_image"] ?? "")
            item.addTarget(self, action: #selector(UUTabBarView.selectItem(sender:)), for: .touchUpInside)
            if index == 0 {
                item.isSelected = true
            }
            if index == 2 {
                item.isCenter = true
            }
            item.select()
            item.setup()
            addSubview(item)
            items.append(item)
        }
    }
    
    override func layoutSubviews() {
        let itemWidth: Double = Double(frame.size.width) / Double(items.count)
        let itemHeight: Double = 48
        for (index, item) in items.enumerated() {
            item.frame = CGRect(x: Double(index) * itemWidth, y: item.isCenter ? -10 : 0, width: itemWidth, height: itemHeight)
        }
    }
    
    @objc func selectItem(sender: UUTabBarItem) {
        let currentIndex = sender.tag
        if currentIndex == 2 {
            delegate?.tabBarSelect(index: currentIndex)
            return
        }
        if lastIndex != currentIndex {
            lastIndex = currentIndex
            delegate?.tabBarSelect(index: currentIndex)
            sender.scaleAnimation()
            for (index, item) in items.enumerated() {
                item.isSelected = sender.tag == index
                item.select()
            }
        }
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

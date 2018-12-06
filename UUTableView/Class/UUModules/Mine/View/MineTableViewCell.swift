//
//  MineTableViewCell.swift
//  UUTableView
//
//  Created by lhn on 2018/12/1.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class MineTableViewCell: UITableViewCell {
    
    var titleLabel:UILabel?
    var headerimgview: UIImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.titleLabel = UILabel()
        self.addSubview(self.titleLabel!)
        self.headerimgview = UIImageView()
        self.addSubview(self.headerimgview!)
        
        setupviews()
    }
    
    //刚开始会报错，后来加了一段这个东西
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setupviews() {

        self.headerimgview?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self)
            make.width.height.equalTo(30)
            make.left.equalTo(self).offset(20)
        })
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self.headerimgview!.snp.right).offset(10)
        })
        
    }
    
    func configDatasWith(titles:String,images:String) {
        self.titleLabel?.text = titles;
        self.titleLabel?.textColor = RandomUIColor()
        self.headerimgview?.image = UIImage.init(named: images);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupviews()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


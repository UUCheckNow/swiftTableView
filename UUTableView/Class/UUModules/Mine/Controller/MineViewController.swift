//
//  MineViewController.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class MineViewController: UUBaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    let backBtn = UIButton()
    let label = UILabel()
    let animator = UUAnimator()
    fileprivate var tableview : UITableView!
    let titlesarray:[String] = ["金币","订单","邮件","资料","地址","关于","哈哈"]
    let imagesarray:[String] = ["share_pengyouquan","share_link","share_qq","share_qzone","share_wechat","share_weibo","tab_center_selected"]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "tableview的使用"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAnimator()
        setuptableview()
    }
    
    func setuptableview() {
        //设置UItabView的位置
        
        tableview = UITableView()
        
        self.view.addSubview(tableview)
        
        //这个类似于masonry
        tableview.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(self.view).offset(kTopHeight)
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(kScreenHeight-kTopHeight-kTabBarHeight)
        }
        self.tableview.backgroundColor = UIColor.white
//        去掉分割线
//        self.tableview.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "MineTableViewCell")
         self.tableview?.tableHeaderView = headerImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animator.registerDelegate(vc: self)
    }
    
    func setupView() {
        label.text = "设置界面"
        label.font = UIFont.systemFont(ofSize: 20)
        label.frame = CGRect(x: 30, y: kScreenHeight - CGFloat(kTabBarHeight), width: kScreenWidth-60, height: 30)
        label.isUserInteractionEnabled = true
        view.addSubview(label)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MineViewController.enterSetting))
        label.addGestureRecognizer(tap)
        
        backBtn.frame = CGRect(x: 6, y: kStatusBarHeight, width: 44, height: 44)
        backBtn.setImage(UIImage(named: "tab_first_selected"), for: .normal)
        backBtn.addTarget(self, action: #selector(MineViewController.back), for: .touchUpInside)
        view.addSubview(backBtn)
    }
    
    func setupAnimator() {
        weak var weakSelf = self
        animator.setup(panGestureVC: self, transitionAction: {
            weakSelf?.back()
        }) { (fromVC, toVC, operation) -> Dictionary<String, Any>? in
            return ["duration" : "0.4", "delegate" : UUMineDismissAnimation()]
        }
    }
    
    @objc func enterSetting() {
        if let tabBar = (UIApplication.shared.delegate as? AppDelegate)?.tabBar {
            if let nav = tabBar.children[tabBar.selectedIndex] as? UINavigationController {
                let vc = nav.viewControllers.first
                back()
                vc?.navigationController?.pushViewController(UUSettingVC(), animated: true)
            }
        }
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titlesarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "MineTableViewCell"
        var cell:MineTableViewCell! = tableView.dequeueReusableCell(withIdentifier: indentifier)as?MineTableViewCell
        if cell == nil {
            cell = MineTableViewCell(style: .default, reuseIdentifier: indentifier)
        }
        cell.configDatasWith(titles: self.titlesarray[indexPath.row], images: self.imagesarray[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableview.deselectRow(at: indexPath, animated: true)
        print("touch \(self.titlesarray[indexPath.row])")
    }
    
    //懒加载
    
    lazy var headerImage:UIImageView = {
        let headerImage = UIImageView()
        headerImage.image = UIImage.init(named: "Image")
        headerImage.frame = CGRect.init(x:0,y:0,width:300,height:200)
        return headerImage
        
    }()
    
    
}



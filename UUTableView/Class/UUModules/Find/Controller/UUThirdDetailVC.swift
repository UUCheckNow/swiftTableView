//
//  UUThirdDetailVC.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class UUThirdDetailVC: UUBaseViewController {
    
    let bg = UIView()
    let whiteBoard = UUThirdDetailView()
    let animator = UUAnimator()
    var data = [UUThirdDetailSectionModel(), UUThirdDetailSectionModel(), UUThirdDetailSectionModel()]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animator.registerDelegate(vc: self)
    }
    
    func setupView() {
        view.backgroundColor = .clear
        bg.backgroundColor = .lvBlack2
        bg.alpha = 0.61
        view.addSubview(bg)
        
        weak var weakSelf = self
        whiteBoard.cancelAction = {
            weakSelf?.back()
        }
        whiteBoard.title.text = "GRV_Lv"
        view.addSubview(whiteBoard)
        
        setupData()
        setupAnimator()
        setupConstraints()
        whiteBoard.reloadData(newData: data)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UUThirdDetailVC.back))
        bg.addGestureRecognizer(tap)
    }
    
    func setupData() {
        for (index, sectionModel) in data.enumerated() {
            switch index {
            case 0:
                sectionModel.title = "分享至"
                sectionModel.cellModels = [setupCellModel(type: .weibo),
                                           setupCellModel(type: .qzone),
                                           setupCellModel(type: .qq),
                                           setupCellModel(type: .wechat),
                                           setupCellModel(type: .pengyouquan),
                                           setupCellModel(type: .copyurl),
                                           setupCellModel(type: .weibo),
                                           setupCellModel(type: .qzone),
                                           setupCellModel(type: .qq),
                                           setupCellModel(type: .wechat),
                                           setupCellModel(type: .pengyouquan),
                                           setupCellModel(type: .copyurl)]
            case 1:
                sectionModel.title = "快速创建"
                sectionModel.cellModels = [setupCellModel(type: .card),
                                           setupCellModel(type: .rule),
                                           setupCellModel(type: .message)]
            case 2:
                sectionModel.title = "标记为"
                sectionModel.cellModels = [setupCellModel(type: .white),
                                           setupCellModel(type: .blue),
                                           setupCellModel(type: .orange),
                                           setupCellModel(type: .green),
                                           setupCellModel(type: .red)]
            default: break
            }
        }
    }
    
    func setupCellModel(type: UUThirdDetailCellType) -> UUThirdDetailCellModel {
        let model = UUThirdDetailCellModel()
        model.analysisType(type: type)
        return model
    }
    
    func setupAnimator() {
        weak var weakSelf = self
        animator.setup(panGestureVC: self, transitionAction: {
            weakSelf?.back()
        }) { (fromVC, toVC, operation) -> Dictionary<String, Any>? in
            return ["duration" : "0.4", "delegate" : UUThirdDetailDismissAnimation()]
        }
    }
    
    func setupConstraints() {
        bg.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        whiteBoard.snp.remakeConstraints { (make) in
            make.height.equalTo(415)
            make.left.right.bottom.equalToSuperview()
        }
        view.layoutIfNeeded()
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
}

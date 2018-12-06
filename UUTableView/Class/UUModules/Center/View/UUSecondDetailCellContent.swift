//
//  UUSecondDetailCellContent.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class UUSecondDetailCellContent: UIView, UUSecondDetailCellViewDelegate {
    
    let cellHeader = UUSecondDetailCellHeader()
    var cells = [UUSecondDetailCellView]()
    var section = -1
    var headerHeight = 37
    var footerHeight = 20
    var model: UUSecondDetailSectionModel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect())
        
        backgroundColor = .lvWhite1
        addSubview(cellHeader)
    }
    
    func setupConstraints() {
        cellHeader.snp.remakeConstraints { (make) in
            make.height.equalTo(headerHeight)
            make.left.right.top.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        var temp: UIView?
        for (_, cell) in cells.enumerated() {
            cell.snp.remakeConstraints { (make) in
                make.top.equalTo(cellHeader.snp.bottom)
                if temp != nil {
                    make.left.equalTo(temp!.snp.right).offset(10)
                } else {
                    make.left.equalTo(16)
                }
                make.bottom.equalToSuperview().offset(-footerHeight)
            }
            temp = cell
        }
    }
    
    func setupData(data: Any?) {
        model = data as? UUSecondDetailSectionModel
        if let m = model {
            cellHeader.setupData(data: m)
            
            if let cellsModel = m.cellModel {
                setupCells(data: cellsModel)
            }
            setupConstraints()
        }
    }
    
    func setupCells(data: [UUSecondDetailCellModel]) {
        for (index, model) in data.enumerated() {
            let cell = UUSecondDetailCellView()
            cell.tag = index
            cell.delegte = self
            addSubview(cell)
            cells.append(cell)
            cell.setupData(data: model)
        }
    }
    
    func cellTapped(index: Int) {
        if let cellsModel = model?.cellModel {
            let m = cellsModel[index]
            let isSelected = m.isSelected ?? false
            m.isSelected = !isSelected
            let cell = cells[index]
            cell.setupSelection()
            if let allowsMultiple = model?.allowsMultiple, allowsMultiple {
                return
            }
            if let lastIndex = model?.lastIndex {
                if lastIndex != index {
                    let lastM = cellsModel[lastIndex]
                    lastM.isSelected = false
                    let lastCell = cells[lastIndex]
                    lastCell.setupSelection()
                }
            }
            model?.lastIndex = index
        }
    }
}

//
//  UUSecondDetailSectionModel.swift
//  UUTableView
//
//  Created by lhn on 2018/11/28.
//  Copyright © 2018年 UU. All rights reserved.
//

import UIKit

class UUSecondDetailSectionModel: Codable {
    var allowsMultiple: Bool?
    var lastIndex: Int?
    var title: String?
    var iconPath: String?
    var description: String?
    var cellModel: [UUSecondDetailCellModel]?
}

//
//  ColumnDescHeaderView.swift
//  GamerSky
//
//  Created by Insect on 2018/4/8.
//  Copyright © 2018年 QY. All rights reserved.
//

import UIKit

class ColumnDescHeaderView: UIView, NibLoadable {

    static let headerHeight: CGFloat = 35
    
    // MARK: - IBOutlet
    @IBOutlet private weak var descView: UIView!
    @IBOutlet private weak var descLabel: UILabel!
    
    // MARK: - public
    public var desc: String? {
        didSet {
            descLabel.text = desc
        }
    }
}

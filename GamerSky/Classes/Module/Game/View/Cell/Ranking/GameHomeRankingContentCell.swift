//
//  GameHomeRankingContentCell.swift
//  GamerSky
//
//  Created by InsectQY on 2018/4/10.
//Copyright © 2018年 engic. All rights reserved.
//

import UIKit

/// cell 之间间距
private let kItemMargin: CGFloat = 10
/// 左右间距
private let kEdge: CGFloat = 10
/// 每行最大列数
private let kMaxCol: CGFloat = 1
/// cell 宽度
private let kItemW: CGFloat = ScreenWidth * 0.8
/// cell 高度
private let kItemH: CGFloat = 60

class GameHomeRankingContentCell: UITableViewCell, NibReusable {

    static let cellHeight: CGFloat = 350
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var flowLayout: UICollectionViewFlowLayout!
    
    // MARK: - inital
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpCollectionView()
    }
    
    // MARK: - setUpCollectionView
    func setUpCollectionView() {
        
        flowLayout.itemSize = CGSize(width: kItemW, height: kItemH)
        flowLayout.sectionInset = UIEdgeInsetsMake(0, kEdge, 0, kEdge)
        flowLayout.minimumLineSpacing = kItemMargin
        flowLayout.minimumInteritemSpacing = kItemMargin
        collectionView.register(cellType: GameHomeRankingCell.self)
    }
}

// MARK: - UICollectionViewDataSource
extension GameHomeRankingContentCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: GameHomeRankingCell.self)
        return cell
    }
}

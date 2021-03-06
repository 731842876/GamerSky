//
//  GameHomeColumnContentCell.swift
//  GamerSky
//
//  Created by InsectQY on 2018/4/10.
//Copyright © 2018年 QY. All rights reserved.
//

import UIKit

class GameHomeColumnContentCell: TableViewCell, NibReusable {

    public static let cellHeight: CGFloat = GameHomeColumnContentFlowLayout.kItemW * 0.75
    
    // MARK: - public
    public var columnGame = [GameSpecialList]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - IBOutlet
    @IBOutlet private weak var flowLayout: GameHomeColumnContentFlowLayout!
    @IBOutlet private weak var collectionView: CollectionView! {
        
        didSet {
            
            collectionView.contentInset = UIEdgeInsets.init(top: 0, left: GameHomeColumnContentFlowLayout.kEdge, bottom: 0, right: GameHomeColumnContentFlowLayout.kEdge)
            collectionView.register(cellType: GameHomeColumnCell.self)
            collectionView.register(supplementaryViewType: GameRecommendFooterView.self, ofKind: UICollectionView.elementKindSectionFooter)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension GameHomeColumnContentCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return columnGame.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: GameHomeColumnCell.self)
        cell.column = columnGame[indexPath.item]
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension GameHomeColumnContentCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, for: indexPath, viewType: GameRecommendFooterView.self)
        footer.cornerRadius = 3
        return footer
    }
}

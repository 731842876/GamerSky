//
//  NavigationMap.swift
//  GamerSky
//
//  Created by QY on 2018/5/24.
//  Copyright © 2018年 QY. All rights reserved.
//

import URLNavigator
import URLMatcher

let navigator = NavigationMap.default

enum NavigationURL {
    
    /// 文章详情
    case contentDetail(Int?)
    /// 栏目详情
    case columnDetail(Bool?, Int?)
    /// 特色专题
    case gameColumn
    /// 排行榜
    case gameRankingPage
    /// 发售表
    case gameSellListPage
    /// 玩家点评
    case gameCommentPage
    /// 找游戏
    case gameList
    /// 原创
    case origin(ColumnList?)
    
    static func get(_ type: NavigationURL) -> String {
        
        switch type {
            
        case let .contentDetail(url):
            
            if let url = url {
               return "navigator://contentDetail/\(url)"
            }
            return "navigator://contentDetail/<int:ID>"
        case let .columnDetail(isHasSubList, nodeID):
            
            if let isHasSubList = isHasSubList, let nodeID = nodeID {
                return "navigator://columnDetail/\(isHasSubList)/\(nodeID)"
            }
            return "navigator://columnDetail/<isHasSubList>/<int:nodeID>"
        case .gameColumn:
            return "navigator://gameColumn"
        case .gameRankingPage:
            return "navigator://gameRankingPage"
        case .gameSellListPage:
            return "navigator://gameSellListPage"
        case .gameCommentPage:
            return "navigator://gameCommentPage"
        case .gameList:
            return "navigator://gameList"
        case let .origin(columnList):
            
            if var columnList = columnList {
                
                columnList.icon = ""
                return "navigator://origin/\(columnList.valueString)"
            }
            return "navigator://origin/<columnList>"
        }
    }
}

enum NavigationMap {
    
    static fileprivate let `default` = Navigator()
    
    static func initialize() {
        
        navigator.register(NavigationURL.get(.contentDetail(nil))) { url, values, context in
            
            guard let ID = values["ID"] as? Int else {return nil}
            return ContentDetailViewController(ID: ID)
        }
        
        navigator.register(NavigationURL.get(.columnDetail(nil, nil))) { (url, values, context) in
            
            guard let isHasSubList = values["isHasSubList"] as? String, let nodeID = values["nodeID"] as? Int else {return nil}
            let hasSubList = isHasSubList == "true" ? true : false
            return ColumnDetailViewController(isHasSubList: hasSubList, nodeID: nodeID)
        }

        navigator.register(NavigationURL.get(.gameColumn)) { (_, _, _) in
            return GameColumnViewController()
        }
        
        navigator.register(NavigationURL.get(.gameRankingPage)) { (_, _, _) in
            return GameRankingPageViewController()
        }
        
        navigator.register(NavigationURL.get(.gameSellListPage)) { (_, _, _) in
            return GameSellListPageViewController()
        }
        
        navigator.register(NavigationURL.get(.gameCommentPage)) { (_, _, _) in
            return GameCommentPageViewController()
        }
        
        navigator.register(NavigationURL.get(.gameList)) { (_, _, _) in
            return GameListViewController()
        }
        
        navigator.register(NavigationURL.get(.origin(nil))) { (url, values, context) in
            
            guard let columnList = values["columnList"] as? String, let columnListModel = columnList.toObject(ColumnList.self) else {return nil}
            return OriginalViewController(columnList: columnListModel)
        }
    }
}

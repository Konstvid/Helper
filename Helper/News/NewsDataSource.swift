//
//  NewsDataSource.swift
//  Helper
//
//  Created by Andrey on 14.04.2022.
//

import UIKit

class NewsDataSource: NSObject {
    
    var news = [News]()
}

extension NewsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsCell.reuseID(), for: indexPath
        ) as! NewsCell
        
        cell.setUp(news: news[indexPath.row])
    
        return cell
    }
}


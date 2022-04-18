//
//  NewsDataSource.swift
//  Helper
//
//  Created by Andrey on 14.04.2022.
//

import UIKit

class NewsDataSource: NSObject {
    
}

private let whereCell = Constants.whereNews 
private let dataCell = Constants.dataNews
private let topCell = Constants.topNews
private let newsCell = Constants.newsNews
private let authorCell = Constants.authorNews

extension NewsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         whereCell.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseID(), for: indexPath) as! NewsCell
        
        cell.setUp(whereLabel: Constants.whereNews,
                   dataLabel: Constants.dataNews,
                   topLabel: Constants.topNews,
                   newsLabel: Constants.newsNews,
                   authorLabel: Constants.authorNews)
        return cell
    }
}

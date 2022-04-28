//
//  NewsCell.swift
//  Helper
//
//  Created by Andrey on 14.04.2022.
//

import UIKit

class NewsCell: UITableViewCell {
     
    private let editionNewsLabel = UILabel()
    private let dateNewsLabel = UILabel()
    private let titleNewsLabel = UILabel()
    private let descriptionNewsLabel = UILabel()
    private let authorNewsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(news: News) {
        editionNewsLabel.text = news.source
        dateNewsLabel.text = news.publishedAt?.converted()
        titleNewsLabel.text = news.title
        descriptionNewsLabel.text = news.description
        authorNewsLabel.text = news.author
    }
    
    func configureUI() {
        
        selectionStyle = .none
        
        editionNewsLabel.font = UIFont(name: "ABosaNova", size: 10)
        editionNewsLabel.textAlignment = .left
        
        dateNewsLabel.font = UIFont(name: "ABosaNova", size: 10)
        dateNewsLabel.textAlignment = .right
        
        titleNewsLabel.font = UIFont(name: "ABosaNova", size: 20)
        titleNewsLabel.font = .boldSystemFont(ofSize: 20)
        titleNewsLabel.textAlignment = .left
        titleNewsLabel.numberOfLines = 2
        
        descriptionNewsLabel.font = UIFont(name: "ABosaNova", size: 20)
        descriptionNewsLabel.textAlignment = .left
        descriptionNewsLabel.numberOfLines = 3
        
        authorNewsLabel.font = UIFont(name: "ABosaNova", size: 10)
        authorNewsLabel.textAlignment = .left
        
        [
            editionNewsLabel,
            dateNewsLabel,
            titleNewsLabel,
            descriptionNewsLabel,
            authorNewsLabel
        ].forEach {
            contentView.addSubview($0)
        }
    }
    
    func configLayout() {
        
        editionNewsLabel.snp.makeConstraints {
            $0.top.leading.equalTo(20)
        }
        
        dateNewsLabel.snp.makeConstraints {
            $0.top.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        
        titleNewsLabel.snp.makeConstraints {
            $0.top.equalTo(editionNewsLabel.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        
        descriptionNewsLabel.snp.makeConstraints {
            $0.top.equalTo(titleNewsLabel.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        
        authorNewsLabel.snp.makeConstraints {
            $0.bottom.trailing.equalTo(-20)
            $0.leading.equalTo(20)
        }
    }
    
    class func reuseID() -> String {
        NSStringFromClass(NewsCell.self).components(separatedBy: ".").last!
    }
}

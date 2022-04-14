//
//  NewsContainerView.swift
//  Helper
//
//  Created by Andrey on 14.04.2022.
//

import UIKit

class NewsContainerView: UIView {
    
    let tableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseID())
    }
    
    func configureLayout() {
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

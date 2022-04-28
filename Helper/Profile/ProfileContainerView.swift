//
//  ProfileContainerView.swift
//  Helper
//
//  Created by Andrey on 10.05.2022.
//

import UIKit

class ProfileContainerView: UIView {
    
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
        tableView.register(
            ProfileIconCell.self, forCellReuseIdentifier: ProfileIconCell.reuseID()
        )
        tableView.register(
            ProfileOtherCell.self, forCellReuseIdentifier: ProfileOtherCell.reuseID()
        )
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }
    
    func configureLayout() {
        addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

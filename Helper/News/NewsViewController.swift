//
//  NewsViewController.swift
//  Helper
//
//  Created by Andrey on 30.01.2022.
//

import Foundation
import UIKit
import SnapKit

class NewsViewController: UIViewController {
    
    private let viewModel: NewsViewModelProtocol
    private let dataSource = NewsDataSource()
    private let newsContainerView = NewsContainerView()
    
    init(viewModel: NewsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configure()
        bind()
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        newsContainerView.tableView.delegate = self
        newsContainerView.tableView.dataSource = dataSource
        
        view.addSubview(newsContainerView)
        newsContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func bind() {
        viewModel.getNews { [weak self] news in
            DispatchQueue.main.async {
                self?.dataSource.news = news
                self?.newsContainerView.tableView.reloadData()
            }
        }
    }
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = dataSource.news[indexPath.row]
        viewModel.showNewsDescriptions(news: news)
    }
}

//
//  NewsDescriptionsViewController.swift
//  Helper
//
//  Created by Andrey on 28.04.2022.
//

import UIKit

class NewsDescriptionsViewController: UIViewController {
    
    private let viewModel: NewsDescriptionsViewModelProtocol
    private let newsDescriptionsContainerView = NewsDescriptionsContainerView()
    
    init(viewModel: NewsDescriptionsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configereUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configereUI() {
        view.addSubview(newsDescriptionsContainerView)
        newsDescriptionsContainerView.setUp(news: viewModel.news)
    }
    
    private func configureLayout() {
        newsDescriptionsContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

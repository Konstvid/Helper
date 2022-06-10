//
//  NewsDescriptionsContainerView.swift
//  Helper
//
//  Created by Andrey on 28.04.2022.
//

import UIKit
import SDWebImage

class NewsDescriptionsContainerView: UIView {
    
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let stackView = UIStackView()
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        configureUI()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been imple mented")
    }
    
    func setUp(news: News) {
        if let url = news.image {
            imageView.sd_setImage(with: URL(string: url)) { image, _, _, _  in
                if let _ = image {
                    self.stackView.insertArrangedSubview(self.imageView, at: 0)
                    self.stackView.setCustomSpacing(10, after: self.imageView)
                }
            }
        }
        
        if let title = news.title {
            titleLabel.text = title
            stackView.addArrangedSubview(titleLabel)
            stackView.setCustomSpacing(10, after: titleLabel)
        }
        
        if let description = news.description {
            descriptionLabel.text = description
            stackView.addArrangedSubview(descriptionLabel)
        }
    }
    
    private func configureUI() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        backgroundColor = .white
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.font = UIFont(name: "ABosaNova", size: 18)
    }
    
    private func configureLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        containerView.snp.makeConstraints {
            $0.edges.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints {
            $0.leading.top.equalTo(15)
            $0.trailing.bottom.equalTo(-15)
        }
    }
}

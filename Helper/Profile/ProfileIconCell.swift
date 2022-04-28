//
//  NewsCell.swift
//  Helper
//
//  Created by Andrey on 10.05.2022.
//

import UIKit

class ProfileIconCell: UITableViewCell {
    
    private let avatarImage = UIImageView()
    private let titleAvatar = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIndentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIndentifier)
        configureUI()
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(name: String) {
        avatarImage.backgroundColor = .blue
    }
    
    private func configureUI() {
        contentView.backgroundColor = .white
        
        avatarImage.layer.cornerRadius = 50
        avatarImage.clipsToBounds = true
        titleAvatar.text = Constants.profileTitle
        titleAvatar.font = UIFont(name: "ABosaNova", size: 20)
        
        [avatarImage, titleAvatar].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func configLayout() {
        avatarImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(20)
            $0.size.equalTo(100)
        }
        titleAvatar.snp.makeConstraints {
            $0.top.equalTo(avatarImage.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    class func reuseID() -> String {
        NSStringFromClass(ProfileIconCell.self).components(separatedBy: ".").last!
    }
}

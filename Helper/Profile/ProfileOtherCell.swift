//
//  ProfileOtherCell.swift
//  Helper
//
//  Created by Andrey on 12.05.2022.
//

import UIKit

class ProfileOtherCell: UITableViewCell {
    
    private var pictureView = UIImageView()
    
    private lazy var labelName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "ABosaNova", size: 18)
        return label
    }()
    
    private lazy var segmentControl: UISegmentedControl = {
        let segmentArray = ["°C", "℉"]
        let segmentControll = UISegmentedControl(items: segmentArray)
        return segmentControll
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        return datePicker
    }()
    
    private lazy var switchNotification: UISwitch = {
        let switchNotification = UISwitch()
        return switchNotification
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = .lightGray
        return separatorView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier reuseIndentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIndentifier)
        configureUI()
        configLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(fieldCell: Field)  {
        pictureView.image = UIImage(named: fieldCell.icon ?? "")
        pictureView.isHidden = false
        labelName.text = fieldCell.title
        
        switch fieldCell.type {
        case .city, .name:
            accessoryType = .disclosureIndicator
            makeSeparatorViewConstraints(trailing: 0)
        case .temperature:
            makeSegmentControll()
            makeSeparatorViewConstraints(trailing: -20)
        case .birthdate:
            makeDatePicker()
            makeSeparatorViewConstraints(trailing: -20)
        case .notification:
            makeSwitch()
            makeSeparatorViewConstraints(trailing: -20)
        default:
            break
        }
    }
    
    private func configureUI() {
        selectionStyle = .none
        [pictureView, labelName, separatorView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func configLayout() {
        pictureView.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(60)
        }
        
        labelName.snp.makeConstraints {
            $0.leading.equalTo(pictureView.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func makeSwitch() {
        contentView.addSubview(switchNotification)
        switchNotification.snp.makeConstraints {
            $0.trailing.equalTo(-20)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func makeSegmentControll() {
        segmentControl.selectedSegmentIndex = 0
        contentView.addSubview(segmentControl)
        segmentControl.snp.makeConstraints {
            $0.trailing.equalTo(-20)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(100)
        }
    }
    
    private func makeDatePicker() {
        contentView.addSubview(datePicker)
        datePicker.snp.makeConstraints {
            $0.trailing.equalTo(-20)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(150)
        }
    }
    
    private func makeSeparatorViewConstraints(trailing: CGFloat) {
        separatorView.snp.makeConstraints {
            $0.height.equalTo(0.5)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(trailing)
            $0.bottom.equalToSuperview()
        }
    }
    
    class func reuseID() -> String {
        NSStringFromClass(ProfileOtherCell.self).components(separatedBy: ".").last!
    }    
}

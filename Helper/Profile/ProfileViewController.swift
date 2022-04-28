//
//  ProfileViewController.swift
//  Helper
//
//  Created by Andrey on 30.01.2022.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    private let viewModel: ProfileViewModelProtocol
    private let dataSource = ProfileDataSource()
    private let profileConteinerView = ProfileContainerView()
    
    init(viewModel: ProfileViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configure()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        profileConteinerView.tableView.delegate = self
        profileConteinerView.tableView.dataSource = dataSource
        
        view.backgroundColor = .white
        view.addSubview(profileConteinerView)
        profileConteinerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func bind() {
        let fields = viewModel.getFields()
        dataSource.fields = fields
        profileConteinerView.tableView.reloadData()
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let section = ProfileDataSource.ProfileTableSection(rawValue: indexPath.section) else {
            return .leastNormalMagnitude
        }
        switch section {
        case .icon:
            return 180
        case .other:
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = ProfileDataSource.ProfileTableSection(
            rawValue: indexPath.section
        ) else { return }
        
        switch section {
        case .icon:
            viewModel.makeAlertController()
        case .other:
            let data = dataSource.fields[indexPath.row]
            if data.type == .city || data.type == .name {
                viewModel.selectedOtherCell(data: data)
            }
        }
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if var image = info[.originalImage] as? UIImage {
        }
        dismiss(animated: true,completion: nil)
    }
}

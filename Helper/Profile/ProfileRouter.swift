//
//  ProfileRouter.swift
//  Helper
//
//  Created by Andrey on 10.05.2022.
//

import UIKit

protocol ProfileRouterProtocol {
    func selectedOtherCell(data: Field)
    func makeAlertController()
}

class ProfileRouter: ProfileRouterProtocol {
    
    weak var moduleController: ProfileViewController?
    
    func selectedOtherCell(data: Field) {
        print(data)
    }
    
    func makeAlertController() {
        guard let moduleController = moduleController else { return }
        
        let alertController = UIAlertController(title: "Select image", message: "Select image from?", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default)
        let gallery = UIAlertAction(title: "Gallery", style: .default) { [weak self] _ in
            self?.openGallery()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        [camera, gallery, cancel].forEach {
            alertController.addAction($0)
        }
        
        moduleController.present(alertController, animated: true, completion: nil)
    }
    
    private func openGallery() {
        guard let moduleController = moduleController else { return }
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = moduleController
            imagePicker.modalPresentationStyle = .fullScreen
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            moduleController.present(imagePicker, animated: true, completion: nil)
        }
    }
}

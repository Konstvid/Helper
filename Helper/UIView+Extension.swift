//
//  UIView+Exxtension.swift
//  Helper
//
//  Created by Andrey on 10.03.2022.
//

import UIKit

extension UIView {
    
    func addSubViews(_ subViews: [UIView]) {
        subViews.forEach(addSubview(_:))
    }
}

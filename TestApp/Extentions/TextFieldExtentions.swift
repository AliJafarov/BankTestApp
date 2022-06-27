//
//  TextFieldExtentions.swift
//  TestApp
//
//  Created by Ali Jafarov on 24.06.22.
//

import UIKit


extension UITextField {
    
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 16, y: 16, width: 48, height: 32))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 64))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

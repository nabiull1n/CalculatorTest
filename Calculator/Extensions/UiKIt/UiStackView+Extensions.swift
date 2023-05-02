//
//  UiStackView+Extensions.swift
//  Calculator
//
//  Created by Денис Набиуллин on 25.12.2022.
//

import UIKit

extension UIStackView {
    
    convenience init(subviews: [UIView]) {
        self.init(arrangedSubviews: subviews)
        self.axis = .horizontal
        self.spacing = 1
        self.distribution = .fillEqually
    }
}


//
//  String + Extensions.swift
//  Calculator
//
//  Created by Денис Набиуллин on 03.01.2023.
//

import Foundation

extension String {
    var stringWithPoint: String {
        self.contains(".") ? self.replacingOccurrences(of: ".", with: ",") : self
    }
}

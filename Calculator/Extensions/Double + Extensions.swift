//
//  Double + Extensions.swift
//  Calculator
//
//  Created by Денис Набиуллин on 03.01.2023.
//

import Foundation

extension Double {
    var stringWithoutZeroFraction: String {
        truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

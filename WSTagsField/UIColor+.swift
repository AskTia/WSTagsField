//
//  UIColor+.swift
//  WSTagsField
//
//  Created by Damian Cesar on 6/13/19.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import Foundation

extension UIColor {

    static var backgroundLightGray: UIColor {
        return UIColor(hex: "#F9F9F9")
    }

    static var interventionTableLightBlue: UIColor {
        return UIColor(hex: "#EAEBF1")
    }

    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var colorString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if colorString.hasPrefix("#") {
            colorString.remove(at: colorString.startIndex)
        }

        if colorString.count != 6 {
            assertionFailure("Invalid HEX color")
        }

        var rgbValue: UInt32 = 0
        Scanner(string: colorString).scanHexInt32(&rgbValue)

        let r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

}

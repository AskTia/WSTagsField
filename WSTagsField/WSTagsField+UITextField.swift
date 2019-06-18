//
//  WSTagsField+UITextField.swift
//  WSTagsField
//
//  Created by Damian Cesar on 6/14/19.
//  Copyright © 2019 Whitesmith. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UITextFieldDelegate
extension WSTagsField: UITextFieldDelegate {

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldDelegate?.textFieldDidBeginEditing?(textField)

        unselectAllTagViewsAnimated(true)

        tableView.isHidden = false
        superview?.bringSubviewToFront(tableView)

//        tableView.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: 300)
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        textFieldDelegate?.textFieldDidEndEditing?(textField)
        //        typeaheadData = []
        tableView.isHidden = true
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if acceptTagOption == .return && onShouldAcceptTag?(self) ?? true {
            tokenizeTextFieldText()
            return true
        }

        if let textFieldShouldReturn = textFieldDelegate?.textFieldShouldReturn,
            textFieldShouldReturn(textField) {
            tokenizeTextFieldText()
            return true
        }

        return false
    }

    public func textField(_ textField: UITextField,
                          shouldChangeCharactersIn range: NSRange,
                          replacementString string: String) -> Bool {
        if acceptTagOption == .comma && string == "," && onShouldAcceptTag?(self) ?? true {
            tokenizeTextFieldText()
            return false
        }

        if acceptTagOption == .space && string == " " && onShouldAcceptTag?(self) ?? true {
            tokenizeTextFieldText()
            return false
        }

        return true
    }

}

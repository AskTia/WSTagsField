//
//  TextFieldWithTypeahead.swift
//  DrTia
//
//  Created by Damian Cesar on 6/13/19.
//  Copyright © 2019 Tia. All rights reserved.
//

import Foundation
import UIKit

class TextFieldWithTypeahead: UITextField {

    // MARK: - Properties

    /// Closure called when editing changed on text field.
    var onTextFieldEditingChanged: ((String?) -> Void)?

    /// Closure called when character is deleted from displayed text.
    var onDeleteBackwards: (() -> Void)?

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        addTarget(self, action: #selector(handleTextFieldEditingChanged), for: .editingChanged)
    }

    // MARK: - Overrides

    override func deleteBackward() {
        onDeleteBackwards?()
        super.deleteBackward()
    }

    // MARK: - Handlers

    @objc func handleTextFieldEditingChanged() {
        // Tokenize by csv and ensure there is data
        guard let stringArray = text?.components(separatedBy: ","),
            let unwrappedText = stringArray.last,
            unwrappedText.count > 0,
            unwrappedText != "" else {
//                typeaheadData = []
                return
        }
        // Why does this only get the end of the string?
        // Because if there's a comma that kinda of signifies its a different string.
        // So that's what that logic is for.
        // This sends it back up the chain because it needs to update the table view
        // typeahead list.
        // Generally the code to update the typeaheadList data is expected here.
        onTextFieldEditingChanged?(unwrappedText)
    }

}

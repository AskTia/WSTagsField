//
//  WSTextField.swift
//  Tia
//
//  Created by Damian Cesar on 6/13/19.
//  Copyright © 2019 Tia. All rights reserved.
//

import Foundation

public class WSTextField: UITextField {

    /// Closure called when character is deleted from displayed text.
    public var onDeleteBackwards: (() -> Void)?

    public override func deleteBackward() {
        onDeleteBackwards?()
        super.deleteBackward()
    }

    public override var canBecomeFirstResponder: Bool {
        return true
    }

}

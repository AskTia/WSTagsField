//
//  WSTag.swift
//  Whitesmith
//
//  Created by Ricardo Pereira on 12/05/16.
//  Copyright © 2016 Whitesmith. All rights reserved.
//

import Foundation

public struct WSTag: Hashable {

    /// String to display
    public let text: String
    /// The value to return mapped to the text string e.g. an ICD or other medical code
    public let value: String?

    public init(text: String, value: String? = nil) {
        self.text = text
        self.value = value
    }

    public func equals(_ other: WSTag) -> Bool {
        return self.text == other.text
    }

}

public func == (lhs: WSTag, rhs: WSTag) -> Bool {
    return lhs.equals(rhs)
}

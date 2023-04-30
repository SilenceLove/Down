//
//  BlockBackgroundColorAttribute.swift
//  Down
//
//  Created by John Nguyen on 11.08.19.
//  Copyright © 2016-2019 Down. All rights reserved.
//

#if !os(watchOS) && !os(Linux)

#if canImport(UIKit)

import UIKit

#elseif canImport(AppKit)

import AppKit

#endif

public struct BlockBackgroundColorAttribute {

    // MARK: - Properties

    var color: DownColor
    var inset: CGPoint
    var cornerInset: CGPoint
    var cornerRadius: CGFloat
}

extension NSAttributedString.Key {

    static let blockBackgroundColor = NSAttributedString.Key("blockBackgroundColor")

}

#endif

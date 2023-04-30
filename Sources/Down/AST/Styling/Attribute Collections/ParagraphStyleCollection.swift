//
//  ParagraphStyleCollection.swift
//  Down
//
//  Created by John Nguyen on 27.07.19.
//  Copyright © 2016-2019 Down. All rights reserved.
//

#if !os(watchOS) && !os(Linux)

#if canImport(UIKit)

import UIKit

#elseif canImport(AppKit)

import AppKit

#endif

public protocol ParagraphStyleCollection {

    var heading1: NSParagraphStyle { get }
    var heading2: NSParagraphStyle { get }
    var heading3: NSParagraphStyle { get }
    var heading4: NSParagraphStyle { get }
    var heading5: NSParagraphStyle { get }
    var heading6: NSParagraphStyle { get }
    var body: NSParagraphStyle { get }
    var code: NSParagraphStyle { get }

}

public struct StaticParagraphStyleCollection: ParagraphStyleCollection {

    // MARK: - Properties

    public var heading1: NSParagraphStyle
    public var heading2: NSParagraphStyle
    public var heading3: NSParagraphStyle
    public var heading4: NSParagraphStyle
    public var heading5: NSParagraphStyle
    public var heading6: NSParagraphStyle
    public var body: NSParagraphStyle
    public var code: NSParagraphStyle

    // MARK: - Life cycle

    public init() {
        let headingStyle = NSMutableParagraphStyle()
        headingStyle.paragraphSpacing = 0

        let bodyStyle = NSMutableParagraphStyle()
        bodyStyle.paragraphSpacingBefore = 4
        bodyStyle.paragraphSpacing = 0
        bodyStyle.lineSpacing = 4

        let codeStyle = NSMutableParagraphStyle()
        codeStyle.paragraphSpacingBefore = 0
        codeStyle.paragraphSpacing = 0
        codeStyle.lineSpacing = 4

        heading1 = headingStyle
        heading2 = headingStyle
        heading3 = headingStyle
        heading4 = headingStyle
        heading5 = headingStyle
        heading6 = headingStyle
        body = bodyStyle
        code = codeStyle
    }

}

#endif

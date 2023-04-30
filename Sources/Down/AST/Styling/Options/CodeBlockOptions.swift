//
//  CodeBlockOptions.swift
//  Down
//
//  Created by John Nguyen on 12.08.19.
//  Copyright © 2016-2019 Down. All rights reserved.
//

#if !os(watchOS) && !os(Linux)

#if canImport(UIKit)

import UIKit

#elseif canImport(AppKit)

import AppKit

#endif

public struct CodeBlockOptions {

    // MARK: - Properties
    
    public var inset: CGPoint
    
    public var containerInset: CGPoint
    public var cornerRadius: CGFloat

    // MARK: - Life cycle

    public init(
        inset: CGPoint = .init(x: 0, y: 12),
        containerInset: CGPoint = .init(x: 12, y: 12),
        cornerRadius: CGFloat = 8
    ) {
        self.inset = inset
        self.containerInset = containerInset
        self.cornerRadius = cornerRadius
    }

}
#endif

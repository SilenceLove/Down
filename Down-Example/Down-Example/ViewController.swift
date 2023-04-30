//
//  ViewController.swift
//  Down-Example
//
//  Created by Keaton Burleson on 7/1/17.
//  Copyright © 2016-2019 Down. All rights reserved.
//

import UIKit
import Down
import Highlightr

class CodeStyler: DownStyler {
    
    override func highlightCode(_ code: String) -> NSMutableAttributedString {
        guard let highlightr = Highlightr(),
              highlightr.setTheme(to: "xcode"),
              let result = highlightr.highlight(code) else {
            return .init(string: code)
        }
        
        return .init(attributedString: result)
    }
    
    override func styleGenericCodeBlock(in str: NSMutableAttributedString) {
        var attributes = codeBlockAttributes
        attributes[.foregroundColor] = nil
        str.addAttributes(
            attributes,
            range: NSRange(location: 0, length: str.length))
    }
    
    override func styleGenericInlineCode(in str: NSMutableAttributedString) {
        var attributes = codeAttributes
        attributes[.foregroundColor] = nil
        str.addAttributes(
            attributes,
            range: NSRange(location: 0, length: str.length))
    }
}

final class ViewController: UIViewController {
    
    lazy var textView: DownTextView = {
        let textView = DownTextView(
            frame: .init(x: 16, y: 100, width: view.frame.width - 32, height: view.frame.height - 100),
            options: .hardBreaks,
            styler: CodeStyler()
        )
        textView.text = text.markdownLineBreak
        textView.delegate = self
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        renderDownInWebView()
    }
    
}

extension ViewController: UITextViewDelegate {
    var text: String {
//        "test\n\ntest"
        "周报\n\n本周是 2021 年 10 月第一周，以下是我的工作总结：\n\n1. 项目进展\n\n本周，我主要负责公司的一个新项目的开发工作。我和我的团队合作，完成了项目的需求分析和设计阶段，并开始了编码工作。我们使用了最新的技术和工具，例如 React、Node.js、MongoDB 等，以确保项目的高效和可靠性。目前，我们已经完成了项目的一部分功能，并计划在下周继续开发。\n\n2. 学习进展\n\n本周，我继续学习了一些新的技术和知识。我花了一些时间学习了 React 和 Node.js 的基础知识，并使用它们来开发我的项目。此外，我还学习了一些关于数据库和数据结构的知识，以便更好地设计和优化我的应用程序。我还参加了一些线上技术交流会议，与其他开发人员分享了我的经验和想法。\n\n3. 问题与挑战\n\n在本周的工作中，我们遇到了一些问题和挑战。其中一个主要的问题是在项目的开发过程中出现了一些 bug 和错误，需要花费一些时间进行调试和修复。另外，我们还需要更好地协调和沟通，以确保项目的进度和质量。\n\n4. 下周计划\n\n在下周，我计划继续完成我的项目，并尽可能多地添加新功能和修复已知的问题。我还计划参加一些技术会议和培训课程，以继续学习和发展我的技能。此外，我还将与我的团队保持紧密联系，以确保项目的进度和质量。"
//          #"""
//            This screen demonstrates how you can integrate a 3rd party library
//            to render syntax-highlighted code blocks.
//
//            First, we create a type that conforms to `CodeSyntaxHighlighter`,
//            using [John Sundell's Splash](https://github.com/JohnSundell/Splash)
//            to highlight code blocks.
//
//            ```swift
//            import MarkdownUI
//            import Splash
//            import SwiftUI
//
//            struct SplashCodeSyntaxHighlighter: CodeSyntaxHighlighter {
//              private let syntaxHighlighter: SyntaxHighlighter<TextOutputFormat>
//
//              init(theme: Splash.Theme) {
//                self.syntaxHighlighter = SyntaxHighlighter(format: TextOutputFormat(theme: theme))
//              }
//
//              func highlightCode(_ content: String, language: String?) -> Text {
//                guard language?.lowercased() == "swift" else {
//                  return Text(content)
//                }
//
//                return self.syntaxHighlighter.highlight(content)
//              }
//            }
//
//            extension CodeSyntaxHighlighter where Self == SplashCodeSyntaxHighlighter {
//              static func splash(theme: Splash.Theme) -> Self {
//                SplashCodeSyntaxHighlighter(theme: theme)
//              }
//            }
//            ```
//
//            Then we configure the `Markdown` view to use the `SplashCodeSyntaxHighlighter`
//            that we just created.
//
//            ```swift
//            var body: some View {
//              Markdown(self.content)
//                .markdownCodeSyntaxHighlighter(.splash(theme: .sunset(withFont: .init(size: 16))))
//            }
//            ```
//            """#
    }
    func renderDownInWebView() {
        view.addSubview(textView)
    }
}
extension String {
    func range(from nsRange: NSRange) -> Range<String.Index>? {
        guard
            let from16 = utf16.index(utf16.startIndex, offsetBy: nsRange.location, limitedBy: utf16.endIndex),
            let to16 = utf16.index(from16, offsetBy: nsRange.length, limitedBy: utf16.endIndex),
            let from = String.Index(from16, within: self),
            let to = String.Index(to16, within: self)
            else { return nil }
        return from ..< to
    }
    
    var markdownLineBreak: String {
        return self.replacingOccurrences(of: "\n", with: "  \n")
    }
}

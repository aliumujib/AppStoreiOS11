//
//  ReadMoreTextView.swift
//  ReadMoreTextView
//
//  Created by Ilya Puchka on 06.04.15.
//  Copyright (c) 2015 - 2016 Ilya Puchka. All rights reserved.
//

import UIKit

/**
 UITextView subclass that adds "read more"/"read less" capabilities.
 Disables scrolling and editing, so do not set these properties to true.
 */
@IBDesignable
public class ReadMoreTextView: UITextView {
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        readMoreTextPadding = .zero
        readLessTextPadding = .zero
        super.init(frame: frame, textContainer: textContainer)
        setupDefaults()
    }
    
    public convenience init(frame: CGRect) {
        self.init(frame: frame, textContainer: nil)
    }
    
    public convenience init() {
        self.init(frame: CGRect.zero, textContainer: nil)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        readMoreTextPadding = .zero
        readLessTextPadding = .zero
        super.init(coder: aDecoder)
        setupDefaults()
    }
    
    func setupDefaults() {
        let defaultReadMoreText = NSLocalizedString("ReadMoreTextView.readMore", value: "more", comment: "")
        let attributedReadMoreText = NSMutableAttributedString(string: "... ")

        readMoreTextPadding = .zero
        readLessTextPadding = .zero
        isScrollEnabled = false
        isEditable = false
        
        let attributedDefaultReadMoreText = NSAttributedString(string: defaultReadMoreText, attributes: [
            NSForegroundColorAttributeName: UIColor.lightGray,
            NSFontAttributeName: font ?? UIFont.systemFont(ofSize: 14)
        ])
        attributedReadMoreText.append(attributedDefaultReadMoreText)
        self.attributedReadMoreText = attributedReadMoreText
    }
    
    /**Block to be invoked when text view changes its content size.*/
    public var onSizeChange: (ReadMoreTextView)->() = { _ in }
    
    /**
     The maximum number of lines that the text view can display. If text does not fit that number it will be trimmed.
     Default is `0` which means that no text will be never trimmed.
     */
    @IBInspectable
    public var maximumNumberOfLines: Int = 0 {
        didSet {
            _originalMaximumNumberOfLines = maximumNumberOfLines
            setNeedsLayout()
        }
    }
    
    /**The text to trim the original text. Setting this property resets `attributedReadMoreText`.*/
    @IBInspectable
    public var readMoreText: String? {
        get {
            return attributedReadMoreText?.string
        }
        set {
            if let text = newValue {
                attributedReadMoreText = attributedStringWithDefaultAttributes(from: text)
            } else {
                attributedReadMoreText = nil
            }
        }
    }
    
    /**The attributed text to trim the original text. Setting this property resets `readMoreText`.*/
    public var attributedReadMoreText: NSAttributedString? {
        didSet {
            setNeedsLayout()
        }
    }
    
    /**
     The text to append to the original text when not trimming.
     */
    @IBInspectable
    public var readLessText: String? {
        get {
            return attributedReadLessText?.string
        }
        set {
            if let text = newValue {
                attributedReadLessText = attributedStringWithDefaultAttributes(from: text)
            } else {
                attributedReadLessText = nil
            }
        }
    }
    
    /**
     The attributed text to append to the original text when not trimming.
     */
    public var attributedReadLessText: NSAttributedString? {
        didSet {
            setNeedsLayout()
        }
    }
    
    /**
     A Boolean that controls whether the text view should trim it's content to fit the `maximumNumberOfLines`.
     The default value is `false`.
     */
    @IBInspectable
    public var shouldTrim: Bool = false {
        didSet {
            guard shouldTrim != oldValue else { return }
            
            if shouldTrim {
                maximumNumberOfLines = _originalMaximumNumberOfLines
            } else {
                let _maximumNumberOfLines = maximumNumberOfLines
                maximumNumberOfLines = 0
                _originalMaximumNumberOfLines = _maximumNumberOfLines
            }
            cachedIntrinsicContentHeight = nil
            setNeedsLayout()
        }
    }
    
    /**
     Force to update trimming on the next layout pass. To update right away call `layoutIfNeeded` right after.
    */
    public func setNeedsUpdateTrim() {
        _needsUpdateTrim = true
        setNeedsLayout()
    }
    
    /**
     A padding around "read more" text to adjust touchable area.
     If text is trimmed touching in this area will change `shouldTream` to `false` and remove trimming.
     That will cause text view to change it's content size. Use `onSizeChange` to adjust layout on that event.
     */
    public var readMoreTextPadding: UIEdgeInsets
    
    /**
     A padding around "read less" text to adjust touchable area.
     If text is not trimmed and `readLessText` or `attributedReadLessText` is set touching in this area
     will change `shouldTream` to `true` and cause trimming. That will cause text view to change it's content size.
     Use `onSizeChange` to adjust layout on that event.
     */
    public var readLessTextPadding: UIEdgeInsets
    
    public override var text: String! {
        didSet {
            if let text = text {
                _originalAttributedText = attributedStringWithDefaultAttributes(from: text)
            } else {
                _originalAttributedText = nil
            }
        }
    }
    
    public override var attributedText: NSAttributedString! {
        willSet {
            if #available(iOS 9.0, *) { return }
            //on iOS 8 text view should be selectable to properly set attributed text
            if newValue != nil {
                isSelectable = true
            }
        }
        didSet {
            _originalAttributedText = attributedText
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        if _needsUpdateTrim {
            //reset text to force update trim
            attributedText = _originalAttributedText
            _needsUpdateTrim = false
        }
        needsTrim() ? showLessText() : showMoreText()
    }
    
    public override var intrinsicContentSize : CGSize {
        textContainer.size = CGSize(width: bounds.size.width, height: CGFloat.greatestFiniteMagnitude)
        var intrinsicContentSize = layoutManager.boundingRect(forGlyphRange: layoutManager.glyphRange(for: textContainer), in: textContainer).size
        intrinsicContentSize.width = UIViewNoIntrinsicMetric
        intrinsicContentSize.height += (textContainerInset.top + textContainerInset.bottom)
        intrinsicContentSize.height = ceil(intrinsicContentSize.height)
        return intrinsicContentSize
    }
    
    private var intrinsicContentHeight: CGFloat {
        return intrinsicContentSize.height
    }
    
    private var cachedIntrinsicContentHeight: CGFloat?
    
    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        return hitTest(pointInGliphRange: point, event: event) { _ in
            guard pointIsInReadMoreOrReadLessTextRange(point: point) != nil else { return nil }
            return self
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let point = touches.first?.location(in: self) {
            shouldTrim = pointIsInReadMoreOrReadLessTextRange(point: point) ?? shouldTrim
        }
        super.touchesEnded(touches, with: event)
    }
    
    //MARK: Private methods
    
    private var _needsUpdateTrim = false
    private var _originalMaximumNumberOfLines: Int = 0
    private var _originalAttributedText: NSAttributedString!
    private var _originalTextLength: Int {
        get {
            return _originalAttributedText?.length ?? 0
        }
    }
    
    private func attributedStringWithDefaultAttributes(from text: String) -> NSAttributedString {
        return NSAttributedString(string: text, attributes: [
            NSFontAttributeName: font ?? UIFont.systemFont(ofSize: 14),
            NSForegroundColorAttributeName: textColor ?? UIColor.black
        ])
    }
    
    private func needsTrim() -> Bool {
        return shouldTrim && readMoreText != nil
    }
    
    private func showLessText() {
        if let readMoreText = readMoreText, text.hasSuffix(readMoreText) { return }
        
        shouldTrim = true
        textContainer.maximumNumberOfLines = maximumNumberOfLines
        
        layoutManager.invalidateLayout(forCharacterRange: layoutManager.characterRangeThatFits(textContainer: textContainer), actualCharacterRange: nil)
        textContainer.size = CGSize(width: bounds.size.width, height: CGFloat.greatestFiniteMagnitude)

        if let text = attributedReadMoreText {
            let range = rangeToReplaceWithReadMoreText()
            guard range.location != NSNotFound else { return }

            textStorage.replaceCharacters(in: range, with: text)
        }
        
        invalidateIntrinsicContentSize()
        invokeOnSizeChangeIfNeeded()
    }
    
    private func showMoreText() {
        if let readLessText = readLessText, text.hasSuffix(readLessText) { return }
        
        shouldTrim = false
        textContainer.maximumNumberOfLines = 0

        if let originalAttributedText = _originalAttributedText?.mutableCopy() as? NSMutableAttributedString {
            attributedText = _originalAttributedText
            let range = NSRange(location: 0, length: text.length)
            if let attributedReadLessText = attributedReadLessText {
                originalAttributedText.append(attributedReadLessText)
            }
            textStorage.replaceCharacters(in: range, with: originalAttributedText)
        }
        
        invalidateIntrinsicContentSize()
        invokeOnSizeChangeIfNeeded()
    }
    
    private func invokeOnSizeChangeIfNeeded() {
        if let cachedIntrinsicContentHeight = cachedIntrinsicContentHeight {
            if intrinsicContentHeight != cachedIntrinsicContentHeight {
                self.cachedIntrinsicContentHeight = intrinsicContentHeight
                onSizeChange(self)
            }
        } else {
            self.cachedIntrinsicContentHeight = intrinsicContentHeight
            onSizeChange(self)
        }
    }
    
    private func rangeToReplaceWithReadMoreText() -> NSRange {
        let rangeThatFitsContainer = layoutManager.characterRangeThatFits(textContainer: textContainer)
        if NSMaxRange(rangeThatFitsContainer) == _originalTextLength {
            return NSMakeRange(NSNotFound, 0)
        }
        else {
            let lastCharacterIndex = characterIndexBeforeTrim(range: rangeThatFitsContainer)
            if lastCharacterIndex > 0 {
                return NSMakeRange(lastCharacterIndex, textStorage.length - lastCharacterIndex)
            }
            else {
                return NSMakeRange(NSNotFound, 0)
            }
        }
    }
    
    private func characterIndexBeforeTrim(range rangeThatFits: NSRange) -> Int {
        if let text = attributedReadMoreText {
            let readMoreBoundingRect = attributedReadMoreText(text: text, boundingRectThatFits: textContainer.size)
            let lastCharacterRect = layoutManager.boundingRectForCharacterRange(range: NSMakeRange(NSMaxRange(rangeThatFits)-1, 1), inTextContainer: textContainer)
            var point = lastCharacterRect.origin
            point.x = textContainer.size.width - ceil(readMoreBoundingRect.size.width)
            let glyphIndex = layoutManager.glyphIndex(for: point, in: textContainer, fractionOfDistanceThroughGlyph: nil)
            let characterIndex = layoutManager.characterIndexForGlyph(at: glyphIndex)
            return characterIndex - 1
        } else {
            return NSMaxRange(rangeThatFits) - readMoreText!.length
        }
    }
    
    private func attributedReadMoreText(text aText: NSAttributedString, boundingRectThatFits size: CGSize) -> CGRect {
        let textContainer = NSTextContainer(size: size)
        let textStorage = NSTextStorage(attributedString: aText)
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        let readMoreBoundingRect = layoutManager.boundingRectForCharacterRange(range: NSMakeRange(0, text.length), inTextContainer: textContainer)
        return readMoreBoundingRect
    }
    
    private func readMoreTextRange() -> NSRange {
        var readMoreTextRange = rangeToReplaceWithReadMoreText()
        if readMoreTextRange.location != NSNotFound {
            readMoreTextRange.length = readMoreText!.length + 1
        }
        return readMoreTextRange
    }
    
    private func readLessTextRange() -> NSRange {
        return NSRange(location: _originalTextLength, length: readLessText!.length + 1)
    }

    private func pointIsInReadMoreOrReadLessTextRange(point aPoint: CGPoint) -> Bool? {
        if needsTrim() && pointIsInTextRange(point: aPoint, range: readMoreTextRange(), padding: readMoreTextPadding) {
            return false
        } else if readLessText != nil && pointIsInTextRange(point: aPoint, range: readLessTextRange(), padding: readLessTextPadding) {
            return true
        }
        return nil
    }

}

extension String {
    var length: Int {
        return characters.count
    }
}

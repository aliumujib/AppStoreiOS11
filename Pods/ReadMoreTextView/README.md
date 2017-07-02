[![Version](https://img.shields.io/cocoapods/v/ReadMoreTextView.svg?style=flat)](http://cocoapods.org/pods/ReadMoreTextView)
[![License](https://img.shields.io/cocoapods/l/ReadMoreTextView.svg?style=flat)](http://cocoapods.org/pods/ReadMoreTextView)
[![Platform](https://img.shields.io/cocoapods/p/ReadMoreTextView.svg?style=flat)](http://cocoapods.org/pods/ReadMoreTextView)
[![Swift Version](https://img.shields.io/badge/Swift-3.1-F16D39.svg?style=flat)](https://developer.apple.com/swift)

# ReadMoreTextView

UITextView subclass with "read more"/"read less" capabilities and UITextView extensions to handle touches in characters range.

![](screenshot.gif)

##Usage

	let textView = ReadMoreTextView()

	textView.text = "Lorem ipsum dolor ..."

	textView.shouldTrim = true
	textView.maximumNumberOfLines = 4
	textView.attributedReadMoreText = NSAttributedString(string: "... Read more")
	textView.attributedReadLessText = NSAttributedString(string: " Read less")
	
##Custom touches handling.

This project also includes few helper methods that will allow you to detect and handle touches in arbitrary text ranges. This way you can for exapmle implement custom links handling in your `UITextView` subclass. `ReadMoreTextView` uses these methods itself to detect touches in "read more"/"read less" action areas.

```swift

extension UITextView {

	/**
	 Calls provided `test` block if point is in gliph range and there is no link detected at this point.
	 Will pass in to `test` a character index that corresponds to `point`.
	 Return `self` in `test` if text view should intercept the touch event or `nil` otherwise.
	 */
	public func hitTest(pointInGliphRange:event:test:) -> UIView?
	
	/**
	 Returns true if point is in text bounding rect adjusted with padding.
	 Bounding rect will be enlarged with positive padding values and decreased with negative values.
	 */
	public func pointIsInTextRange(point:range:padding:) -> Bool
	
	/**
	 Returns index of character for glyph at provided point. Returns `nil` if point is out of any glyph.
	 */
	public func charIndexForPointInGlyphRect(point:) -> Int?
	
}

extension NSLayoutManager {

    /**
     Returns characters range that completely fits into container.
     */
    public func characterRangeThatFits(textContainer:) -> NSRange
    
    /**
     Returns bounding rect in provided container for characters in provided range.
     */
    public func boundingRectForCharacterRange(range:inTextContainer:) -> CGRect

}

```


##Installation

Available in [Cocoa Pods](https://github.com/CocoaPods/CocoaPods):

` pod 'ReadMoreTextView' `

##License

ReadMoreTextView is available under the [MIT license](http://www.opensource.org/licenses/mit-license.php).

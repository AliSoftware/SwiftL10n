// Generated using SwiftGen, by O.Halligon — https://github.com/AliSoftware/SwiftGen

import UIKit

extension UIFont {

	enum Name {
		case Body
		case Header1
		case Header2

		func fontName() -> String {
			switch self {
			case .Body
				return "Helvetica"
			case .Header1
				return "Helvetica"
			case .Header2
				return "Helvetica"
			}
		}

		func fontSize() -> CGFloat {
			switch self {
			case .Body
				return "12"
			case .Header1
				return "18"
			case .Header2
				return "16"
			}
		}

	}

	convenience init(named name: Name) {
		self.init(name: name.fontName(), size:name.fontSize())
	}
}

extension UIFont {

	enum  {
		case Body(fontName: "Helvetica", fontSize:12)
		case Header1(fontName: "Helvetica", fontSize:18)
		case Header2(fontName: "Helvetica", fontSize:16)
	}

	convenience init(named name: Name) {
		self.init(name: name.rawValue.fontName, size:name.rawValue.fontSize)
	}
}


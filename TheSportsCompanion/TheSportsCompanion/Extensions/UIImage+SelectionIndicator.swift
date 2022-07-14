//
//  UIImage+SelectionIndicator.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 11/07/2022.
//

import UIKit

extension UIImage {
    func createSelectionIndicator(color: UIColor, size: CGSize, lineHeight: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(origin: CGPoint(x: 0,y :size.height - lineHeight), size: CGSize(width: size.width, height: lineHeight)))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

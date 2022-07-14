//
//  ViewUtils.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 11/07/2022.
//

import Foundation
import UIKit

class ViewUtils {
    static func customizeLargeTitle(text: String, width: CGFloat) -> UILabel {
        let tlabel = UILabel(frame: CGRect(x: 0, y: 0, width: width - 30, height: 40))
        tlabel.text = text
        tlabel.textColor = UIColor.white
        tlabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        tlabel.backgroundColor = UIColor.clear
        tlabel.adjustsFontSizeToFitWidth = true
        tlabel.textAlignment = .left
        return tlabel
    }
}

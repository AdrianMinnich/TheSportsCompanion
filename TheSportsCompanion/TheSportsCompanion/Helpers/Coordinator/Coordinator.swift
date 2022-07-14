//
//  Coordinator.swift
//  TheSportsCompanion
//
//  Created by Adrian Minnich on 10/07/2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: CoordinatedNavigationController { get set }
}

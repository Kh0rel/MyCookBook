//
//  RootWireframe.swift
//  MyCookBook
//
//  Created by Guillaume Chieb bouares on 29/12/2017.
//  Copyright © 2017 Guillaume Chieb bouares. All rights reserved.
//

import Foundation
import UIKit

class RootWireframe {
    public func presentTabBarView(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = BaseViewController()
    }
}

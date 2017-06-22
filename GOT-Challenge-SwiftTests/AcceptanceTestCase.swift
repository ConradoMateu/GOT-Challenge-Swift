//
//  AcceptanceTestCase.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 18/06/2017.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation
import KIF

class AcceptanceTestCase: KIFTestCase {

    fileprivate var originalRootViewController: UIViewController?
    fileprivate var rootViewController: UIViewController? {
        get {
            return UIApplication.shared.keyWindow?.rootViewController
        }

        set(newRootViewController) {
            UIApplication.shared.keyWindow?.rootViewController = newRootViewController
        }
    }

    override func tearDown() {
        super.tearDown()
        if let originalRootViewController = originalRootViewController {
            rootViewController = originalRootViewController
        }
    }

    func present(viewController: UIViewController) {
        originalRootViewController = rootViewController
        rootViewController = viewController
    }
}

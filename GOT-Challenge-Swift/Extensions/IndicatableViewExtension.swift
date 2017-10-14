//
//  IndicatableViewExtension.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 19/04/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation
import PKHUD

extension IndicatableView where Self: UIViewController {

    func showActivityIndicator() {
        HUD.show(.progress)
        accessibilityLabel = "LoadingView"
    }

    func hideActivityIndicator() {
        HUD.hide()
        accessibilityLabel = "HideView"
    }

}

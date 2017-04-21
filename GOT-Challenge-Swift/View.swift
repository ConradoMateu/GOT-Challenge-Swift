//
//  View.swift
//  GOT-Challenge-Swift
//
//  Created by Conrado Mateu Gisbert on 19/04/17.
//  Copyright © 2017 conradomateu. All rights reserved.
//

import Foundation

protocol ReusableView: class {}

protocol NibLoadableView: class { }

protocol IndicatableView: class {
    func showActivityIndicator()
    func hideActivityIndicator()
}

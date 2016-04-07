//
//  PopUpViewController.swift
//  MyNewCar
//
//  Created by ProjectHeena on 4/5/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit


class PopupViewController: UIViewController
{
    override var preferredContentSize: CGSize {
        get {
            return CGSize(width: 300, height: 275)
        }
        set {
            super.preferredContentSize = newValue
        }
    }
}

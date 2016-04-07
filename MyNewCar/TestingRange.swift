//
//  TestingRange.swift
//  MyNewCar
//
//  Created by ProjectHeena on 4/5/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class TestingRange: UIViewController
{
    let rangeSlider1 = RangeSlider(frame: CGRectZero)
    let rangeSlider2 = RangeSlider(frame: CGRectZero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        rangeSlider2.trackHighlightTintColor = UIColor.redColor()
        rangeSlider2.curvaceousness = 0.0
        
        view.addSubview(rangeSlider1)
        view.addSubview(rangeSlider2)
        
        rangeSlider1.addTarget(self, action: "rangeSliderValueChanged:", forControlEvents: .ValueChanged)
        
        
        let rangeSlider = RangeSlider(frame: CGRectZero)
        
        
        view.addSubview(rangeSlider)
        rangeSlider.addTarget(self, action: "rangeSliderValueChanged:",
                              forControlEvents: .ValueChanged)
    }
    
    override func viewDidLayoutSubviews() {
        let margin: CGFloat = 20.0
        let width = view.bounds.width - 2.0 * margin
        rangeSlider1.frame = CGRect(x: margin, y: margin + topLayoutGuide.length + 100,
                                    width: width, height: 31.0)
        rangeSlider2.frame = CGRect(x: margin + 20, y: 5 * margin + topLayoutGuide.length + 100,
                                    width: width - 40, height: 40)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func rangeSliderValueChanged(rangeSlider: RangeSlider) {
        print("Range slider value changed: (\(rangeSlider.lowerValue) , \(rangeSlider.upperValue))")
    }

}

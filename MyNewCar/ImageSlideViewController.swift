//not working
//  ImageSlideViewController.swift
//  MyNewCar
//
//  Created by ProjectHeena on 4/2/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class ImageSlideViewController: UIViewController {

    @IBOutlet weak var slidingImage: UIImageView!
    
    var imageFile: String!
    var imageIndex : Int!
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        
        let url = NSURL(string: imageFile)
            
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0))
        {
                
            print(url)
            let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
                
            print("Is Converted data" , data)
                
            self.slidingImage.image = UIImage(data: data!)
                
            dispatch_async(dispatch_get_main_queue(), {
                });
            }
            //self.slidingImage.image = UIImage(named: imageFile)
            
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

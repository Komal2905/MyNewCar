//
//  MenuViewController.swift
//  MyNewCar
//
// Purpose : This File List all the menu for side bar
//  Created by ProjectHeena on 4/4/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    // outlet for profilePic
    @IBOutlet weak var profileImageView: UIImageView!

    
    @IBOutlet weak var sidebarIcon: UIImageView!
    // array for Side Bar
    
    var sideBarOption = ["HOME","HOT DEALS", "COMPARE CARS", "SEARCH CARS", "BRANDS", "BOOK A TEST DRIVE", "CAR LEASE", "UPCOMMING CARS", "NEWS/BLOG", "CONTACT US","ABOUT US", "WHY US","PROFILE","SETTING","LOGOUT"]
    
    // icons for side bar 
    
    var sideBarIcon = ["SideBarHome.png","SideBarHotDeal.png","SideBarCompareCar.png","SideBarSearch.png","SideBarBrands.jpg","SideBarBookATestDrive.png","SideBarCarLease.png","SideBarCarLease.png","Sidenews.png","SideBarContactUs.png","sideAboutUs.png","Whyus.png","SideProfile.png","SideSetting.png","SideBarLogout.jpg"]
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.roundImage(profileImageView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sideBarOption.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("sideBarCell") as! SideBarOptionCell
        
        /*
        for sideBAr icon
        let sideBarIconImage : UIImageView = UIImageView(frame: CGRectMake(5, 5, 40, 40))
        sideBarIconImage.image = UIImage(named: sideBarIcon[indexPath.row])
        cell!.addSubview(sideBarIconImage)
        
        
         create UIlabel Programaticaly
        let sideBarContent : UILabel = UILabel(frame: CGRectMake(85,5, 80, 40))
        
        sideBarContent.text = sideBarOption[indexPath.row]
        sideBarContent.font = sideBarContent.font.fontWithSize(10)
        cell!.addSubview(sideBarContent)
        */
        
        
        cell.sideBarOption.text = sideBarOption[indexPath.row]
        cell.sideBarIcon.image = UIImage(named: sideBarIcon[indexPath.row])
        return cell
    }
    
    // This function takes ImageView as a parameter and return round ImageView
    func roundImage(imageView : UIImageView)
    {
        imageView.layer.borderWidth = 1.0
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.grayColor().CGColor
        
        imageView.layer.cornerRadius =  imageView.frame.size.height/2
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        
    }
}

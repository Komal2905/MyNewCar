//
//  BookTestDriveViewController.swift
//  MyNewCar
//
//  Created by ProjectHeena on 4/5/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class BookTestDriveViewController: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource,UIPopoverPresentationControllerDelegate, UITableViewDataSource,UITableViewDelegate
{
   
    
    @IBOutlet weak var modelTextField: UITextField!
    
    // add car logo name and its image to respective array
    
    var carLogoImage = ["Brands-Chervolet.png", "Brands-Datsun.png","Brands-Ford.png","Brands-Honda.png","Brands-hyundai.png","Brands-mahindra.png","Brands-nissan.png","Brands-renault.png","Brands-skoda.png","Brands-suzuki.png",]
    
    var carLogoName = ["Chervolet", "Datsun", "Ford", "Honda", "Hyndai", "Mahindra", "Nissan", "Renault", "Skoda", "Suzuki"]
    
    var carModel = ["Select Model","Beat","Enjoy","Sail","Sail Hatchback","Spark"]
    
    var fuelType = ["Petrol", "Diesel","CNG","Electric","LPG"]

    @IBOutlet weak var fuelTypeLbl: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func selectBrand(sender: AnyObject)
    {
        //let tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
        
        let tableView = UITableView(frame: CGRect(x: 30, y: 252, width: 300, height: 120))
        tableView.delegate  =   self
        tableView.dataSource =   self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
        
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return fuelType.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel!.font = UIFont(name: "Arial-BoldMT", size: 10)
        
        cell.textLabel?.text = fuelType[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.fuelTypeLbl.text = fuelType[indexPath.row]
        
        tableView.hidden = true
    }
    
    // number of section in collection view
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    @IBOutlet weak var selectBrand: UIButton!
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        return carLogoName.count
    }
    
    
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {

            let carLogoCell = collectionView.dequeueReusableCellWithReuseIdentifier("carLogo", forIndexPath: indexPath) as! CarLogoCollectionViewCell
            
         
            carLogoCell.carLogoName.text = carLogoName[indexPath.row]
            carLogoCell.carLogoImage.image = UIImage(named: carLogoImage[indexPath.row])
        
        
        
            return carLogoCell
  
     
    }
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return carModel.count
    }
    
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
//    {
//        return carModel[row]
//    }
    
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView!) -> UIView
    {
        var pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        pickerLabel.text = carModel[row]
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.font = UIFont(name: "Arial-BoldMT", size: 10) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.Center
        
        self.modelTextField.text = pickerLabel.text
        return pickerLabel
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let popupView = segue.destinationViewController
        if let popup = popupView.popoverPresentationController
        {
            popup.delegate = self
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.None
    }
}

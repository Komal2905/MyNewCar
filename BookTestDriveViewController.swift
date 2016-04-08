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
    @IBOutlet weak var fuelTypeLbl: UILabel!
    
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    @IBOutlet weak var cityTextField: UITextField!
    
  
 
    @IBOutlet weak var dateTextField: UITextField!
    
    // added Date Picker
    @IBAction func dateTextFiled(sender: UITextField)
    {
        
        let datePickerView:UIDatePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 100, height: 300))
        
        datePickerView.datePickerMode = UIDatePickerMode.Date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(BookTestDriveViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)
        
      
        
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        dateTextField.text = dateFormatter.stringFromDate(sender.date)
       
        test_date = dateTextField.text!
        //dateTextField.resignFirstResponder()
        
    }
    
    // add car logo name and its image to respective array
    
    var enq_full_name = String()
    var enq_email  = String()
    var enq_phone  = String()
    var request_main_city  = String()
    var test_brand_data  = String()
    var test_brand_model  = String()
    var test_fuel_type  = String()
    var test_date = String()
    
    var carLogoImage = ["Brands-Chervolet.png", "Brands-Datsun.png","Brands-Ford.png","Brands-Honda.png","Brands-hyundai.png","Brands-mahindra.png","Brands-nissan.png","Brands-renault.png","Brands-skoda.png","Brands-suzuki.png",]
    
    var carLogoName = ["Chervolet", "Datsun", "Ford", "Honda", "Hyndai", "Mahindra", "Nissan", "Renault", "Skoda", "Suzuki"]
    
    var carModel = ["Select Model","Beat","Enjoy","Sail","Sail Hatchback","Spark"]
    
    var fuelType = ["Petrol", "Diesel","CNG","Electric","LPG"]
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // make texfield bottom border
        
        bottomTextField(fullNameTextField)
        bottomTextField(fullNameTextField)
        bottomTextField(emailTextField)
        bottomTextField(phoneTextField)
        bottomTextField(cityTextField)
        
        //fuelTypeLbl!.layer.borderWidth = 1
        
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor.darkGrayColor().CGColor
        border.frame = CGRect(x: 0, y: fuelTypeLbl.frame.size.height - width, width:  fuelTypeLbl.frame.size.width, height: fuelTypeLbl.frame.size.height)
        
        border.borderWidth = width
        fuelTypeLbl.layer.addSublayer(border)
        fuelTypeLbl.layer.masksToBounds = true
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // this function create tableView Programatically
    @IBAction func selectBrand(sender: AnyObject)
    {
        //let tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
        
        let tableView = UITableView(frame: CGRect(x: 10, y: 210, width: 390, height: 100))
        tableView.delegate  =   self
        tableView.dataSource =   self
        tableView.rowHeight = 20
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.layer.borderWidth = 1.0
    
        self.view.addSubview(tableView)
        
        animateTable(tableView)
        
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return fuelType.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        cell.textLabel!.font = UIFont(name: "Arial-BoldMT", size: 8)
        
        cell.textLabel?.text = fuelType[indexPath.row]
        
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.fuelTypeLbl.text = fuelType[indexPath.row]
        test_fuel_type =  self.fuelTypeLbl.text!
        tableView.hidden = true
        
        
    }
    
    
    // for animation in tableView
    
    func animateTable(tableView : UITableView)
    {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animateWithDuration(0.3, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .AllowUserInteraction, animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
        
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
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let selectedId = pickerView.selectedRowInComponent(0)
        test_brand_model = carModel[selectedId]
    }

    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        
        cell!.backgroundColor = UIColor(red:255.0, green:255.0, blue:255.0, alpha:1)
        cell?.layer.borderColor = UIColor.redColor().CGColor
        cell?.layer.borderWidth = 1.0
        test_brand_data = carLogoName[indexPath.row]
        
        print("You have selected ",test_brand_data)
        
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath)
    {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        
        
        cell?.layer.borderColor = UIColor.whiteColor().CGColor
        cell?.layer.borderWidth = 1.0
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
    
    
    // this function will add lower boreder to textfield
    func bottomTextField(textField : UITextField)
    {
     
     let border = CALayer()
     let width = CGFloat(1.0)
     border.borderColor = UIColor.whiteColor().CGColor
     border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
     
     border.borderWidth = width
     textField.layer.addSublayer(border)
     textField.layer.masksToBounds = true
        
    textField.addTarget(self, action: #selector(BookTestDriveViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
    }
    
    // if textfiled edited then
    func textFieldDidChange(textField: UITextField)
    {
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.redColor().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    
    
  
    
    
    @IBAction func testDrivePost(sender: AnyObject)
    {
        enq_full_name = fullNameTextField.text!
        enq_email  = emailTextField.text!
        enq_phone  = phoneTextField.text!
        request_main_city  = cityTextField.text!
        
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://mncbeta.com/common/feedback_enquiry")!)
        request.HTTPMethod = "POST"

        
        let postString = "enq_full_name=\(enq_full_name)&enq_email=\(enq_email)&enq_phone=\(enq_phone)&city=\(request_main_city)&brand_name=\(test_brand_data)&model_name=\(test_brand_model)&fuel_type=\(test_fuel_type)&added_date=\(test_date)"
        
        print("POST STRING", postString)
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {                                                          // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? NSHTTPURLResponse where httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
                }
            
            // checking status code
            if let httpStatus1 = response as? NSHTTPURLResponse where httpStatus1.statusCode == 200
            {
                print("HTTP Status code",httpStatus1.statusCode)
            }
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        task.resume()
        
        
        
    }
    
   
}

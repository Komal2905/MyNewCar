//
//  ViewController.swift
//  MyNewCar
//
//  Created by ProjectHeena on 4/1/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UIPageViewControllerDataSource
{


    // car ImageSlider
    
    
    @IBOutlet weak var carSliderImageView: UIImageView!

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var hotDealCarCollectionView: UICollectionView!
   
    @IBOutlet weak var carLogoCollectionView: UICollectionView!
    
    @IBOutlet weak var carTypeCollection: UICollectionView!
    
    @IBOutlet weak var menuButton:UIBarButtonItem!
    
    
    @IBOutlet weak var hotDealLabel: UILabel!
    
    
    // for range Slider
     let rangeSlider1 = RangeSlider(frame: CGRectZero)
     let rangeSlider2 = RangeSlider(frame: CGRectZero)
    
    // an array that will hold Car IAmge NAme
    var carIamgeArray = [String]()
    
    // array for car Name
    var carNameArray = [String]()

    // for Car Logo
    // array for car logo name and its image
    var carLogoImage = [String]()
    var carLogoName = [String]()
    
    
    // for car Type
    var carTypeImage = [String]()
    var carTypeName = [String]()
    
    // for ImageSLider
    var pageViewController: UIPageViewController!
    
    var sliderImages = [String]()
    
    @IBOutlet weak var customRangeSlider: RangeSlider!
    
    
    // city select tbaleVie
    
     var cityTableView: UITableView  =   UITableView()
    
    @IBAction func searchYourCar(sender: AnyObject)
    {
        carLogoCollectionView.hidden ? openCarSearch() : closecarSearch()

    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Strat Asyc Thread
        let qualityOfServiceClass = QOS_CLASS_BACKGROUND
        let backgroundQueue = dispatch_get_global_queue(qualityOfServiceClass, 0)
        dispatch_async(backgroundQueue, {
            print("This is run on the background queue")
            
            
        })

        
        
        
        self.getImageFormUrl()
        // changing navigation bar colour
         //navigationController!.navigationBar.barTintColor = UIColor.redColor()

        // Do any additional setup after loading the view, typically from a nib.

        // add image to array
        carIamgeArray = ["HotDeal-Car1.jpg", "HotDeal-Car2.jpg","HotDeal-Car3.jpg","HotDeal-Car4.jpg","HotDeal-Car5.jpg","HotDeal-Car6.jpg"]
        
        // add names to carNameArray
        carNameArray = ["Maruti-Suzuki DZire LXi [O]","Maruti-Suzuki Wagon R VXi [O] AT","Maruti-Suzuki Ciaz VXI+ AT", "Maruti-Suzuki Celerio VXi Auto", "Maruti-Suzuki Ritz LXi", "Maruti-Suzuki Vitara Brezza ZDi+"]
        
        // add car logo name and its image to respective array
        
        carLogoImage = ["Brands-Chervolet.png", "Brands-Datsun.png","Brands-Ford.png","Brands-Honda.png","Brands-hyundai.png","Brands-mahindra.png","Brands-nissan.png","Brands-renault.png","Brands-skoda.png","Brands-suzuki.png",]
        
        carLogoName = ["Chervolet", "Datsun", "Ford", "Honda", "Hyndai", "Mahindra", "Nissan", "Renault", "Skoda", "Suzuki"]
        
        
        //sliderImages = ["1.jpg","2.jpg","3.jpg","4.jpg"]
        
        //sliderImages.append(<#T##newElement: Element##Element#>)
        
        
        carTypeName = ["Hatch Back", "Sedan","Van-Mini-van","SUV-MUV","Coupe","Convertible","Station Wagan"]
        
        carTypeImage = ["CarType-HatchBack.png","CarType-Sedan.png","CarType-Van.png","CarType-SUV-MUV.png","CarType-Coupe.png","CarType-Convertible.png","CarType-Station.png"]
        
        
        // For page View COntroller
        
        /*
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        
        let startVC = self.viewControllerAtIndex(0) as ImageSlideViewController
        
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as [AnyObject] as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        
        
        self.pageViewController.view.frame = CGRectMake(0, 70, self.view.frame.width, self.view.frame.size.height/2 - 200)
        
        
        //self.addChildViewController(self.pageViewController)
        
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMoveToParentViewController(self)
        
        
 
        */
    
        // For Side bar
        
        if self.revealViewController() != nil
        {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        self.hideView()
        
        // add SLider
        rangeSlider1.addTarget(self, action: "rangeSliderValueChanged:", forControlEvents: .ValueChanged)
        
        rangeSlider2.trackHighlightTintColor = UIColor.redColor()
        view.addSubview(rangeSlider1)
        
        
        
        //self.hotDealCarCollectionView.hidden = true
        
       //getImageFormUrl()
        
        
    }
    
    
    // this fuction makes CollectionView Hidded
    
    func hideView()
    {
        
        carLogoCollectionView.hidden = true
        carTypeCollection.hidden = true
        customRangeSlider.hidden = true

    }
    
    
    func openCarSearch()
    {
        print("OPencarsearch")
        
        self.carLogoCollectionView.hidden = false
        self.carTypeCollection.hidden = false
        self.customRangeSlider.hidden = false
        UIView.animateWithDuration(0.3,
                                   animations: {
                                    self.carTypeCollection.frame = CGRect(x: 0, y: 353, width: 409, height: 43)
                                    self.carTypeCollection.alpha = 1
                                
                                    
                                    self.carLogoCollectionView.frame = CGRect(x: 0, y: 283, width: 414, height: 56)
                                    self.carLogoCollectionView.alpha = 1
                                    
                                    self.customRangeSlider.frame = CGRect(x: 0, y: 345, width: 403, height: 14)
                                    
                                    self.customRangeSlider.alpha = 1
                                   
                                    
        })
        
        UIView.animateWithDuration(0.3, animations: {
            
            self.hotDealLabel.frame = CGRect(x: 0, y: 400, width: 409, height: 21)
            self.hotDealCarCollectionView.frame = CGRect(x: 0, y: 423, width: 405, height: 112)
            
            
        })
 
    }
    
    func closecarSearch()
    {
        print("Closecarsearch")
        
        UIView.animateWithDuration(0.3,
                                   animations: {
                                    //self.carTypeCollection.frame = CGRect(x: ((self.view.frame.width / 2) - 143), y: 200, width: 286, height: 291)
                                    self.carTypeCollection.alpha = 0
                                    
                                    //self.carLogoCollectionView.frame = CGRect(x: ((self.view.frame.width / 2) - 143), y: 200, width: 286, height: 291)
                                    self.carLogoCollectionView.alpha = 0
                                    self.customRangeSlider.alpha = 0

                                    
                                    },
                                   completion:
                                    { finished in
                                    self.carTypeCollection.hidden = true
                                    self.carLogoCollectionView.hidden = true
                                    self.customRangeSlider.hidden = false

                                    })
      
        
        UIView.animateWithDuration(0.3, animations: {
        
        self.hotDealLabel.frame = CGRect(x: 0, y: 260, width: 409, height: 21)
        self.hotDealCarCollectionView.frame = CGRect(x: 1, y: 283, width: 405, height: 112)
        
        
        })


    }

    // this function change CollectionView's Place
    
    func dealCarUpperSize()
    {
        
        UIView.animateWithDuration(0.3, animations: {
            
            self.hotDealCarCollectionView.frame = CGRect(x: 1, y: 0, width: 1, height: 1)
            self.hotDealCarCollectionView.hidden = false
            
            
        })
    }
    
    
    
    func viewControllerAtIndex(index: Int) -> ImageSlideViewController
    {
        if ((self.sliderImages.count == 0) || (index >= self.sliderImages.count))
        {
            
            return ImageSlideViewController()
            
        }
        
        
        let vc: ImageSlideViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ImageSlideViewController") as! ImageSlideViewController
        
        
        
        vc.imageFile = self.sliderImages[index]
        
        print("Image FIle", vc.imageFile)
        
        vc.imageIndex = index
        
        return vc
        
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
        
    {
        
        
        print("Inside VIewCOntrollerBeforeViewCOntroller")
        
        let vc = viewController as! ImageSlideViewController
        
        var index = vc.imageIndex as Int
        
        if (index == 0 || index == NSNotFound)
            
        {
            
            return nil
            
        }
        
        index = index - 1
        
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        
        let vc = viewController as! ImageSlideViewController
        var index = vc.imageIndex as Int
        
        if (index == NSNotFound)
        {
            return nil
        }
        
        index = index + 1
        
       
        return self.viewControllerAtIndex(index)
        
    }


    // number of section in collection view
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        
        var cellCount = Int()
        
        // check collectionView and set its count
        if (collectionView == hotDealCarCollectionView)
        {
            cellCount = carIamgeArray.count
        }
        
        if (collectionView == carLogoCollectionView)
        {
            cellCount = carLogoName.count
        }
        
        
        if (collectionView == carTypeCollection)
        {
            cellCount = carTypeName.count
        }
        
        return cellCount
    }
    
    
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        // defining CustomeCell
    
        // For Hot deal Car CollectionView
        if (collectionView == hotDealCarCollectionView)
        {
            let hotDealCarCell = collectionView.dequeueReusableCellWithReuseIdentifier("hotDealCar", forIndexPath: indexPath) as! HotDealCollectionViewCell
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            
            hotDealCarCell.carNameLAbel.text = carNameArray[indexPath.row]
            
            hotDealCarCell.carImageView.image = UIImage(named: carIamgeArray[indexPath.row])
        
                
            return hotDealCarCell
        }
        
        
               // for Car Logo COlectionView
        if (collectionView == carLogoCollectionView)
        {
        
            let carLogoCell = collectionView.dequeueReusableCellWithReuseIdentifier("carLogo", forIndexPath: indexPath) as! CarLogoCollectionViewCell
            

            // set image
            carLogoCell.carLogoImageView.image = UIImage(named: carLogoImage[indexPath.row])
            
            // set Logo name
            print("In Logo")
            
            carLogoCell.carNameLabel.text = carLogoName[indexPath.row]
            
            return carLogoCell
        }
        
        
       let carTypeCell = collectionView.dequeueReusableCellWithReuseIdentifier("carTypeCell", forIndexPath: indexPath) as! CarTypeCollectionViewCell
        // For car Type ColectionView
        
        if (collectionView == carTypeCollection)
        {
            
            
            // set image
            carTypeCell.carTypeImageView.image = UIImage(named: carTypeImage[indexPath.row])
            // set Logo name
            carTypeCell.carTypeName.text = carTypeName[indexPath.row]
            
            return carTypeCell
        }
        
        
        return carTypeCell
        //return UICollectionViewCell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(carTypeName[indexPath.row])!")
        
    }
    
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 3
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    
    
    // SHow Slider Value
    func rangeSliderValueChanged(rangeSlider: RangeSlider)
    {
        print("Range slider value changed: (\(rangeSlider.lowerValue) , \(rangeSlider.upperValue))")
    }

    
    // For ImageSLider
    

    
    // this function used for RestCall
    
    func displayImageSlider(images : NSMutableArray)
    {
        for image in images
        {
            let imageDictionary = image as! NSDictionary
            
            let testImage = imageDictionary["image_name"] as! String!
            
            let completePath = "http://images.mynewcar.in/uploads/slider/"+testImage
            
            print("CompletePath",completePath )
            
            print("TestImage", testImage)
            
            sliderImages.append(completePath)
            
        }
        
         print("SLider Image COunt", sliderImages.count)
    }
    
    
    func getImageFormUrl()
    {
       
        var jsonImageArray = NSMutableArray()
        let urlString = "https://mynewcar.in/api/slider/format/json/city/1"
        
        //Convert String to URL
        let url = NSURL(string: urlString)
        
        //Session
        NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler:{
            (data,response,error) -> Void in
            
            if error == nil && data != nil
            {
                do
                {
                    // Convert NSData to Dictionary where keys are of type String, and values are of any type
                    let jsonImageArray = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSMutableArray
                    
                    self.displayImageSlider(jsonImageArray)
                    
                    self.instaceImageSlider()
                    
                    print("Print Jason Image",jsonImageArray )
                    
                    
                }
                    
                catch
                {
                    print("Something Went Wrong in REST")
                }
                
            }
            
        }).resume()
    }

    
    
    // Function For ImageSLider and PageViewCOntroller
    func instaceImageSlider()
    {
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        
        let startVC = self.viewControllerAtIndex(0) as ImageSlideViewController
        
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as [AnyObject] as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        
        
        self.pageViewController.view.frame = CGRectMake(0, 70, self.view.frame.width, self.view.frame.size.height/2 - 200)
        
        
        //self.addChildViewController(self.pageViewController)
        
        self.view.addSubview(self.pageViewController.view)
        
        self.pageViewController.didMoveToParentViewController(self)
        
        dispatch_async(dispatch_get_main_queue())
        { [unowned self] in
            
        }

    }
    
}


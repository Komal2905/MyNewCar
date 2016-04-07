//
//  CarSearchViewController.swift
//  MyNewCar
//
//  Created by ProjectHeena on 4/4/16.
//  Copyright © 2016 ProjectHeena. All rights reserved.
//

import UIKit

class CarSearchViewController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate
{
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchController: UISearchController!
    
    @IBOutlet weak var testingUrlImage: UIImageView!
    
    var carLogoImage = ["Brands-Chervolet.png", "Brands-Datsun.png","Brands-Ford.png","Brands-Honda.png","Brands-hyundai.png","Brands-mahindra.png","Brands-nissan.png","Brands-renault.png","Brands-skoda.png","Brands-suzuki.png",]
    
    @IBAction func searchCar(sender: AnyObject)
    {
        var flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .Horizontal
        
        
        //let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: flowLayout)
        
        let collectionView = UICollectionView(frame: CGRectMake(5, 89, 500, 103), collectionViewLayout: flowLayout)
        
        collectionView.backgroundColor = UIColor.whiteColor()
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        self.view.addSubview(collectionView)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath)
        
        let sideBarIconImage : UIImageView = UIImageView(frame: CGRectMake(5, 5, 142, 103))
        
        
        sideBarIconImage.image = UIImage(named :carLogoImage[indexPath.row])
        
        cell.addSubview(sideBarIconImage)
        
        return cell
    }
    
  
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureSearchController()
        testingUrlImage.image = UIImage(named: "http://images.mynewcar.in/uploads/slider/1024x328-vw-mumbai20160404114405.jpg")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func configureSearchController()
    {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search Your Car"
        searchController.searchBar.delegate = self
    }
    func searchBarTextDidBeginEditing(searchBar: UISearchBar)
    {
       
      print("Edit")
    }
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar)
    {
      print("Edit")
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        print("UPdateting")
    }
}

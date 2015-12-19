//
//  DiscoverTableViewController.swift
//  Restaraunts
//
//  Created by Игорь on 16.12.15.
//  Copyright © 2015 Ihor Malovanyi. All rights reserved.
//

import UIKit
import CloudKit


class DiscoverTableViewController: UITableViewController {
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    var restaurants:[CKRecord] = []
    var imageCache: NSCache = NSCache()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRecordsFromCloud()
        
        spinner.hidesWhenStopped = true
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        
        
        //pull to refresh
        refreshControl = UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.whiteColor()
        refreshControl?.tintColor = UIColor.grayColor()
        refreshControl?.addTarget(self, action: "getRecordsFromCloud", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }
    
    func getRecordsFromCloud() {
        var newRestaurantsFromCloud:[CKRecord] = [] //Создаем массив, который будет заполнятся в этом методе
        
        let cloudContainer = CKContainer.defaultContainer()
        let publicDatabase = cloudContainer.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.desiredKeys = ["name"]
        queryOperation.queuePriority = .VeryHigh
        queryOperation.resultsLimit = 50
        
        queryOperation.recordFetchedBlock = { (record: CKRecord!) -> Void in
            if let restaurantRecord = record {
                newRestaurantsFromCloud.append(restaurantRecord) //Заполняем созданный нами массив
            }
        }
        
        queryOperation.queryCompletionBlock = { (cursor: CKQueryCursor?, error: NSError?) -> Void in
            if error != nil {
                print("Failed to get data from iCloud")
                return
            }
            print("Success")
            NSOperationQueue.mainQueue().addOperationWithBlock() {
                self.restaurants = newRestaurantsFromCloud //заменяем содержимое массива класса содержимым массива метода
                self.tableView.reloadData()
                self.spinner.stopAnimating()
                self.refreshControl?.endRefreshing()
            }
        }
        
        publicDatabase.addOperation(queryOperation)
    }
    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DiscoverTableViewCell
        
        // Configure the cell...
        let restaurant = restaurants[indexPath.row]
        
        cell.nameLabel?.text = restaurant.objectForKey("name") as? String
        
        cell.customImageView?.image = UIImage(named: "photoalbum")
        
        //cache
        if let imageFileURL = imageCache.objectForKey(restaurant.recordID) as? NSURL {
            cell.customImageView?.image = UIImage(data: NSData(contentsOfURL: imageFileURL)!)
        } else {
            //iCloud
            let publicDatabase = CKContainer.defaultContainer().publicCloudDatabase
            let fetchRecordImageOperation = CKFetchRecordsOperation(recordIDs: [restaurant.recordID])
            fetchRecordImageOperation.desiredKeys = ["photo"]
            fetchRecordImageOperation.queuePriority = .VeryHigh
            
            fetchRecordImageOperation.perRecordCompletionBlock = {(record: CKRecord?, recordID: CKRecordID?, error: NSError?) -> Void in
                if error != nil {
                    print(error)
                    return
                }
                if let restaurantRecord = record {
                    NSOperationQueue.mainQueue().addOperationWithBlock() {
                        if let imageAsset = restaurantRecord.objectForKey("photo") as? CKAsset {
                            cell.customImageView?.image = UIImage(data: NSData(contentsOfURL: imageAsset.fileURL)!)
                            self.imageCache.setObject(imageAsset.fileURL, forKey: restaurant.recordID)
                        }
                    }
                }
            }
            
            publicDatabase.addOperation(fetchRecordImageOperation)
        }
        
        
        
        return cell
    }
    
    
}

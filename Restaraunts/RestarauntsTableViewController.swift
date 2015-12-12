//
//  RestarauntsTableViewController.swift
//  Restaraunts
//
//  Created by Игорь on 19.11.15.
//  Copyright © 2015 Ihor Malovanyi. All rights reserved.
//

import UIKit

class RestarauntsTableViewController: UITableViewController {

    
    var restaurants: [Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", phoneNumber: "232-923423", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", phoneNumber: "348-233423", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", phoneNumber: "354-243523", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", phoneNumber: "453-333423", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", phoneNumber: "983-284334", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", phoneNumber: "232-434222", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", phoneNumber: "234-834322", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", phoneNumber: "982-434343", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", phoneNumber: "734-232323", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", phoneNumber: "872-734343", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", phoneNumber: "343-233221", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", phoneNumber: "985-723623", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", phoneNumber: "455-232345", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", phoneNumber: "434-232322", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", phoneNumber: "343-234553", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", phoneNumber: "342-455433", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", phoneNumber: "643-332323", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", phoneNumber: "542-343434", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", phoneNumber: "722-232323", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", phoneNumber: "343-988834", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "London", phoneNumber: "432-344050", image: "thaicafe.jpg", isVisited: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

            // Удалить title у кнопки  back
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
       
        // Настройка ячейки
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .Checkmark : .None

        return cell
    }

//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let optionMenu = UIAlertController(title: nil, message: "Что вы хотите сделать?", preferredStyle: .ActionSheet)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//       
//        let isVisitedTitle = (restaurants[indexPath.row].isVisited) ? "Я тут не был" : "Я был тут"
//        
//        let isVisitedAction = UIAlertAction(title: isVisitedTitle, style: .Default, handler: {
//            (action: UIAlertAction!) -> Void in
//            
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            
//            self.restaurants[indexPath.row].isVisited = (self.restaurants[indexPath.row].isVisited) ? false : true
//            
//            cell?.accessoryType = (self.restaurants[indexPath.row].isVisited) ? .Checkmark : .None
//        })
//        
//        let callActionHandler = { (action: UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Сервис недоступен", message: "Простите, но сейчас позвонить невозможно. Повторите позже", preferredStyle: .Alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//        }
//        
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .Default, handler: callActionHandler)
//        
//        
//        optionMenu.addAction(cancelAction)
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(isVisitedAction)
////        self.presentViewController(optionMenu, animated: true, completion: nil)
//        
//    }

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        //Social
        let shareAction = UITableViewRowAction(style: .Default, title: "Поделится", handler: { (actin, indexPath) -> Void in
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.presentViewController(activityController, animated: true, completion: nil)
        })
        
        //Delete
        let deleteAction = UITableViewRowAction(style: .Default, title: "Удалить", handler: {(actin, indexPath) -> Void in
            self.restaurants.removeAtIndex(indexPath.row)

            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

            })
        
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! DetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
        prefersStatusBarHidden()
    }
    
}

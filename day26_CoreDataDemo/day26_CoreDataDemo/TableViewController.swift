//
//  TableViewController.swift
//  day26_CoreDataDemo
//
//  Created by jyh on 2017/11/28.
//  Copyright © 2017年 jyh. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    
    var listItems  = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(self.addItem))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContex = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ListEntity")
        
        do {
            
            let results = try managedContex.fetch(fetchRequest)
            listItems = results as! [NSManagedObject]
            self.tableView.reloadData()
            
        } catch {
            
            print("error")
        }
        
    }
    
    func addItem() {
        
        let alertController = UIAlertController(title: "New Resolution", message: "", preferredStyle: UIAlertControllerStyle.alert)
        let confirmAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.default, handler: ({
            (_) in

            guard let fieldtext = (alertController.textFields![0]).text else {
                return
            }
            self.saveItem(fieldtext)
            self.tableView.reloadData()
            
        }))
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addTextField (configurationHandler: {
            (textField) in
            
            textField.placeholder = "Type smothing..."
            
        })
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    func saveItem(_ itemToSave: String) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContex = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "ListEntity", in: managedContex)
        let item = NSManagedObject(entity: entity!, insertInto: managedContex)
        
        item.setValue(itemToSave, forKey: "item")
        
        do {
            
            try managedContex.save()
            listItems.append(item)
            
        } catch {
            
            print("error")
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let item = listItems[indexPath.row]
        
        cell.textLabel?.text = item.value(forKey: "item") as? String
        cell.textLabel?.font = UIFont(name: "", size: 25)

        return cell
    }
 
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .normal, title: "Delete") { action, index in
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContex = appDelegate.persistentContainer.viewContext
            tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.right)
            managedContex.delete(self.listItems[indexPath.row])
            do {
                try managedContex.save()
                self.listItems.remove(at: indexPath.row)
                self.tableView.reloadData()
            } catch {
                print("error: delete ")
            }
        }
        
        delete.backgroundColor = UIColor.red
        
        return [delete]
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */



}

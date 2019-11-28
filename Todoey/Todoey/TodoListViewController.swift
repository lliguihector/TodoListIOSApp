//
//  ViewController.swift
//  Todoey
//
//  Created by Hector Lliguichuzca on 11/28/19.
//  Copyright © 2019 Hector Lliguichuzca. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    
    let itemArray = ["Find Mike", "Bug Eggos","Destroy Demogotgon"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //MARK = Tableview Datasource Method
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
            
             cell.textLabel?.text = itemArray[indexPath.row]
        
        
        return cell
    
    
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        //When one of the cell is selected the number will display
        print(itemArray[indexPath.row])
   
        
    //When the row is selected the check mark is displayed
       
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
               tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
          tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    


}


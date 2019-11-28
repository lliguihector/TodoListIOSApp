//
//  ViewController.swift
//  Todoey
//
//  Created by Hector Lliguichuzca on 11/28/19.
//  Copyright © 2019 Hector Lliguichuzca. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    
    
    var itemArray = ["Find Mike", "Bug Eggos","Destroy Demogotgon"]
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        if let items = UserDefaults.standard.array(forKey: "TodoListArray") as? [String] {
            
            itemArray = items
        }
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
    
    //Mark - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        
        let alert = UIAlertController(title:"Add New Todoey Item" ,message:"", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: . default){
            (action) in
            
            //What will happen once the user clicks the add Item Button omn our UIAlert
            
//            print("Success!")
//            print(textField.text as Any)


            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
    
            
            
            //reload the table view data
          self.tableView.reloadData()

        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            
            
            textField  = alertTextField
            
        }
        
        
        print()
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        
        
        
        
    }
    
    
    
    


}


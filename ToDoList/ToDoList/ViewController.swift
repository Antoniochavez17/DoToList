//
//  ViewController.swift
//  ToDoList
//
//  Created by Antonio Adrian Chavez on 11/22/19.
//  Copyright © 2019 Antonio Adrian Chavez. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    private var toDoItem = ToDoList.getMockData()
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_todo", for: indexPath)
        
        if indexPath.row < toDoItem.count {
            
            let item = toDoItem[indexPath.row]
            cell.textLabel?.text = item.title
        
            let accessory: UITableViewCell.AccessoryType = item.done ? .checkmark : .none
            cell.accessoryType = accessory

           
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row < toDoItem.count {
            
            let item = toDoItem[indexPath.row]
            item.done = !item.done
            
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if indexPath.row < toDoItem.count {
            
            toDoItem.remove(at:  indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
    

    
    @objc func tapButton(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "New DotoList?", message: "Insert the title of the new to-do item:", preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: nil)
        
       let None = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
       let Add = UIAlertAction(title: "Add", style: .default, handler: { (_) in
       
        if let title = alert.textFields?[0].text {
            
            self.addItemsList(Title: title)
          
        }
       
       
       
       })
        
        alert.addAction(None)
        alert.addAction(Add)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    private func addItemsList(Title: String) {
        
        let newIndex = toDoItem.count
        toDoItem.append(ToDoList(title: Title))
        tableView.insertRows(at: [IndexPath.init(row: newIndex, section: 0)], with: .top)
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.title = "DoToList"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.tapButton(_:)))
    }


}


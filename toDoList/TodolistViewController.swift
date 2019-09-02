//
//  ViewController.swift
//  toDoList
//
//  Created by Madhur on 24/08/19.
//  Copyright © 2019 Madhur. All rights reserved.
//

import UIKit

class TodolistViewController: UITableViewController {
    
    var items : [CheckListItem]
    

    required init?(coder aDecoder: NSCoder) {
        
        items = [CheckListItem]()
        
        
       let row0item = CheckListItem()
        row0item.text = "Walkk the Dog"
        row0item.checked = false
        
        items.append(row0item)
        
        let row1item = CheckListItem()
        row1item.text = "Brush My Teeth"
        row1item.checked = false
        
        items.append(row1item)

        
        let row2item = CheckListItem()
        row2item.text = "Learn Ios Development"
        row2item.checked = false
        items.append(row2item)

        
        let row3item = CheckListItem()
        row3item.text = "soccer Practic"
        row3item.checked = false
        items.append(row3item)

        
       let row4item = CheckListItem()
        row4item.text = "Eat Ice cream"
        row4item.checked = false
        items.append(row4item)
        
        let row5item = CheckListItem()
        row5item.text = "Learn Table View In IOS"
        row5item.checked = false
        items.append(row5item)
        
        
        let row6item = CheckListItem()
        row6item.text = "Learn Core Data in IOS"
        row6item.checked = false
        items.append(row6item)
        
        
        let row7item = CheckListItem()
        row7item.text = "Eat Ice cream"
        row7item.checked = false
        items.append(row7item)

        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
    
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckMark(for: cell, with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "todolistitem" , for: indexPath)
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckMark(for: cell, with: item)
        return cell
    }
  
    
    
    func configureText(for cell : UITableViewCell , with item: CheckListItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text

    }
    
    
    func configureCheckMark(for cell: UITableViewCell , with item: CheckListItem){
        if item.checked{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
   
}


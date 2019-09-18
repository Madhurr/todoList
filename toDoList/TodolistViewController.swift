//
//  ViewController.swift
//  toDoList
//
//  Created by Madhur on 24/08/19.
//  Copyright © 2019 Madhur. All rights reserved.
//

import UIKit

class TodolistViewController: UITableViewController , ItemDetailViewControllerDelegate {
  
    
    var items : [CheckListItem]
    
    
    @IBAction func addItem(_ sender: Any) {
        let newRowindex = items.count
        let item = CheckListItem()
        item.text = "I am New Row"
        item.checked = true
        items.append(item)
        let indexPath = IndexPath(row: newRowindex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }

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
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItem"{
            let controller = segue.destination as! itemDetailVC
            controller.delegate = self
        }
        if segue.identifier == "editItemSegue"{
            let controller = segue.destination as! itemDetailVC
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
                controller.itemToEdit = items[indexPath.row]
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
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
        let label = cell.viewWithTag(1001) as! UILabel
        if item.checked{
            label.text = "√"
        }else{
            label.text = ""
        }
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    
    func itemDetailViewControllerDelegateDidCancel(_ controller: itemDetailVC) {
        navigationController?.popViewController(animated: true)
    }
    
    func itemDetailViewControllerDelegate(_ controller: itemDetailVC, didFinishAdding item: CheckListItem) {
        let newRowindex = items.count
        items.append(item)
        let indexPath = IndexPath(row: newRowindex, section: 0)
        let indexPaths = [indexPath]
        tableView .insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    func itemDetailViewControllerDelegate(_ controller: itemDetailVC, didFinishEditingitem item: CheckListItem) {
        if let index = items.firstIndex(of: item){
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath){
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
    }
}


//
//  itemDetailViewControllerDelegateTableViewController.swift
//  toDoList
//
//  Created by Madhur on 13/09/19.
//  Copyright © 2019 Madhur. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDelegateDidCancel(_ controller: itemDetailVC)
    func itemDetailViewControllerDelegate(_ controller: itemDetailVC , didFinishAdding item: CheckListItem)
    func itemDetailViewControllerDelegate(_ controller: itemDetailVC , didFinishEditingitem item: CheckListItem)
}

class itemDetailVC: UITableViewController , UITextFieldDelegate {

    @IBOutlet var todoTextField: UITextField!
    @IBOutlet var cancelButton: UIBarButtonItem!
    @IBOutlet var doneButton: UIBarButtonItem!
    var itemToEdit: CheckListItem?
    
    weak var delegate: ItemDetailViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationItem.largeTitleDisplayMode = .never
       todoTextField.delegate = self
        
        if let item =  itemToEdit{
            title = "Edit Item"
            todoTextField.text = item.text
            doneButton.isEnabled = true
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        todoTextField.becomeFirstResponder()
    }

    // MARK: - Table view data source
    
    @IBAction func cancel (){
        navigationController?.popViewController(animated: true)
        delegate?.itemDetailViewControllerDelegateDidCancel(self)
    }
    
    @IBAction func done(){
        if let itemToEdit = itemToEdit{
            itemToEdit.text = todoTextField.text!
            delegate?.itemDetailViewControllerDelegate(self, didFinishEditingitem: itemToEdit)
        }else{
            let item =  CheckListItem()
            item.text = todoTextField.text!
            delegate?.itemDetailViewControllerDelegate(self, didFinishAdding: item)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let oldtext  = todoTextField.text!
            let stringRange = Range(range ,  in: oldtext)
            let newText = oldtext.replacingCharacters(in: stringRange! , with: string)
        if newText.isEmpty{
            doneButton.isEnabled = false
        }else{
            doneButton.isEnabled = true
        }
        return true
    }
    

}

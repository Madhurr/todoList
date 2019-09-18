//
//  checkListItem.swift
//  toDoList
//
//  Created by Madhur on 02/09/19.
//  Copyright © 2019 Madhur. All rights reserved.
//

import Foundation


class  CheckListItem : NSObject{
    var text = ""
    var checked = false
    
    
    
    func toggleChecked() {
        checked = !checked
    }
}

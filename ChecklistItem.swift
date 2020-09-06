//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Andrew Maher on 9/6/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import Foundation
class ChecklistItem: NSObject{
    var text = ""
    var checked = false
    
    init(text: String){
        self.text = text
    }
    
    func flipSwitch(){
        checked = !checked
    }
}

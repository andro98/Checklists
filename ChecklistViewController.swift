//
//  ChecklistViewController.swift
//  Checklists
//
//  Created by Andrew Maher on 9/6/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var items : [ChecklistItem]
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        items.append(ChecklistItem(text: "Walk The dog"))
        items.append(ChecklistItem(text: "Walk The cat"))
        items.append(ChecklistItem(text: "Buy food"))
        items.append(ChecklistItem(text: "Have a break"))
        items.append(ChecklistItem(text: "Study IOS"))
        items.append(ChecklistItem(text: "Yeahh!!"))
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            items[indexPath.row].flipSwitch()
            configureCheckmark(cell, with: items[indexPath.row])
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        configureText(for: cell, with: items[indexPath.row])
        configureCheckmark(cell, with: items[indexPath.row])
        return cell
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = items[indexPath.row].text
    }
    
    func configureCheckmark(_ cell: UITableViewCell, with item: ChecklistItem){
        if item.checked{
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
    }
}


//
//  ViewController.swift
//  Checklists
//
//  Created by Andrew Maher on 9/6/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            if cell.accessoryType == .none{
                cell.accessoryType = .checkmark
            }else{
                cell.accessoryType = .none
            }
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        switch indexPath.row % 5{
        case 0:
            label.text = "Walk the dog"
        case 1:
            label.text = "Brush my teeth"
        case 2:
            label.text = "Learn Ios Dev"
        case 3:
            label.text = "Soccer practice"
        case 4:
            label.text = "Eat ice cream"
        default:
            label.text = "Unknown task"
        }
        return cell
    }
}


//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Andrew Maher on 9/6/20.
//  Copyright © 2020 Andrew Maher. All rights reserved.
//

import UIKit

protocol ItemDetailDelegate: class{
    func addItemDidCancel(_ controller: ItemDetailV)
    func itemDetail(_ controller: ItemDetailV, didFinishAdding item: ChecklistItem)
    func itemDetail(_ controller: ItemDetailV, didFinishEditting item: ChecklistItem)
}

class ItemDetailV: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    var itemToEdit: ChecklistItem?
    
    weak var delegate: ItemDetailDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit{
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel(){
        navigationController?.popViewController(animated: true)
        delegate?.addItemDidCancel(self)
    }
    
    @IBAction func done(){
        if let itemToEdit = itemToEdit{
            itemToEdit.text = textField.text!
            delegate?.itemDetail(self, didFinishEditting: itemToEdit)
        }else{
        delegate?.itemDetail(self, didFinishAdding: ChecklistItem(text: textField.text!))
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)
        let newText = oldText.replacingCharacters(in: stringRange!, with: string)
        if newText.isEmpty{
            doneBarButton.isEnabled = false
        }else{
            doneBarButton.isEnabled = true
        }
        return true
    }

}

//
//  AddNoteViewController.swift
//  Chhabi_761355_Note
//
//  Created by MacStudent on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController, UITextViewDelegate {
    
   
    
    @IBOutlet weak var textView: UITextView!
    var newNotes: String?
    weak var notesTable: NotesTableViewController?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text = newNotes ?? ""
        
        }
    
    
    
    
//    override func viewWillDisappear(_ animated: Bool) {
//       taskTable?.updateText(text: textView.text)
//    }
    override func viewWillDisappear(_ animated: Bool) {
        
        folderData.foldersData[notesTable!.curIndx].notesName.append(textView.text!)
        notesTable?.tableView.reloadData()
    }

    





             //override func viewDidLoad() {
                 //super.viewDidLoad()
                 //Do textView create here
                 //If u create UITextView by IB, u also can finish next work in IB.
                 
//             }
    
    
        
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

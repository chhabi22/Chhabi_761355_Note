//
//  NotesTableViewController.swift
//  Chhabi_761355_Note
//
//  Created by MacStudent on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    @IBOutlet weak var screen: UIBarButtonItem!
    var curIndx = -1
    @IBOutlet weak var trash: UIBarButtonItem!
    var folderIndex: Int?
    @IBOutlet var notesTableView: UITableView!
    var delegateFolderCol:  FolderCollectionTableViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return folderData.foldersData[curIndx].notesName.count
        
    }
    
    // CELL FOR ROW AT
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath)
        
        
        cell.accessoryType = .detailButton

        cell.textLabel?.text = "\(folderData.foldersData[curIndx].notesName[indexPath.row])"
        return cell
    }
    



    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

         if let detailView = segue.destination as? AddNoteViewController {
                  detailView.notesTable = self

            }
        }
    
        override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if let cell = notesTableView.cellForRow(at: indexPath){
        if cell.accessoryType == .detailButton{
             
                  func updateText(text: String) {
                           //var newValue = text
                           
                    guard folderData.foldersData[indexPath.row].notesName != nil else {
                               return
                           }
//                            folderData.foldersData[indexPath.row].notesName.append(text)
//                                   tableView.reloadData()
            }
            
            }
            }
    }
            
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
          if let cell = tableView.cellForRow(at: indexPath){
          if cell.accessoryType == .detailButton{
             cell.accessoryType = .checkmark
              
          }
          else{
              cell.accessoryType = .detailButton
              }
         }
          
      }
    
    @IBAction func elipseAction(_ sender: UIBarButtonItem) {
        
        trash.isEnabled = !trash.isEnabled
        screen.isEnabled = !screen.isEnabled
        
    }
    
    
    @IBAction func trashDelete(_ sender: Any) {
        // alert
        let deleteNoteAlert = UIAlertController(title: "Delete ", message: "Are you sure?", preferredStyle: .alert)
        // cancel
        let cancelNote = UIAlertAction(title: "Cancel", style: .default)
        cancelNote.setValue(UIColor.brown, forKey: "titleTextColor")        // delete
        let deleteNote = UIAlertAction(title: "Delete", style: .default,handler:{[weak deleteNoteAlert]
            (_) in })
        deleteNote.setValue(UIColor.red, forKey: "titleTextColor")
        deleteNoteAlert.addAction(cancelNote)
       deleteNoteAlert.addAction(deleteNote)
        
        self.present(deleteNoteAlert, animated: true, completion: nil)    }
    
    
    
    
    
     //func updateText(text: String) {
        //folderData.foldersData[indexPath.row].notesName.append(text)
       // tableView.reloadData()
               
//    folderData.foldersData.[indexPath.row]notesName.append(text)
//               tableView.reloadData()
//
    
    
//        func updateText(text: String) {
//            guard folderData.foldersData != nil && curIndx != -1 else {
//                    return
//                }
//
//                notesArray![curIndx] = text
//        //        tableView.reloadData()
//                let indexPath = IndexPath(item: curIndx, section: 0)
//                tableView.reloadRows(at: [indexPath], with: .fade)
//            }
        
   
    


    override func viewWillDisappear(_ animated: Bool) {
        delegateFolderCol?.tableView.reloadData()
    }





}

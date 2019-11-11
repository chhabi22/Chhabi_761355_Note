//
//  FolderCollectionTableViewController.swift
//  Chhabi_761355_Note
//
//  Created by MacStudent on 2019-11-11.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class FolderCollectionTableViewController: UITableViewController {
    
    // connected name to table view controller
    @IBOutlet var foldersCollections: UITableView!
    // array of folders
    var foldersArray: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()

        foldersArray = []
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foldersArray?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "folderCell", for: indexPath)

        let numOfFolder = foldersArray![indexPath.row]
        cell.textLabel?.text = numOfFolder
        cell.imageView?.image = UIImage(named: "folder-icon")
        

        return cell
    }

// ------> add new folder action
    @IBAction func addNewFolder(_ sender: UIBarButtonItem) {
        
        let newFolderAlert = UIAlertController(title: "New Folder", message: "Enter a name for this folder", preferredStyle: .alert)
        newFolderAlert.addTextField()
        // add a new note
        let addFolderAction = UIAlertAction(title: "Add Item", style: .default, handler:{[weak newFolderAlert]
           (_) in
            let newNote = newFolderAlert?.textFields![0]
            self.foldersArray?.append(newNote!.text!)
            self.foldersCollections.reloadData()
        } )
        // cancel note
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        newFolderAlert.addAction(addFolderAction)
        newFolderAlert.addAction(cancelAction)
        
        self.present(newFolderAlert, animated: true, completion: nil)
    }
    
    
  // ------> move the rows in edit
       override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
           let moveFolder = foldersArray?[sourceIndexPath.item]
           foldersArray?.remove(at: sourceIndexPath.item)
          foldersArray?.insert(moveFolder!, at: destinationIndexPath.item)
       }
    
    // REMOVE DELETE IN EDIT
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {

         return false

     }
    
     override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {

           return foldersCollections.isEditing ? .none : .delete

        }
    
  // -------------------------------------
     // SWIPE DELETE
       override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
           if editingStyle == .delete {
               foldersArray?.remove(at: indexPath.row)
               foldersCollections.deleteRows(at: [indexPath], with: .fade)
           }
       }
    @IBAction func editFolders(_ sender: UIBarButtonItem) {
        
        self.foldersCollections.isEditing = !self.foldersCollections.isEditing
        
        sender.title = (self.foldersCollections.isEditing) ? "Done" : "Edit"    }
    
    
    
    
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

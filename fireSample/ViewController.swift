//
//  ViewController.swift
//  fireSample
//
//  Created by Mohan K on 05/04/23.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var postData = [String]()
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSetup()
        ref = Database.database().reference()

        databaseHandle = ref?.child("Notes").observe(.childAdded, with: { (DataSnapshot)in
            let post = DataSnapshot.value as? String
            if let actualPost = post{
                self.postData.append(actualPost)
                self.tableView.reloadData()
            }
        })
        // Do any additional setup after loading the view.
    }

    func tableSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
// MARK: - UITabeleView Setup
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell =  tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        postData.remove(at: 0)
        let indexPath = IndexPath(item: 0, section: 0)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
}

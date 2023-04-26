//
//  composeViewController.swift
//  fireSample
//
//  Created by Mohan K on 06/04/23.
//

import UIKit
import FirebaseDatabase
import Firebase

class composeViewController: UIViewController {

    @IBOutlet weak var contentText: UITextView!
    var ref: DatabaseReference?

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addContent(_ sender: Any) {
//        presentingViewController?.dismiss(animated: true, completion: nil)
//        fatalError()
        ref?.child("Notes").childByAutoId().setValue(contentText.text)
    }
 
    
    
    @IBAction func cancelContent(_ sender: Any) {
        presentingViewController?.dismiss(animated: true, completion: nil)

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

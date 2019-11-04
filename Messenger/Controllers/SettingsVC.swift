//
//  SettingsVC.swift
//  Messenger
//
//  Created by Vitaliy Paliy on 11/4/19.
//  Copyright © 2019 PALIY. All rights reserved.
//

import UIKit
import Firebase

class SettingsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
            print(snapshot)
        }, withCancel: nil)
    }
    

    @IBAction func logoutButtonPressed(_ sender: Any) {
        signOutHandler()
    }
    
    func signOutHandler(){
        do{
            try Auth.auth().signOut()
        }catch{
            print("Error Logout: \(error.localizedDescription)")
        }
        let controller = storyboard?.instantiateViewController(identifier: "SignInVC") as! LoginVC
        view.window?.rootViewController = controller
        view.window?.makeKeyAndVisible()
    }
    
    
}
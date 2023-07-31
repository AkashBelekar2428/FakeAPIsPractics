//
//  UserDetailsViewController.swift
//  UserApi
//
//  Created by Akash Belekar on 06/04/23.
//

import UIKit

class UserDetailsViewController: UIViewController {
    @IBOutlet weak var idLbl:UILabel!
    @IBOutlet weak var bodyLbl:UILabel!
    @IBOutlet weak var postIdLbl:UILabel!
    @IBOutlet weak var usernameLbl:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func backBtn(){
        dismiss(animated: true)
    }
    

}

//
//  UserTVC.swift
//  UserApi
//
//  Created by Akash Belekar on 16/03/23.
//

import UIKit

class UserTVC: UITableViewCell {
    @IBOutlet weak var idLbl:UILabel!
    @IBOutlet weak var bodyLbl:UILabel!
    @IBOutlet weak var postIdLbl:UILabel!
    @IBOutlet weak var usernameLbl:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

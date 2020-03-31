//
//  UserTableViewCell.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    // IBOutlets
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var phoneNameLabel: UILabel!
    @IBOutlet weak var emailNameLabel: UILabel!
    
    var tapViewPostsAction : ((UITableViewCell) -> ())?
    
    // Observers Internal Properties
    var user: User? {
        didSet {
            setup()
        }
    }
    
    // MARK: Override Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // IBActions
    
    @IBAction func viewPostsAction() {
        tapViewPostsAction?(self)
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        userNameLabel.text = user?.name
        phoneNameLabel.text = user?.phone
        emailNameLabel.text = user?.email
    }
    
}

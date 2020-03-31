//
//  UsersViewController.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit
import KVNProgress

class UsersViewController: UIViewController {

    @IBOutlet weak var txtSearchBar: UITextField! {
        didSet {
            txtSearchBar.addTarget(self, action: #selector(searchUsers(_ :)), for: .editingChanged)
            txtSearchBar.delegate = self
        }
    }
    @IBOutlet weak var usersTableView: UITableView! {
        didSet {
            usersTableView.register(UserTableViewCell.nib, forCellReuseIdentifier: "cell")
            usersTableView.tableFooterView = UIView()
        }
    }

    let viewModel = UsersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
    }
    
    @objc private func searchUsers(_ textField: UITextField) {
        viewModel.users.removeAll()
        if textField.text?.count != 0 {
            for user in viewModel.originalUsersList {
                guard let userToSearch = textField.text else { return }
                let range = user.name?.lowercased().range(of: userToSearch, options: .caseInsensitive, range: nil, locale: nil)
                if range != nil {
                    viewModel.users.append(user)
                }
            }
        } else {
            for user in viewModel.originalUsersList {
                viewModel.users.append(user)
            }
        }
        
        usersTableView.reloadData()
    }

    private func getUsers() {
        KVNProgress.show()
        viewModel.getUsers() { [weak self] (success, error) in
            KVNProgress.dismiss()
            guard let strongSelf = self else { return }
            
            if let error = error {
                strongSelf.presentAlertError(error)
            } else if let success = success {
                if success {
                    strongSelf.usersTableView.reloadData()
                }
            }
        }
    }
    
}


//
//  UserViewController.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit
import KVNProgress

class UserViewController: UIViewController {
    
    @IBOutlet weak var nameLAbel: UILabel! {
        didSet { 
            nameLAbel.text = viewModel.user?.name
        }
    }
    @IBOutlet weak var celLabel: UILabel! {
        didSet {
            if let phone = viewModel.user?.phone {
                celLabel.text = "Cel: \(phone)"
            } else {
                celLabel.text = "Cel: XXX XXXXXXX"
            }
            
        }
    }
    @IBOutlet weak var emailLabel: UILabel! {
        didSet {
            if let email = viewModel.user?.email {
                emailLabel.text = "Email: \(email)"
            } else  {
                emailLabel.text = "Email: XX@XXX.com"
            }
            
        }
    }
    @IBOutlet weak var postsTableView: UITableView! {
        didSet {
            postsTableView.tableFooterView = UIView()
        }
    }
    
    let viewModel = UserViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.user?.name
        navigationController?.navigationBar.tintColor = .white
        getPosts()
    }

    private func getPosts() {
        KVNProgress.show()
        viewModel.getPosts(userId: viewModel.user?.id) { [weak self] (success, error) in
            KVNProgress.dismiss()
            guard let strongSelf = self else { return }
            
            if let error = error {
                strongSelf.presentAlertError(error)
            } else if let success = success {
                if success {
                    strongSelf.postsTableView.reloadData()
                }
            }
        }
    }
    
}

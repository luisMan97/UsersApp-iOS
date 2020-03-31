//
//  UsersVCExtension.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

extension UsersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfUsers == 0 ? tableView.setEmptyMessage(message: "List is empty") : tableView.removeEmptyMessage()
        
        return viewModel.numberOfUsers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
       
        cell.user = viewModel.users[indexPath.row]
        cell.tapViewPostsAction = tapViewPostsAction

        return cell
    }
    
    private func tapViewPostsAction(_ cell: UITableViewCell) -> () {
        guard let userViewController: UserViewController = storyboard?.instantiateViewController(withIdentifier: .userViewController),
            let indexPath = usersTableView.indexPath(for: cell) else { return }
        userViewController.viewModel.user = viewModel.users[indexPath.row]
        txtSearchBar.resignFirstResponder()
        navigationController?.pushViewController(userViewController, animated: true)
    }
    
}

extension UsersViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtSearchBar.resignFirstResponder()
        return true
    }
    
}

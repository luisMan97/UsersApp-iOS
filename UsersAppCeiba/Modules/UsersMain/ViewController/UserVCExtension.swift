//
//  UserVCExtension.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

extension UserViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfPosts == 0 ? tableView.setEmptyMessage(message: "List is empty") : tableView.removeEmptyMessage()

        return viewModel.numberOfPosts
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
       
        cell.selectionStyle = .none
        cell.textLabel?.text = viewModel.posts[indexPath.row].title
        cell.detailTextLabel?.text = viewModel.posts[indexPath.row].body

        return cell
    }
    
}

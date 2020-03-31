//
//  UIViewControllerExtension.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Remove the back button title from the all navigation bars
    
    open override func awakeFromNib() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
        
    // MARK: - Utils
    
    func presentAlertWith(title: String = "", message: String, leftActionText: String? = nil, rightActionText: String? = nil, leftHandler: AlertActionHandler = nil, rightHandler: AlertActionHandler = nil) {
        let alert = UIAlertController.alertWith(title: title, message: message, leftActionText: leftActionText, rightActionText: rightActionText, leftHandler: leftHandler, rightHandler: rightHandler)
        present(alert, animated: true, completion: nil)
    }
    
    func presentAlertError(_ error: Error, title: String = "error", rightHandler: AlertActionHandler = nil) {
        presentAlertWith(title: title, message: error.localizedDescription, rightHandler: rightHandler)
    }
    
    func presentAlertErrorWith(title: String = "error", message: String, rightHandler: AlertActionHandler = nil) {
        presentAlertWith(title: title, message: message, rightHandler: rightHandler)
    }
    
}

//
//  UIViewExtension.swift
//  UsersAppCeiba
//
//  Created by Jorge Luis Rivera Ladino on 24/03/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import UIKit

extension UIView {

    // MARK: - Load nib for cell
    
    public class var nib: UINib? {
        if let _ = Bundle.main.path(forResource: nibName, ofType: "nib") {
            return UINib(nibName: nibName, bundle: nil)
        } else {
            return nil
        }
    }
    
    // MARK: - Load nib
    
    public class var nibName: String {
        let name = String(describing: self).components(separatedBy: ".").first ?? ""
        return name
    }

}
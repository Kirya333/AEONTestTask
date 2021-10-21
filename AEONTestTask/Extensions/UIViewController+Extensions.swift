//
//  UIViewController+Extensions.swift
//  AEONTestTask
//
//  Created by Кирилл Тарасов on 21.10.2021.
//

import UIKit

extension UIViewController {
    
    func showAlert() {
        let alertTitle = "Try again"
        let alertMessage = "Incorrect username or password entered"
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

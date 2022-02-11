//
//  ActivityIndicatorViewController.swift
//  buggsyK
//
//  Created by Felipe Montoya on 2/10/22.
//

import Foundation
import UIKit

class ActivityIndicatorViewController: UIViewController {

    private var indicator = UIActivityIndicatorView(style: .large)
    private var label = UILabel()
    

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.97)
        view.isUserInteractionEnabled = false
        label.text = "Setting Up..."
        label.font = .boldSystemFont(ofSize: 15.0)
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        view.addSubview(indicator)
        view.addSubview(label)

    //TODO: Constraints issues!!
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

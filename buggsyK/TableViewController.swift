//
//  TableViewController.swift
//  buggsyK
//
//  Created by Felipe Montoya on 2/10/22.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var users: [User] = [] { //TODO: Users unsafely unwrapped
        didSet {
            //TODO: Excessive Usage -  Load table view information and calculate for a  long time the footer description.
            let text = !users.isEmpty ? "\(users.count) active twitter users" : ":( No users"
            self.footerLabel.text = text
            self.tableView.reloadData()
            //TODO:  Excessive Usage -  Load table view information and did set observer for label title calls again for an update.
        }
    }
    
    private var footerLabel: UILabel! = {
        //TODO: UI - Layout!!
        let label = UILabel(frame: CGRect(x: 13.0, y: .zero, width: .zero, height: 40.0))
        label.text = "Buggsy by Kodemia"
        label.font = .boldSystemFont(ofSize: 24.0)
        return label
    }()
    
    private var setRefreshControl: () -> UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action:
                            #selector(handleRefreshControl),
                            for: .valueChanged)
       
        return control
    }
    
        
    @objc private func handleRefreshControl() {
        requestUsersData()
    }
    
    private func composeUI() {
        tableView.tableFooterView = footerLabel
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NormalCellType")
        
    }
    
 
    private func requestUsersData() {
        APIClient.downloadUsers { result in
            //TODO: Memory 2 - Add to models!
            DispatchQueue.main.async {
                self.tableView.refreshControl?.endRefreshing()
                switch result {
                case .success(let users):
                    self.users = users
                case .failure(_):
                    //TODO: Handle error
                    break
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        composeUI()
        tableView.refreshControl = setRefreshControl()
        requestUsersData()
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //TODO: Layout 3 - No tableViewsCell showing
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO: Memory 1 - Add a lot of UITableViewsCells
        let cell = tableView.dequeueReusableCell(withIdentifier: "NormalCellType", for: indexPath)
        cell.textLabel?.text = "@\(users[indexPath.row].username)"
        cell.imageView?.image = UIImage(imageLiteralResourceName: "twitter-bird")
        cell.isUserInteractionEnabled = false
        return cell
    }

}


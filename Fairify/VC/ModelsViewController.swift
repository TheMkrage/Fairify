//
//  ModelsViewController.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit
import Anchorage

class ModelsViewController: UIViewController {
    
    var models = [Model]()
    
    var ref: DatabaseReference!
    
    ref = Database.database().reference()
    
    var tableView: UITableView = {
        let t = UITableView()
        t.backgroundColor = .clear
        t.separatorStyle = .none
        t.rowHeight = UITableView.automaticDimension
        t.estimatedRowHeight = 100
        t.isUserInteractionEnabled = true
        return t
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .fairifyPurple

        view.addSubview(tableView)
        tableView.topAnchor == view.safeAreaLayoutGuide.topAnchor
        tableView.bottomAnchor == view.safeAreaLayoutGuide.bottomAnchor
        tableView.horizontalAnchors == view.horizontalAnchors
    }
}

extension ModelsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Model")
        let model = models[indexPath.row]
        cell.textLabel?.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        let vc = DashboardViewController(model: model)
        show(vc, sender: self)
    }
}

//
//  ModelsViewController.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit
import Anchorage
import FirebaseDatabase
import CodableFirebase

class ModelsViewController: UIViewController {
    
    var models = [Model]()
    
    var ref: DatabaseReference!
    
    var topLabel: UILabel = {
        let t = UILabel()
        t.textColor = .white
        t.text = "Your Models"
        t.textAlignment = .center
        t.font = UIFont(name: "HelveticaNeue-Bold", size: 28.0)
        return t
    }()
    
    lazy var topView: UIView = {
        let v = UIView()
        v.addSubview(topLabel)
        v.addSubview(backButton)
        v.backgroundColor = UIColor.darkPurple
        return v
    }()
    
    var tableView: UITableView = {
        let t = UITableView()
        t.backgroundColor = .clear
        t.separatorStyle = .none
        t.rowHeight = UITableView.automaticDimension
        t.estimatedRowHeight = 100
        t.isUserInteractionEnabled = true
        return t
    }()
    
    var backButton: UIButton = {
        let v = UIButton()
        v.isUserInteractionEnabled = true
        v.setImage(UIImage(named: "back"), for: .normal)
        v.tintColor = .white
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        view.addSubview(topView)
        
        ref = Database.database().reference()
        ref.child("models").observe(.value) { (snapshot) in
            guard let value = snapshot.value else { return }
            do {
                let models = try FirebaseDecoder().decode([Model].self, from: value)
                self.models = models
                self.tableView.reloadData()
            } catch let error {
                print(error)
            }
        }
        view.backgroundColor = .fairifyPurple

        view.addSubview(tableView)
        
        topView.topAnchor == view.topAnchor
        topView.horizontalAnchors == view.horizontalAnchors
        
        topLabel.topAnchor == view.safeAreaLayoutGuide.topAnchor + 25
        topLabel.leadingAnchor == view.leadingAnchor + 50
        topLabel.trailingAnchor == view.trailingAnchor - 50
        
        backButton.centerYAnchor == topLabel.centerYAnchor
        backButton.leadingAnchor == view.leadingAnchor + 20
        backButton.heightAnchor == 45
        backButton.widthAnchor == 45
        
        topView.bottomAnchor == topLabel.bottomAnchor + 25
        tableView.topAnchor == topView.bottomAnchor
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
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 24.0)
        cell.textLabel?.text = model.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        let vc = DashboardViewController(model: model)
        show(vc, sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}

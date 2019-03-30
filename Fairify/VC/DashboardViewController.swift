//
//  DashboardViewController.swift
//  Fairify
//
//  Created by Matthew Krager on 3/29/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit
import Anchorage

class DashboardViewController: UIViewController {
    
    var topLabel: UILabel = {
        let t = UILabel()
        t.textColor = .white
        t.text = "Ishaan Model"
        t.textAlignment = .center
        t.font = UIFont(name: "HelveticaNeue-Bold", size: 28.0)
        return t
    }()
    
    var backButton: UIButton = {
        let b = UIButton()
        return b
    }()
    
    var progressBar: ProgressBar = {
        let p = ProgressBar()
        return p
    }()
    
    var circleView: CircleView = {
        let c = CircleView(percent: 25)
        return c
    }()
    
    lazy var topView: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.darkPurple
        v.addSubview(topLabel)
        v.addSubview(backButton)
        v.addSubview(progressBar)
        v.addSubview(circleView)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        view.backgroundColor = .fairifyPurple
        view.addSubview(topView)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    @objc func fixPressed(_ sender: FixButton) {
        sender.showCheck()
    }
    
    func setupConstraints() {
        topView.topAnchor == view.topAnchor
        topView.horizontalAnchors == view.horizontalAnchors
        topView.bottomAnchor == circleView.bottomAnchor + 25
        
        topLabel.topAnchor == view.safeAreaLayoutGuide.topAnchor + 25
        topLabel.leadingAnchor == view.leadingAnchor + 50
        topLabel.trailingAnchor == view.trailingAnchor - 50
        
        backButton.centerYAnchor == topLabel.centerYAnchor
        backButton.leadingAnchor == view.leadingAnchor + 20
        
        circleView.topAnchor == topLabel.bottomAnchor + 20
        circleView.trailingAnchor == view.trailingAnchor - 30
        circleView.widthAnchor == 100
        circleView.heightAnchor == 100
        
        progressBar.leadingAnchor == view.leadingAnchor + 30
        progressBar.centerYAnchor == circleView.centerYAnchor
        progressBar.trailingAnchor == circleView.leadingAnchor - 30
        progressBar.heightAnchor == 40
        
        tableView.topAnchor == topView.bottomAnchor + 10
        tableView.horizontalAnchors == view.horizontalAnchors
        tableView.bottomAnchor == view.safeAreaLayoutGuide.bottomAnchor
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let a = Analogy()
        let cell = AnalogyTableViewCell(analogy: a)
        cell.staticAnalogyStartLabel.text = "Man"
        cell.staticAnalogyEndLabel.text = "Professor"
        cell.changingAnalogyStartLabel.text = "Woman"
        cell.changingAnalogyEndLabel.text = "Teacher"
        cell.contentView.isUserInteractionEnabled = true
        cell.fixButton.tag = indexPath.row
        cell.fixButton.addTarget(self, action: #selector(fixPressed(_:)), for: .touchUpInside)
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

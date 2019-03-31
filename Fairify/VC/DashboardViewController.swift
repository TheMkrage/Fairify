//
//  DashboardViewController.swift
//  Fairify
//
//  Created by Matthew Krager on 3/29/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit
import Anchorage
import CodableFirebase
import FirebaseDatabase

class DashboardViewController: UIViewController {
    
    lazy var topLabel: UILabel = {
        let t = UILabel()
        t.textColor = .white
        t.text = self.model.name
        t.textAlignment = .center
        t.font = UIFont(name: "HelveticaNeue-Bold", size: 28.0)
        return t
    }()
    
    lazy var progressBar: ProgressBar = {
        let p = ProgressBar(percent: Int(100 * self.model.percent))
        return p
    }()
    
    lazy var circleView: CircleView = {
        let c = CircleView(percent: Int(100 * self.model.percent))
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
    
    var backButton: UIButton = {
        let v = UIButton()
        v.isUserInteractionEnabled = true
        v.setImage(UIImage(named: "back"), for: .normal)
        v.tintColor = .white
        return v
    }()
    
    var interactiveButton: Button = {
        let b = Button()
        b.setTitle("Interact with Your Model", for: .normal)
        return b
    }()
    
    var model: Model
    
    var filteredAnalogies: [Analogy] {
        get {
            guard let analogies = model.analogies else {
                return []
            }
            return analogies.sorted { (a1, a2) -> Bool in
                return a1.isUser || a1.taboolaUrl != nil
            }
        }
    }
    
    var ref: DatabaseReference!
    
    init(model: Model) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        
        interactiveButton.addTarget(self, action: #selector(interactivePressed(_:)), for: .touchUpInside)
        
        ref = Database.database().reference()
        ref.child("models").observe(.value) { (snapshot) in
            guard let value = snapshot.value else { return }
            do {
                let models = try FirebaseDecoder().decode([Model].self, from: value)
                let first = models.first!
                self.model = first
                for i in 0..<(self.model.analogies?.count ?? 0) {
                    let analogy = self.model.analogies![i]
                    analogy.index = i
                }
                // update view
                let percent = Int(100.0 * first.percent)
                self.circleView.percentLabel.text = "\(percent)%"
                self.progressBar.percent = percent
                self.tableView.reloadData()
            } catch let error {
                print(error)
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self

        view.backgroundColor = .fairifyPurple
        view.addSubview(topView)
        view.addSubview(tableView)
        view.addSubview(interactiveButton)
        
        setupConstraints()
    }
    
    @objc func interactivePressed(_ sender: UIButton) {
        let vc = InteractiveViewController()
        present(vc, animated: true, completion: nil)
    }
    
    @objc func fixPressed(_ sender: FixButton) {
        sender.showCheck()
        let analogy = filteredAnalogies[sender.tag]
        let cell = tableView.cellForRow(at: IndexPath(row: sender.tag, section: 0)) as! AnalogyTableViewCell
        cell.changingAnalogyEndLabel.state = .green
        cell.changingAnalogyEndLabel.text = analogy.staticEndAnalogy
        // set all starting vectors
        cell.vectorView.setStaticStartArrow(point: CGPoint.init(x: analogy.staticStartVectorAfterX, y: analogy.staticStartVectorAfterY))
        cell.vectorView.setStaticEndArrow(point: CGPoint.init(x: analogy.staticEndVectorAfterX, y: analogy.staticEndVectorAfterY))
        cell.vectorView.setChangingStartArrow(point: CGPoint.init(x: analogy.changingStartVectorAfterX, y: analogy.changingStartVectorAfterY))
        cell.vectorView.setChangingEndArrow(point: CGPoint.init(x: analogy.changingEndVectorAfterX, y: analogy.changingEndVectorAfterY))
        
        guard let index = analogy.index else {
            return
        }
        ref.child("models").child("0").child("analogies").child("\(index)").updateChildValues(["should_fix": true])
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
        backButton.heightAnchor == 45
        backButton.widthAnchor == 45
        
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
        
        interactiveButton.widthAnchor == 250
        interactiveButton.heightAnchor == 45
        interactiveButton.bottomAnchor == view.safeAreaLayoutGuide.bottomAnchor - 15
        interactiveButton.trailingAnchor == view.safeAreaLayoutGuide.trailingAnchor - 15
    }
}

extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredAnalogies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = AnalogyTableViewCell()
        let analogy = filteredAnalogies[indexPath.row]
        cell.staticAnalogyStartLabel.text = analogy.staticStartAnalogy
        cell.staticAnalogyEndLabel.text = analogy.staticEndAnalogy
        cell.changingAnalogyStartLabel.text = analogy.changingStartAnalogy
        cell.changingAnalogyEndLabel.text = analogy.changingEndAnalogy
        cell.isDisplayedTaboolaHeader = analogy.taboolaUrl != nil
        cell.contentView.isUserInteractionEnabled = true
        cell.fixButton.tag = indexPath.row
        cell.fixButton.addTarget(self, action: #selector(fixPressed(_:)), for: .touchUpInside)
        
        if analogy.isFixed || analogy.shouldFix {
            cell.fixButton.showCheck()
        } else {
            cell.fixButton.showFix()
        }
        
        cell.layoutIfNeeded()
        
        // set all starting vectors
        cell.vectorView.setStaticStartArrow(point: CGPoint.init(x: analogy.staticStartVectorBeforeX, y: analogy.staticStartVectorBeforeY))
        cell.vectorView.setStaticEndArrow(point: CGPoint.init(x: analogy.staticEndVectorBeforeX, y: analogy.staticEndVectorBeforeY))
        cell.vectorView.setChangingStartArrow(point: CGPoint.init(x: analogy.changingStartVectorBeforeX, y: analogy.changingStartVectorBeforeY))
        cell.vectorView.setChangingEndArrow(point: CGPoint.init(x: analogy.changingEndVectorBeforeX, y: analogy.changingEndVectorBeforeY))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

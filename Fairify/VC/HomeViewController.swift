//
//  ViewController.swift
//  Adjust
//
//  Created by Matthew Krager on 3/29/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit
import Anchorage
import FirebaseDatabase
import CodableFirebase

class HomeViewController: UIViewController {
    
    var titleLabel: FairifyLabel = {
        let l = FairifyLabel(fontSize: 48.0)
        return l
    }()
    
    var promoLabel: UILabel = {
        let l = UILabel()
        l.text = "Don't promote bias!\nFix your models using Fairify"
        l.textColor = .white
        l.textAlignment = .center
        l.numberOfLines = 0
        l.font = UIFont(name: "HelveticaNeue", size: 22.0)
        return l
    }()
    
    var guyImage: UIImageView = {
        let i = UIImageView(image: UIImage(named: "CartoonGuy"))
        return i
    }()
    
    var girlImage: UIImageView = {
        let i = UIImageView(image: UIImage(named: "CartoonGirl"))
        return i
    }()
    
    var waitingForModel: UILabel = {
        let i = UILabel()
        i.textColor = .white
        i.font = UIFont(name: "HelveticaNeue", size: 18.0)
        i.text = "Waiting for Model..."
        return i
    }()
    
    var handle: UInt = 0
    
    var ref: DatabaseReference!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print(handle)
        ref.child("models").removeObserver(withHandle: handle)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        handle = ref.child("models").observe(.value) { (snapshot) in
            guard let value = snapshot.value else { return }
            do {
                let models = try FirebaseDecoder().decode([Model].self, from: value)
                let first = models.first!
                let vc = DashboardViewController(model: first)
                self.show(vc, sender: self)
            } catch let error {
                print(error)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
        sleep(2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        setNeedsStatusBarAppearanceUpdate()
        view.backgroundColor = UIColor.fairifyPurple
        
        ref = Database.database().reference()
        
        view.addSubview(titleLabel)
        view.addSubview(promoLabel)
        view.addSubview(guyImage)
        view.addSubview(girlImage)
        view.addSubview(waitingForModel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        titleLabel.topAnchor == view.safeAreaLayoutGuide.topAnchor + 40
        titleLabel.centerXAnchor == view.centerXAnchor
        
        promoLabel.topAnchor == titleLabel.bottomAnchor + 30
        promoLabel.leadingAnchor == view.leadingAnchor + 30
        promoLabel.trailingAnchor == view.trailingAnchor - 30
   
        girlImage.leadingAnchor == view.leadingAnchor + 60
        girlImage.centerYAnchor == view.centerYAnchor + 25
        girlImage.heightAnchor == 203
        girlImage.widthAnchor == 111
        
        guyImage.trailingAnchor == view.trailingAnchor - 60
        guyImage.bottomAnchor == girlImage.bottomAnchor
        guyImage.heightAnchor == 260
        guyImage.widthAnchor == 74
        
        waitingForModel.centerXAnchor == view.centerXAnchor
        waitingForModel.topAnchor == girlImage.bottomAnchor + 60
    }
}

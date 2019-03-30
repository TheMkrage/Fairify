//
//  ViewController.swift
//  Adjust
//
//  Created by Matthew Krager on 3/29/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit
import Anchorage

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

    var myModelsButton: UIButton = {
        let b = UIButton()
        b.setTitle("My Models", for: .normal)
        b.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 24.0)
        b.addTarget(self, action: #selector(moveToDashboard(_:)), for: .touchUpInside)
        b.backgroundColor = UIColor.darkPurple
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.borderWidth = 3.0
        b.layer.cornerRadius = 25.0
        return b
    }()
    
    var communityButton: UIButton = {
        let b = UIButton()
        b.setTitle("Fairify Community", for: .normal)
        b.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 24.0)
        b.addTarget(self, action: #selector(moveToCommunity(_:)), for: .touchUpInside)
        b.backgroundColor = .gray
        b.backgroundColor = UIColor.darkPurple
        b.layer.borderColor = UIColor.white.cgColor
        b.layer.borderWidth = 3.0
        b.layer.cornerRadius = 25.0
        return b
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.fairifyPurple
        
        view.addSubview(titleLabel)
        view.addSubview(promoLabel)
        view.addSubview(myModelsButton)
        view.addSubview(communityButton)
        
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupConstraints() {
        titleLabel.topAnchor == view.safeAreaLayoutGuide.topAnchor + 40
        titleLabel.centerXAnchor == view.centerXAnchor
        
        promoLabel.topAnchor == titleLabel.bottomAnchor + 30
        promoLabel.leadingAnchor == view.leadingAnchor + 30
        promoLabel.trailingAnchor == view.trailingAnchor - 30

        myModelsButton.topAnchor == promoLabel.bottomAnchor + 50
        myModelsButton.leadingAnchor == view.leadingAnchor + 40
        myModelsButton.trailingAnchor == view.trailingAnchor - 40
        
        communityButton.topAnchor == myModelsButton.bottomAnchor + 50
        communityButton.leadingAnchor == view.leadingAnchor + 40
        communityButton.trailingAnchor == view.trailingAnchor - 40
        communityButton.bottomAnchor == view.safeAreaLayoutGuide.bottomAnchor - 30
        communityButton.heightAnchor == myModelsButton.heightAnchor
    }
    
    @objc private func moveToDashboard(_ sender: UIButton) {
        let vc = ModelsViewController()
        show(vc, sender: self)
    }
    
    @objc private func moveToCommunity(_ sender: UIButton) {
        let vc = CommunityViewController()
        show(vc, sender: self)
    }
}

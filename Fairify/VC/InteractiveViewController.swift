//
//  InteractiveViewController.swift
//  Fairify
//
//  Created by Matthew Krager on 3/30/19.
//  Copyright © 2019 Matthew Krager. All rights reserved.
//

import UIKit
import Anchorage
import Firebase
import CodableFirebase

class InteractiveViewController: UIViewController {
    
    var topLabel: UILabel = {
        let t = UILabel()
        t.textColor = .white
        t.text = "Interactive Model"
        t.textAlignment = .center
        t.font = UIFont(name: "HelveticaNeue-Bold", size: 28.0)
        return t
    }()
    
    lazy var topView: UIView = {
        let v = UIView()
        v.addSubview(topLabel)
        v.backgroundColor = UIColor.darkPurple
        return v
    }()
    
    var staticAnalogyStart: TextField = {
        let s = TextField()
        return s
    }()
    
    var staticAnalogyEnd: TextField = {
        let s = TextField()
        return s
    }()
    
    var changingAnalogyStart: TextField = {
        let s = TextField()
        return s
    }()
    
    var changingAnalogyEnd: TextFieldLookingButton = {
        let b = TextFieldLookingButton()
        return b
    }()
    
    var isToLabel1: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.text = "is to"
        l.textAlignment = .center
        l.font = UIFont(name: "HelveticaNeue-Medium", size: 16.0)
        return l
    }()
    
    var isToLabel2: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.text = "is to"
        l.textAlignment = .center
        l.font = UIFont(name: "HelveticaNeue-Medium", size: 16.0)
        return l
    }()
    
    var asLabel: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.text = "as"
        l.textAlignment = .center
        l.font = UIFont(name: "HelveticaNeue-Bold", size: 24.0)
        return l
    }()
    
    var xButton: UIButton = {
        let b = UIButton()
        b.isUserInteractionEnabled = true
        b.setTitleColor(.white, for: .normal)
        b.setTitle("x", for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 28.0)
        return b
    }()
    
    var ref: DatabaseReference!
    
    var markAsBiasedButton: Button = {
        let b = Button()
        b.isUserInteractionEnabled = true
        b.backgroundColor = UIColor.buttonRed
        b.setTitleColor(UIColor.white, for: .normal)
        b.setTitle("Mark as Biased", for: .normal)
        b.layer.borderColor = UIColor.progressBarRed.cgColor
        return b
    }()
    
    var progress: UIActivityIndicatorView = {
        let a = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.white)
        
        return a
    }()
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        ref.child("interactive").child("b2").removeAllObservers()
        var d = [String: Any]()
        d["a1"] = ""
        d["a2"] = ""
        d["b1"] = ""
        d["b2"] = ""
        d["biased"] = false
        ref.child("interactive").updateChildValues(d)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        changingAnalogyStart.delegate = self
        staticAnalogyStart.delegate = self
        staticAnalogyEnd.delegate = self
        
        ref = Database.database().reference()
        ref.child("interactive").child("b2").observe(.value) { (snapshot) in
            if let val = snapshot.value as? String, val != "" {
                self.changingAnalogyEnd.isGreenMode = false
                self.changingAnalogyEnd.setTitle(val.capitalized, for: .normal)
                self.markAsBiasedButton.isHidden = false
                self.progress.stopAnimating()
            }
        }
        
        xButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        changingAnalogyEnd.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        markAsBiasedButton.addTarget(self, action: #selector(markAsBiased), for: .touchUpInside)
        
        view.backgroundColor = UIColor.fairifyPurple
        
        view.addSubview(topView)

        view.addSubview(staticAnalogyStart)
        view.addSubview(staticAnalogyEnd)
        view.addSubview(changingAnalogyStart)
        view.addSubview(changingAnalogyEnd)
        
        view.addSubview(isToLabel1)
        view.addSubview(isToLabel2)
        
        view.addSubview(xButton)
        view.addSubview(markAsBiasedButton)
        view.addSubview(progress)
        
        markAsBiasedButton.isHidden = true
        progress.stopAnimating()
        
        setupConstraints()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc func calculate() {
        var d = [String: Any]()
        d["a1"] = staticAnalogyStart.text
        d["a2"] = staticAnalogyEnd.text
        d["b1"] = changingAnalogyStart.text
        ref.child("interactive").updateChildValues(d)
        progress.startAnimating()
    }
    
    @objc func markAsBiased() {
        var d = [String: Any]()
        d["biased"] = true
        ref.child("interactive").updateChildValues(d)
        self.dismiss(animated: true, completion: nil)
    }

    func setupConstraints() {
        topView.topAnchor == view.topAnchor
        topView.horizontalAnchors == view.horizontalAnchors
        topView.bottomAnchor == topLabel.bottomAnchor + 25
        
        topLabel.topAnchor == view.safeAreaLayoutGuide.topAnchor + 25
        topLabel.leadingAnchor == view.leadingAnchor + 50
        topLabel.trailingAnchor == view.trailingAnchor - 50
        
        staticAnalogyStart.topAnchor == topView.bottomAnchor + 40
        staticAnalogyStart.leadingAnchor == view.leadingAnchor + 25
        staticAnalogyStart.trailingAnchor == isToLabel1.leadingAnchor - 7
        staticAnalogyStart.widthAnchor == staticAnalogyEnd.widthAnchor
        staticAnalogyStart.heightAnchor == 38
        
        isToLabel1.centerYAnchor == staticAnalogyStart.centerYAnchor
        isToLabel1.trailingAnchor == staticAnalogyEnd.leadingAnchor - 7
        
        staticAnalogyEnd.trailingAnchor == view.trailingAnchor - 25
        staticAnalogyEnd.centerYAnchor == staticAnalogyStart.centerYAnchor
        staticAnalogyEnd.heightAnchor == 38
        
        changingAnalogyStart.topAnchor == staticAnalogyEnd.bottomAnchor + 40
        changingAnalogyStart.leadingAnchor == view.leadingAnchor + 25
        changingAnalogyStart.trailingAnchor == isToLabel2.leadingAnchor - 7
        changingAnalogyStart.widthAnchor == changingAnalogyEnd.widthAnchor
        changingAnalogyStart.heightAnchor == 38
        
        isToLabel2.centerYAnchor == changingAnalogyStart.centerYAnchor
        isToLabel2.trailingAnchor == changingAnalogyEnd.leadingAnchor - 7
        
        changingAnalogyEnd.trailingAnchor == view.trailingAnchor - 25
        changingAnalogyEnd.centerYAnchor == changingAnalogyStart.centerYAnchor
        changingAnalogyEnd.heightAnchor == 38
        
        markAsBiasedButton.centerXAnchor == view.centerXAnchor
        markAsBiasedButton.topAnchor == changingAnalogyEnd.bottomAnchor + 45
        markAsBiasedButton.widthAnchor == 250
        markAsBiasedButton.heightAnchor == 45
        
        progress.centerAnchors == markAsBiasedButton.centerAnchors
        progress.heightAnchor == 60
        progress.widthAnchor == 60
        
        xButton.topAnchor == view.safeAreaLayoutGuide.topAnchor + 15
        xButton.leadingAnchor == view.safeAreaLayoutGuide.leadingAnchor + 20
    }
}

extension InteractiveViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.changingAnalogyEnd.isGreenMode = true
        markAsBiasedButton.isHidden = true
        return true
    }
}

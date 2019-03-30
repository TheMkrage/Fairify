import UIKit

class CardView: UIView {
    
    static var cardRadius: CGFloat = 9.0
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    func initialize() {
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = false
        self.layer.cornerRadius = CardView.cardRadius
        self.layer.shadowColor = UIColor.init(named: "shadow")?.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        self.layer.shadowOpacity = 0.30
        self.layer.shadowRadius = 6.0
    }
}

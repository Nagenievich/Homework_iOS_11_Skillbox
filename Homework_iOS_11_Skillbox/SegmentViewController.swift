
import UIKit

protocol SegmentViewControllerDelegate: NSObjectProtocol {
    func pressed()
}

class SegmentViewController: UIViewController {
    //
    @IBOutlet weak var fonView: UIView!
    @IBOutlet weak var buttonView: UIView!
    //
    @IBOutlet weak var checkButtonOne: NSLayoutConstraint!
    @IBOutlet weak var checkButtonTwo: NSLayoutConstraint!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fonView.layer.cornerRadius = 10
        buttonView.layer.cornerRadius = 9
        checkButtonTwo.priority = UILayoutPriority(rawValue: 950)
    }
    
    weak var delegate: SegmentViewControllerDelegate?
    
    @IBAction func leftButton(_ sender: Any) {
        checkButtonOne.priority = UILayoutPriority(rawValue: 950)
        checkButtonTwo.priority = UILayoutPriority(rawValue: 750)
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        print("Left")
        delegate?.pressed()
    }
    
    @IBAction func rightButton(_ sender: Any) {
        checkButtonOne.priority = UILayoutPriority(rawValue: 750)
        checkButtonTwo.priority = UILayoutPriority(rawValue: 950)
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
        }
        print("Right")
        delegate?.pressed()
    }
}

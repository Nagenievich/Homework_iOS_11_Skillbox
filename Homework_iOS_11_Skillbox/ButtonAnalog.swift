
import UIKit

protocol TestViewDelegate: NSObjectProtocol{
    func testView()
}

@IBDesignable class ButtonAnalog: UIView {
    
    weak var delegate: TestViewDelegate?
    var isSetuped = false
   @IBInspectable var imageSize: CGFloat = 10 {
        didSet { layoutIfNeeded() }
    }
    var labelSizeWidth: CGFloat = 100
    var labelSizeHeight: CGFloat = 40
    @IBInspectable var color: UIColor = .cyan {
        didSet { layoutIfNeeded() }
    }
    @IBInspectable var colorImage: UIColor = .brown {
        didSet { layoutIfNeeded() }
    }
    //
    private let image = UIImageView()
    private let label = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = color
        
        let w = frame.size.width
        let h = frame.size.height
        let cornerRadius: CGFloat = 4
        
        let imageWidth = w - imageSize
        let imageHeight = h - imageSize
        
        image.frame = CGRect(x: w / 2 - imageWidth / 2 , y: h / 2 - imageHeight / 2, width: imageWidth, height: imageHeight)
        
        label.frame = CGRect(x: w / 2 - labelSizeWidth / 2, y: h / 2 - labelSizeHeight / 2, width: labelSizeWidth, height: labelSizeHeight)
       
        image.backgroundColor = colorImage
        label.backgroundColor = UIColor.red
        image.layer.cornerRadius = cornerRadius
        
        layer.cornerRadius = cornerRadius
        
        if isSetuped { return }
        isSetuped = true
        
        delegate?.testView()
        
        for i in [image, label] {
            addSubview(i)
        }
    }
}


import UIKit


//@IBDesignable
class ClockView: UIView {
  
    var isSetuped = false
    
    var markerSize: CGFloat   = 4
    var markerLenght: CGFloat = 12
    var markerColor = UIColor.blue
    
    var lineSize: CGFloat         = 8
    var minuteLineSize: CGFloat   = 6
    var secondLineSize: CGFloat   = 4
    
    @IBInspectable var lineOffset: CGFloat       = 40 {
        didSet { layoutIfNeeded() }
    }
    @IBInspectable var minuteLineOffset: CGFloat = 30 {
        didSet { layoutIfNeeded() }
    }
    @IBInspectable var secondLineOffset: CGFloat = 25 {
        didSet { layoutIfNeeded() }
    }
    
    
    @IBInspectable var lineColor: UIColor       = UIColor.blue {
        didSet { hourLine.backgroundColor = lineColor }
    }
    
    @IBInspectable var minuteLineColor: UIColor = UIColor.green {
        didSet { minuteLine.backgroundColor = minuteLineColor }
    }
    
    @IBInspectable var secondLineColor: UIColor = UIColor.brown {
        didSet { secondLine.backgroundColor = secondLineColor }
    }
    
    @IBInspectable var roundedColor: UIColor    = UIColor.cyan {
        didSet { roundedView.backgroundColor = roundedColor }
    }
    
    private let top     = UIView()
    private let bottom  = UIView()
    private let left    = UIView()
    private let right   = UIView()
    
    private let hourLine   = UIView()
    private let minuteLine = UIView()
    private let secondLine = UIView()
    private let roundedView = UIView()
    
    func updateHour(date: Date) {
        let cal = Calendar.current
        let hour = cal.component(.hour, from: date)
       
        let hourAngle = CGFloat.pi * 2 * (CGFloat(hour) / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: hourAngle)
        
    }
    
    func updateMinute(date: Date) {
        let cal = Calendar.current
        let minute = cal.component(.minute, from: Date())
        
        let minuteAngle = CGFloat.pi * 2 * (CGFloat(minute) / CGFloat(60))
        minuteLine.transform = CGAffineTransform(rotationAngle: minuteAngle)

    }
    
    func updateSecond(date: Date) {
        let cal = Calendar.current
        let second = cal.component(.second, from: date)
        
        let secondAngle = CGFloat.pi * 2 * (CGFloat(second) / CGFloat(60))
        secondLine.transform = CGAffineTransform(rotationAngle: secondAngle)
        
    }
    
    @objc func tick() {
        updateHour(date: Date())
        updateMinute(date: Date())
        updateSecond(date: Date())
    }
     
    func startTimer(){
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
            RunLoop.main.add(timer, forMode: RunLoop.Mode.common)
        }
    
    
    func updateViews() {
        
       
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        
        let w = frame.size.width
        let h = frame.size.height
        
       
        hourLine.frame = CGRect(x: w / 2 - lineSize / 2, y: lineOffset, width: lineSize, height: h / 2 - lineOffset)
        hourLine.layer.cornerRadius = 4
        hourLine.backgroundColor = lineColor
        
        minuteLine.frame = CGRect(x: w / 2 - minuteLineSize / 2, y: minuteLineOffset, width: minuteLineSize, height: h / 2 - minuteLineOffset)
        minuteLine.layer.cornerRadius = 3
        minuteLine.backgroundColor = minuteLineColor
        
        secondLine.frame = CGRect(x: w / 2 - secondLineSize / 2, y: secondLineOffset, width: secondLineSize, height: h / 2 - secondLineOffset)
        secondLine.layer.cornerRadius = 2
        secondLine.backgroundColor = secondLineColor

        roundedView.frame = CGRect(x: w / 2 - 8, y: h / 2 - 8, width: 16, height: 16)
        roundedView.layer.cornerRadius = 8
        roundedView.backgroundColor = roundedColor
        
        let date = Date()
        updateMinute(date: date)
        updateSecond(date: date)
        updateHour(date: date)
        startTimer()
        //timeDate()
        
        top.frame = CGRect(x: w / 2 - markerSize / 2, y: 0, width: markerSize, height: markerLenght)
        bottom.frame = CGRect(x: w / 2 - markerSize / 2, y: h - markerLenght, width: markerSize, height:  markerLenght)
        left.frame = CGRect(x: 0, y: h / 2 - markerSize / 2, width:  markerLenght, height: markerSize)
        right.frame = CGRect(x: w - markerLenght, y: h / 2 - markerSize / 2, width:  markerLenght, height: markerSize)
    
        for v in [top, bottom, left, right] {
            v.backgroundColor = markerColor
        }
        
        layer.cornerRadius = frame.size.width / 2
        
        if isSetuped { return }
        isSetuped = true
      
        for v in [top, bottom, left, right, hourLine, minuteLine, secondLine, roundedView] {
            addSubview(v)
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateViews()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        updateViews()

   
   
    }
}

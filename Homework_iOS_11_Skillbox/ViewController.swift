//
//  ViewController.swift
//  Homework_iOS_11_Skillbox
//
//  Created by Alexey Makarov on 08.08.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testView()
        pressed()
    }
   
}
extension ViewController: SegmentViewControllerDelegate {
    func pressed() {
        print("Delegate segment control")
    }
    
}

extension ViewController: TestViewDelegate {
    func testView() {
        print("Delegate button")
    }
}

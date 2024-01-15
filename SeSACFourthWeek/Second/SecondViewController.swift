//
//  SecondViewController.swift
//  SeSACFourthWeek
//
//  Created by 신정연 on 1/11/24.
//

import UIKit

class SecondViewController: UIViewController, ViewProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setBackgroundColor()

    }
    
    func configureView() {
        navigationItem.title = "두번째 탭바"
    }
}

//
//  UIViewController+Extension.swift
//  SeSACFourthWeek
//
//  Created by 신정연 on 1/11/24.
//

import UIKit

extension UIViewController: ReusableProtocol {
    // MARK: ViewController에서 identifier 변수 없애기
    static var identifier: String {
        return String(describing: self)
    }
    
    func setBackgroundColor() {
        view.backgroundColor = .orange
    }
}

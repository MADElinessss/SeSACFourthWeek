//
//  Protocol.swift
//  SeSACFourthWeek
//
//  Created by 신정연 on 1/15/24.
//

import UIKit

protocol ReusableProtocol {
    static var identifier: String { get }
}


extension UITableViewCell: ReusableProtocol {
    
    static var identifier : String {
        return String(describing: self)
        // "\(self)"랑 비슷해
        
    }
    
    func setBackground() {
        backgroundColor = .blue
    }
}

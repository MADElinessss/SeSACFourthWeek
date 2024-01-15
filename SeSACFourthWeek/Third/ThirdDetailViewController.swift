//
//  ThirdDetailViewController.swift
//  SeSACFourthWeek
//
//  Created by 신정연 on 1/12/24.
//

import UIKit

class ThirdDetailViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    
    // Data를 받을 공간(프로퍼티) 만든다.
//     1. var contents: String = "" 초기값이 있게
    // 2. 옵셔널로 지정
//    var contents: String?
    var contents: String = "데이터 받을 공간"
    
    // 데이터 받을 공간인데, User 자체를 받아(식판을 받아)
    var data: User = User(name: "name", phone: "phone", number: [0])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 3. 뷰에 표현
//        mainLabel.text = contents
        print(data.number)
        mainLabel.text = data.phoneResult
    }
}

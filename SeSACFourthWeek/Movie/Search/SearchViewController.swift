//
//  SearchViewController.swift
//  SeSACFourthWeek
//
//  Created by 신정연 on 1/11/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        // 화면 전환에 대한 방식과 목적지 등은 출발지에서 이미 다 정해져있는 상채
        // 따라서 어떻게 화면을 내려줄지만 작성하면 됨
        dismiss(animated: true)
    }
    
    @IBAction func popButtonTapped(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
}

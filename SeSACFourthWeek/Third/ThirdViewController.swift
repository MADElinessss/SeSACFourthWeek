//
//  ThirdViewController.swift
//  SeSACFourthWeek
//
//  Created by 신정연 on 1/11/24.
//

import UIKit

protocol ViewProtocol {
    func configureView()
}

// Int를 채택 -> index와 연결
// 👾 MARK: CaseIterable: case를 배열로 만들어
// 이 열거형 -> 클래스 안에 넣으면 다른 클래스에서는 못씀!
// => 검사해야하는 범주를 좁힌거니깐 **컴파일 최적화** 한다고 함

enum Setting: Int, CaseIterable {
    case total
    case personal
    case others
    case qna
    
    var title: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        case .qna:
            return "Q&A"
        }
    }
    
    var cellData: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["도움말"]
        case .qna:
            return ["문의하기"]
        }
    }
}

struct User {
    let name: String
    let age = Int.random(in: 10...40)
    let phone: String
    let number: [Int]
    
    // 연산 프로퍼티
    // return 생략가능!
    var contact: String { "\(name)님은 \(age)세 입니다." }
    
    var phoneResult: String { "\(phone.replacingOccurrences(of: "-", with: "."))" }
}

struct App {
    let name: String
    
}

// MARK: 설정 화면
class ThirdViewController: UIViewController, ViewProtocol {
    
    let list = [User(name: "매", phone: "010-2433-1891", number: [3,8]),
                User(name: "모", phone: "010-2433-1892", number: [3,7]),
                User(name: "머", phone: "010-2433-1893", number: [1]),
                User(name: "미", phone: "010-2433-1894", number: [2,0,2])]

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        setBackgroundColor()
    }
    
    func configureView() {
        navigationItem.title = "세번째 탭바"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        let row = list[indexPath.row]
        
        // MARK: String에서 특정 문자 대체 -> 연산 프로퍼티로 옮길 수 있음
        // row.phone.replacingOccurrences(of: "-", with: ".")
        
        cell.textLabel?.text = "\(row.name)님은 \(row.age)세 입니다."
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // MARK: Push로 전환
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ThirdDetailViewController") as! ThirdDetailViewController
        
        // viewController는 인스턴스야
        // viewController.mainLabel.text = "고래밥"
        // -> 값을 전달할 때 아웃렛을 사용할 수 없다!ㅠㅠ
        
        // 2. 데이터 보내기
        viewController.contents = list[indexPath.row].phone
        
        viewController.data = list[indexPath.row]
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

//extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Setting.allCases[section].cellData.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
//        cell.textLabel?.text = Setting.allCases[indexPath.section].cellData[indexPath.row]
//        
//        return cell
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        // 👾 Setting.allCases: 배열로 각 케이스 담은 것!!
//        return Setting.allCases.count
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        // 👾
//        return Setting.allCases[section].title
//    }
//}

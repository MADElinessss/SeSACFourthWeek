//
//  Enumeration.swift
//  SeSACFourthWeek
//
//  Created by 신정연 on 1/15/24.
//

import UIKit

enum FontStyle {
    /*
     var let primary: : UIFont = .boldSystemFont(ofSize: 15) -> 에러
     Enum은 저장 프로퍼티를 못씀! 왜?
     열거형 특성: 케이스를 여러개로 나눌 수 있고, 휴먼에러 잡을 수 있음
     동작하는 시점 - 컴파일 시점에 확정이됨! -> 실행하기 전에! -> 인스턴스를 만들지 못함 -> 인스턴스 프로퍼티를 가질 수 없다
     */
    static let primary: UIFont = .boldSystemFont(ofSize: 15)
}

enum ImageStyle {
    static let search = UIImage(systemName: "magnifyingglass")
    static let menu = UIImage(systemName: "list.dash")
}

/*
 1. enum이 struct, class보다 좋은가?
 struct, class도 상관없어. 근데 다른 뷰 컨트롤러에서 FontStyle.primary로 불러서 쓸건데,
 enum이 더 가독성이 좋음. 그리고 폰트 스타일은 1개이고, 나머지에서 갖다 쓰는건데 다른 곳에서 인스턴스를 만들면 안돼.
 클래스, struct는 인스턴스 생성할 수 있으니까. 그것조차도 방지하기 위해서 enum.
 let a = FontStyle() 요렇게 쓰면 안돼.
 그레서 enum이 더 적합해
 + 초기화를 막으면 되지 않나여?
 private init() { }
 
 2. enum case로 대응하면 안되나?
    
 enum Image: String {
     case search = "magnifyingglass"
 }
 
 요렇게 써도 돼.
 근데 rawValue - 원시값은 하나밖에 못써. 고유해야돼. 같은 아이콘인데 역할에 따라 의미부여를 다르게 해야될 때는 못쓸 수도 있음
 enum Image: String {
     case search = "magnifyingglass"
     case searchBottom = "magnifyingglass" <- Raw value for enum case is not unique! 에러 뜸
 }
 */


//
//  MovieViewController.swift
//  SeSACFourthWeek
//
//  Created by 신정연 on 1/11/24.
//

import UIKit

class MovieViewController: UIViewController {
    
    @IBOutlet var movieTableView: UITableView!
    // MARK: 🥹 검색 기능 추가
    @IBOutlet var searchBar: UISearchBar!
    
    // static으로 선언했기 때문!
//    var list = MovieInfo.movie // Meta Type
//    let list = MovieInfo.self.movie <- 원래는 중간에 self있음
    // static이 아니면
//    let list = MovieInfo().movie
    
    var originalList = MovieInfo.movie
    // MARK: 😳 관찰자 달기
    var list: [Movie] = MovieInfo.movie {
        // 변경된 직후!, 프로퍼티 옵저버
        didSet {
            movieTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureTableView()
        setBackgroundColor()
        setBarButtonItem()
    }
    
    @objc func rightBarButtonItemTapped() {
        print(#function) // == print("rightBarButtonItemTapped")
        
        // MARK: 화면 전환 - Present
        // 1. 스토리보드 찾기
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        // 2. 전환하려는 VC 찾기
        let viewController = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        
        // 효과 옵션
        // 모달 스타일로 띄우기(~iOS13: automatic이 fullscreen)
        viewController.modalPresentationStyle = .fullScreen
        
        viewController.modalTransitionStyle = .crossDissolve
        
        // 3. 뷰컨트롤러 전환: Present (-Dismiss)
        present(viewController, animated: true)
    }
    
    @objc func leftBarButtonItemTapped() {
        print(#function) // == print("rightBarButtonItemTapped")
        
        // MARK: 화면 전환 - Push
        // 1. 스토리보드 찾기
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        // 2. 전환하려는 VC 찾기
        let viewController = storyboard.instantiateViewController(withIdentifier: SearchViewController.identifier) as! SearchViewController
        // 3. 뷰컨트롤러 전환: Push (-Pop)
        // 전제조건: navigation controller 만들어와야돼
        navigationControlle¸r?.pushViewController(viewController, animated: true)
        // Optional Chaining: navigation controller 있으면 뒤에가 실행되는거야
    }
}
// MARK: 🥹 검색 기능 추가 - 부하직원
extension MovieViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function, searchText)
        // 검색버튼 눌렀을 때 검사
        var filterData: [Movie] = []
        for item in originalList {
            // 제목, overview에 있는지
            if item.title.contains(searchBar.text!) || item.overview.contains(searchBar.text!) {
                filterData.append(item)
            }
        }
        
        list = filterData
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        var filterData: [Movie] = []
        if searchBar.text == "" {
            list = originalList
        } else {
            for item in originalList {
                // 제목, overview에 있는지
                if item.title.contains(searchBar.text!) || item.overview.contains(searchBar.text!) {
                    filterData.append(item)
                }
            }
        }
        
        /*
         list가 변경되면 갱신해라 -> List가 바뀔때마다 알아서 갱신하게 하기
         -> 관찰자!
         // MARK: 😳 관찰자 달기
         */
//        movieTableView.reloadData()
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        list = originalList
        searchBar.text = ""
        
//        movieTableView.reloadData()
        view.endEditing(true)
    }
}

extension MovieViewController: ViewProtocol {
    
    func configureView() {
        navigationItem.title = "Movie"
        // MARK: 🥹 검색 기능 추가 - 부하 직원
        searchBar.delegate = self
        // 취소버튼 
        searchBar.showsCancelButton = true
    }
}

extension MovieViewController {
    
    func setBarButtonItem() {
        let button = UIBarButtonItem(image: ImageStyle.search, style: .plain, target: self, action: #selector(rightBarButtonItemTapped))
        navigationItem.rightBarButtonItem = button
        
//        let leftImage = UIImage(systemName: "list.dash")
        let leftButton = UIBarButtonItem(image: ImageStyle.menu, style: .plain, target: self, action: #selector(leftBarButtonItemTapped))
        navigationItem.leftBarButtonItem = leftButton
    }
    
    func configureTableView() {
        
        // 👾 cf. 셀 선택 자체를 불가능하게 하기
//        movieTableView.allowsSelection = false
        
        movieTableView.backgroundColor = .clear
        
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        let xib = UINib(nibName: MovieTableViewCell.identifier, bundle: nil)
        movieTableView.register(xib, forCellReuseIdentifier: MovieTableViewCell.identifier)

    }
}

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        
        let row = list[indexPath.row]
        
        cell.configureCell(row: row)
        
        return cell
    }
    
    // MARK: 화면 전환 - cell 선택 시
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 1. 출발지 - 스토리보드 다를 때
//        let storyboard = UIStoryboard(name: "Movie", bundle: nil)
        // 1. 출발지 - 스토리보드 같을 때
        // 안써도대
        
        // 2. 목적지 - 스토리보드 다를 때
//        let viewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        // 2. 목적지 - 스토리보드 같을 때
//        let viewController = storyboard?.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: MapViewController.identifier) as! MapViewController
        
        // 3. 화면 전환 - present
//        present(viewController, animated: true)
        // <- 👹어떤 vc 추가하는지 잘 확인할 것!
        
        // MARK: -  (옵션) 모달에 NavigationBar 추가하기
//        let navigationController = UINavigationController(rootViewController: viewController)

//        navigationController.modalPresentationStyle = .fullScreen
        // <- (옵션)풀스크린으로
        present(viewController, animated: true)
        
        // 👾 클릭된 상태가 남아있어ㅠㅠ 해결 ->
        // 1. 해당 셀만 다시 reload 갱신
        tableView.reloadRows(at: [indexPath], with: .fade)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

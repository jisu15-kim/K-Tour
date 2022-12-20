//
//  ViewController.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/18.
//

import UIKit

class TourListViewController: UIViewController {
    
    let networkManager = NetworkManager()
    var tourListDatas: [Item] = []
    var contentType: contentTypeID?
    var pageNumber = 1
    
    var isPaging = false
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchNetwork()
        setupTableView()
    }
    
    // 페이지네이션 포함 network
    func fetchNetwork(paging: Bool? = false) {
        guard let type = contentType else { return }
        
        if paging == true {
            isPaging = true
            pageNumber += 1
        }
        
        networkManager.getNetworkData(contentType: type, pageNumber: self.pageNumber) { [weak self] item in
            item.forEach { item in
                self?.tourListDatas.append(item)
            }
            self?.listTableView.reloadData()
            if paging == true {
                self?.isPaging = false
            }
        }
    }
    
    func setupTableView() {
        listTableView.register(UINib(nibName: "TourListCell", bundle: nil), forCellReuseIdentifier: "TourListCell")
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.rowHeight = 120
    }
}

extension TourListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tourListDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: "TourListCell", for: indexPath) as? TourListCell else { return UITableViewCell() }
        if self.tourListDatas.count != 0 {
            cell.model = self.tourListDatas[indexPath.row]
        }
        cell.configure()
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.height
        
//        print("offsetY : \(offsetY) / contentHeight : \(contentHeight) / height : \(height)")
        
        if offsetY > contentHeight - height {
            if isPaging == false {
                fetchNetwork(paging: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(tourListDatas[indexPath.row].title)
    }
}

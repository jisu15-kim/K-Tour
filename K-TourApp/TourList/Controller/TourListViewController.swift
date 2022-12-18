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
    
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchNetwork()
        setupTableView()
    }
    
    func fetchNetwork() {
        networkManager.getNetworkData { [weak self] item in
            self?.tourListDatas = item
            dump(self?.tourListDatas)
            self?.listTableView.reloadData()
        }
    }
    
    func setupTableView() {
        listTableView.register(UINib(nibName: "TourListCell", bundle: nil), forCellReuseIdentifier: "TourListCell")
        listTableView.delegate = self
        listTableView.dataSource = self
        listTableView.rowHeight = 150

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
}

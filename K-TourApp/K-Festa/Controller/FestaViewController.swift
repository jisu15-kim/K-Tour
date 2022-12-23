//
//  FestaViewController.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/23.
//

import UIKit

class FestaViewController: UIViewController {
    
    var items: [FestaItem] = []
    
    let dataManager = FestaDataManager()

    @IBOutlet weak var hotCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNetworkData()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        hotCollectionView.register(HotFestaCell.self, forCellWithReuseIdentifier: "HotFestaCell")
        hotCollectionView.delegate = self
        hotCollectionView.dataSource = self
        hotCollectionView.showsHorizontalScrollIndicator = false
        hotCollectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    func setupNetworkData() {
        dataManager.getNetworkData { [weak self] festaItem in
            festaItem.forEach { item in
                self?.items.append(item)
            }
            dump(self?.items)
            self?.hotCollectionView.reloadData()
        }
    }
}

extension FestaViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HotFestaCell", for: indexPath) as? HotFestaCell else { return UICollectionViewCell() }
        cell.item = items[indexPath.row]
        cell.setupUI()
        return cell
    }
}

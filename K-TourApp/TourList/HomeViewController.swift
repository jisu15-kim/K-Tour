//
//  HomeViewController.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/19.
//

import UIKit
import Tabman
import Pageboy

class HomeViewController: TabmanViewController {

    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubVC()
        setupBar()
    }
    
    private func setupSubVC() {
        
        getListVC(contentType: .tour)
        getListVC(contentType: .cultureFacility)
        getListVC(contentType: .travelCourse)
        getListVC(contentType: .reports)
        getListVC(contentType: .stay)
        getListVC(contentType: .shopping)
        getListVC(contentType: .restaurant)
        
        self.dataSource = self
    }
    
    private func getListVC(contentType: contentTypeID) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TourListViewController") as! TourListViewController
        vc.contentType = contentType
        self.viewControllers.append(vc)
    }
    
    private func setupBar() {
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .snap
        addBar(bar, dataSource: self, at: .top)
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        bar.indicator.weight = .medium
        bar.indicator.tintColor = #colorLiteral(red: 0.4356632233, green: 0.4757905006, blue: 0.968429029, alpha: 1)
        bar.buttons.customize { button in
            button.selectedTintColor = #colorLiteral(red: 0.4356632233, green: 0.4757905006, blue: 0.968429029, alpha: 1)
        }
    }
}

extension HomeViewController: PageboyViewControllerDataSource, TMBarDataSource {

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "관광지")
        case 1:
            return TMBarItem(title: "문화시설")
        case 2:
            return TMBarItem(title: "관광코스")
        case 3:
            return TMBarItem(title: "레포츠")
        case 4:
            return TMBarItem(title: "숙박")
        case 5:
            return TMBarItem(title: "쇼핑")
        case 6:
            return TMBarItem(title: "맛집")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }

    }
    
    
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return self.viewControllers.count
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return self.viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        return nil
    }
    
}

//
//  CommonDetailViewController.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/20.
//

import UIKit
import Kingfisher
import NMapsMap


class CommonDetailViewController: UIViewController {
    
    var listItem: Item?
    let dataManager = CommonDetailDataManager()
    
    var commonDetailItem: CDItem?
    
    @IBOutlet weak var nMapSmallView: NMFMapView!
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var adressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var latitude: Double?
    var longitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        self.navigationItem.title = listItem?.title
    }
    
    private func fetchData() {
        if let selected = listItem {
            dataManager.getNetworkData(contentID: selected.contentid) { [weak self] item in
                self?.commonDetailItem = item[0]
                self?.configure(item[0])
            }
        }
    }
    
    func configure(_ data: CDItem) {
        let imageUrl = URL(string: data.firstimage)
        mainImage.kf.setImage(with: imageUrl)
        
        titleLabel.text = data.title
        adressLabel.text = "\(data.addr1) \(data.addr2)"
        
        let description = String(htmlEncodedString: data.overview)
        descriptionLabel.text = description
        
        self.longitude = Double(data.mapx)!
        self.latitude = Double(data.mapy)!
        
        setupNMap()
    }
    
    func setupNMap() {
        nMapSmallView.allowsScrolling = false
        nMapSmallView.allowsZooming = true
        nMapSmallView.allowsRotating = false
        
        let latLng = NMGLatLng(lat: latitude ?? 0, lng: longitude ?? 0)
        let position = NMFCameraPosition(latLng, zoom: 15, tilt: 0, heading: 0)
        let cameraUpdate = NMFCameraUpdate(position: position)
        nMapSmallView.moveCamera(cameraUpdate)
        
        let marker = NMFMarker(position: latLng)
        marker.mapView = nMapSmallView
        
        nMapSmallView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(mapTapped))
        nMapSmallView.addGestureRecognizer(gesture)
    }
    
    @objc private func mapTapped() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        vc.latLng = NMGLatLng(lat: latitude ?? 0, lng: longitude ?? 0)
        vc.placeTitle = listItem?.title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

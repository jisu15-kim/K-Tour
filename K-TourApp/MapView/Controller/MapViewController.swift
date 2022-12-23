//
//  MapViewController.swift
//  K-TourApp
//
//  Created by 김지수 on 2022/12/22.
//

import UIKit
import NMapsMap

class MapViewController: UIViewController {
    
    var latLng: NMGLatLng?
    var placeTitle: String?

    @IBOutlet weak var nMapView: NMFMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "지도보기"
        setupNMap()
    }
    
    func setupNMap() {
        nMapView.allowsScrolling = true
        nMapView.allowsZooming = true
        nMapView.allowsRotating = false
        
        let position = NMFCameraPosition(latLng!, zoom: 15, tilt: 0, heading: 0)
        let cameraUpdate = NMFCameraUpdate(position: position)
        nMapView.moveCamera(cameraUpdate)
        
        let marker = NMFMarker(position: latLng!)
        marker.captionText = placeTitle!
        marker.captionTextSize = 18
        marker.captionAligns = [NMFAlignType.top]
        marker.mapView = nMapView
    }
}

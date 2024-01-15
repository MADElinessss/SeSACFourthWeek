//
//  MapViewController.swift
//  SeSACFourthWeek
//
//  Created by 신정연 on 1/15/24.
//

import MapKit
import UIKit

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
    
        mapView.setRegion(region, animated: true)
        
        // MKAnnotation: AnnotationView(custom) / MKPointAnnotation: 기본 pin 꼽기
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Here"
        mapView.addAnnotation(annotation)

    }
}

extension MapViewController: MKMapViewDelegate {
    
}

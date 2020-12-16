//
//  MapViewController.swift
//  After-school care Center
//
//  Created by apple on 2020/12/1.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    let Location = CLLocation(latitude: 31.283841811732625, longitude: 121.52925689712525)
    let Class=school(title: "After school nurvey", coordinate: CLLocationCoordinate2D(latitude: 31.283841811732625, longitude: 121.52925689712525), location: CLLocation(latitude: 31.283841811732625, longitude: 121.52925689712525))
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Map.setCenterLocation(Location)
        Map.addAnnotation(Class)

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var Map: MKMapView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
    
private extension MKMapView {
    
    func setCenterLocation(_ location: CLLocation,
                           regionRadius: CLLocationDistance = 500) {
        
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        
        setRegion(coordinateRegion, animated: true)
    }
    
}
class school:NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    let location: CLLocation
    init(
           
           title: String,
           coordinate: CLLocationCoordinate2D,
        location:CLLocation
       ) {
           
           self.title = title
           self.coordinate = coordinate
        self.location = location
       }
       
}


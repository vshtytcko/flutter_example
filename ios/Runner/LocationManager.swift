import Foundation
import CoreLocation

struct Coordinates {
    let latitude: Double
    let longitude: Double
}

class LocationAPIService: NSObject {
    private let locationManager = CLLocationManager()
    private var coordinates = Coordinates(latitude: 0.0, longitude: 0.0)
    
   override init() {
       super.init()
       self.locationManager.delegate = self
       self.setupLocationManager()
       locationManager.startUpdatingLocation()
   }
    
    private func setupLocationManager() {
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.activityType = .fitness
        locationManager.allowsBackgroundLocationUpdates = false
    }
    
    func getPosition() -> [String: Double] {
        let dict = ["latitude": coordinates.latitude,
                    "longitude": coordinates.longitude]
        return dict
    }
}

extension LocationAPIService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latitude = locations.first?.coordinate.latitude else { return }
        guard let longitude = locations.first?.coordinate.longitude else { return }
        coordinates = Coordinates(latitude: latitude, longitude: longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let error = error as? CLError, error.code == .denied {
            locationManager.stopUpdatingLocation()
        }
    }
}

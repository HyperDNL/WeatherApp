import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    // Crear una instancia de CLLocationManager, el Framework que usamos para obtener las coordenadas
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        
        // Asignar un delegado a nuestra instancia de CLLocationManager
        manager.delegate = self
    }
    
    // Solicita la entrega por única vez de la ubicación actual del usuario, ver https://developer.apple.com/documentation/corelocation/cllocationmanager/1620548-requestlocation
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    // Establecer las coordenadas de ubicación en la variable de ubicación
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    
    
    // Esta función será llamada si nos encontramos con un error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}

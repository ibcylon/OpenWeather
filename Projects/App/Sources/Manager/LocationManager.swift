//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Kanghos on 8/11/24.
//

import Foundation
import CoreLocation

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
  let manager = CLLocationManager()

  @Published var location: CLLocationCoordinate2D?
  @Published var isLoading = false

  override init() {
    super.init()
    self.manager.delegate = self
  }

  func requestLocation() {
    self.isLoading = true
    self.manager.requestWhenInUseAuthorization()
    self.manager.requestLocation()
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    location = locations.first?.coordinate
    isLoading = false
  }

  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("Failed to find user's location: \(error.localizedDescription)")
    isLoading = false
  }
}

//
//  MapView.swift
//  WeatherApp
//
//  Created by Kanghos on 8/12/24.
//

import Foundation
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView

    init(parent: MapView) {
      self.parent = parent
    }
  }

  var coordinate: Weather.Coordinate2D

  func makeCoordinator() -> Coordinator {
    return Coordinator(parent: self)
  }

  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView(frame: .zero)
    mapView.delegate = context.coordinator
    return mapView
  }
  func updateUIView(_ uiView: MKMapView, context: Context) {
    let coordinate2D = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    let region = MKCoordinateRegion(center: coordinate2D, span: span)
    uiView.setRegion(region, animated: true)

    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinate2D
    annotation.title = "San Francisco"
    uiView.addAnnotation(annotation)

    uiView.showsUserLocation = true
  }
}

#Preview {
  MapView(coordinate: .init(latitude: 37.7749, longitude: -122.4194))
}

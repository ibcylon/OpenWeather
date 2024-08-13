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

  var model: Weather.CurrentWeatherEntity

  func makeCoordinator() -> Coordinator {
    return Coordinator(parent: self)
  }

  func makeUIView(context: Context) -> MKMapView {
    let mapView = MKMapView(frame: .zero)
    mapView.delegate = context.coordinator
    return mapView
  }
  func updateUIView(_ uiView: MKMapView, context: Context) {
    let coordinate2D = CLLocationCoordinate2D(latitude: model.coordinate.latitude, longitude: model.coordinate.longitude)
    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    let region = MKCoordinateRegion(center: coordinate2D, span: span)
    uiView.setRegion(region, animated: true)

    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinate2D
    annotation.title = model.titleModel.timezone
    uiView.addAnnotation(annotation)

    uiView.showsUserLocation = true
  }
}

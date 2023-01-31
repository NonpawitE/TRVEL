//
//    _ _ _ _____ ___ _____
//   | | | |  |  |   |  _  |
//   | | | |     | | |   __|
//   |_____|__|__|___|__|
//
//  File: MapView.swift
//  Author: Nonpawit Ekburanawat
//  Created on: 25/1/23
//

import SwiftUI
import MapKit
import UIKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude:   13.7563,
            longitude:  100.5018),
        span: MKCoordinateSpan(
            latitudeDelta:  0.1,
            longitudeDelta: 0.1))
    
    @State private var destination: String  = ""
    @State private var typing:      Bool    = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(coordinateRegion: $region)
                .ignoresSafeArea()
            
            VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
                .ignoresSafeArea()
                .frame(height: 0)
            
            VStack {
                if (typing == false) {
                    Spacer()
                }
                
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        TextField("Search your destination", text: $destination, onEditingChanged: {
                            self.typing = $0
                        })
                            .font(.system(size: 15))
                    }
                    .padding(.leading, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 40)
                            .foregroundColor(Color(UIColor.secondarySystemFill)))
                    .padding([.trailing])
                    
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 25, height: 15)
                        .opacity(0.5)
                        .padding(.trailing, 7.0)
                }
                .padding([.leading, .trailing])
                .padding(.top, 25)
                .padding(.bottom, 50)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(UIColor.secondarySystemBackground)))
                .shadow(radius: 5)
                
                if (typing == true) {
                    Spacer()
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}
    
struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

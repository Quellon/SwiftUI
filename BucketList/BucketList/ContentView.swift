//
//  ContentView.swift
//  BucketList
//
//  Created by Quellon Naicker on 11/8/24.
//

import SwiftUI
import MapKit
import LocalAuthentication


struct ContentView: View {
    @State private var isUnlocked = false

    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        MapReader { proxy in
            Map()
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        print(coordinate)
                    }
                }
        }
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
}
func authenticate() {
    let context = LAContext()
    var error: NSError?

    // check whether biometric authentication is possible
    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
        // it's possible, so go ahead and use it
        let reason = "We need to unlock your data."

        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
            // authentication has now completed
            if success {
                // authenticated successfully
            } else {
                // there was a problem
            }
        }
    } else {
        // no biometrics
    }
}

#Preview {
    ContentView()
}

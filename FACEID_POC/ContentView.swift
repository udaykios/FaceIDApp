//
//  ContentView.swift
//  FACEID_POC
//
//  Created by UDAY on 30/08/2023.
//

import SwiftUI
import LocalAuthentication


//MARK: - PLEASE ADD IN INFO-PLIST Privacy - Face ID Usage Description
struct ContentView: View {
    @State private var isUnlocked = false
    
    var body: some View{
        
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    //MARK: authenticate functionality...to unlock with faceID
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data."
            // Evaluate Policy, so go ahead and use it
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                if success {
                    self.isUnlocked = true
                    // authenticated successfully
                } else {
                    // there was a problem
                }
            }
        } else {
            // no biometrics
        }
    }
    
}

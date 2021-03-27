//
//  SimplyCoreAudioDemoApp.swift
//  SimplyCoreAudioDemo
//
//  Created by Ruben Nine on 27/3/21.
//

import SwiftUI
import SimplyCoreAudio

extension SimplyCoreAudio: ObservableObject {}

@main
struct SimplyCoreAudioDemoApp: App {
    @StateObject private var simply = SimplyCoreAudio()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(simply)
        }
    }
}

//
//  ContentView.swift
//  SimplyCoreAudioDemo
//
//  Created by Ruben Nine on 27/3/21.
//

import SwiftUI
import SimplyCoreAudio

struct ContentView: View {
    @EnvironmentObject var simply: SimplyCoreAudio
    @State var selectedDevice: AudioDevice?

    var body: some View {
        NavigationView {
            List {
                ForEach(simply.allDevices, id: \.self) { device in
                    NavigationLink(destination: DeviceDetail(device: device),
                                   tag: device,
                                   selection: $selectedDevice) {
                        DeviceRow(device: device)
                    }
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Devices")
            .focusable()
        }.onAppear {
            selectedDevice = simply.allDevices.first
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(SimplyCoreAudio())
    }
}

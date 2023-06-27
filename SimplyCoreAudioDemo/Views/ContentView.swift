//
//  ContentView.swift
//  SimplyCoreAudioDemo
//
//  Created by Ruben Nine on 27/3/21.
//

import SwiftUI
import SimplyCoreAudio

struct ContentView: View {
    @EnvironmentObject private var sca: ObservableSCA
    @State private var selectedDevice: ObservableAudioDevice?

    var body: some View {
        NavigationView {
            List {
                ForEach(sca.devices, id: \.self) { device in
                    NavigationLink(destination: DeviceDetail(device: device),
                                   tag: device,
                                   selection: $selectedDevice) {
                        DeviceRow(device: device)
                    }
                    .accentColor(.orange)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 250, idealWidth: 250)
            .navigationTitle("Devices")
        }
        .onAppear {
            selectedDevice = sca.devices.first
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ObservableSCA())
    }
}

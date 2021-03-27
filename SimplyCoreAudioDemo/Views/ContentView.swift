//
//  ContentView.swift
//  SimplyCoreAudioDemo
//
//  Created by Ruben Nine on 27/3/21.
//

import SwiftUI
import SimplyCoreAudio

struct ContentView: View {
    @EnvironmentObject var sca: ObservableSCA
    @State var selectedDevice: ObservableAudioDevice?

    var body: some View {
        NavigationView {
            List {
                ForEach(sca.devices, id: \.self) { device in
                    NavigationLink(destination: DeviceDetail(device: device),
                                   tag: device,
                                   selection: $selectedDevice) {
                        DeviceRow(device: device)
                    }
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 250, idealWidth: 250)
            .navigationTitle("Devices")
            .focusable()
        }.onAppear {
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

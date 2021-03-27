//
//  DeviceRow.swift
//  SimplyCoreAudioDemo
//
//  Created by Ruben Nine on 27/3/21.
//

import SwiftUI
import SimplyCoreAudio

struct DeviceRow: View {
    @ObservedObject var device: ObservableAudioDevice

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Label(device.name, systemImage: device.systemImageName)
                .font(.headline)
                .layoutPriority(1)

            DeviceSubheader(device: device)
        }
        .padding(11)
    }
}

struct DeviceRow_Previews: PreviewProvider {
    static let defaultDevice = ObservableAudioDevice(device: SimplyCoreAudio().defaultOutputDevice!)

    static var previews: some View {
        DeviceRow(device: defaultDevice)
    }
}

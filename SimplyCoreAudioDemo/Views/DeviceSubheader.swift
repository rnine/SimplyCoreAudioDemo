//
//  DeviceSubheader.swift
//  SimplyCoreAudioDemo
//
//  Created by Ruben Nine on 27/3/21.
//

import SwiftUI
import SimplyCoreAudio

struct DeviceSubheader: View {
    var device: AudioDevice

    var body: some View {
        HStack(alignment: .center, spacing: 3) {
            Text(device.prettyChannelsDescription)
                .font(.subheadline)

            Spacer()

            if let transportType = device.transportType {
                Text(transportType.rawValue)
                    .font(.subheadline)
            }
        }
    }
}

struct DeviceSubheader_Previews: PreviewProvider {
    static var previews: some View {
        DeviceSubheader(device: SimplyCoreAudio().defaultOutputDevice!)
    }
}

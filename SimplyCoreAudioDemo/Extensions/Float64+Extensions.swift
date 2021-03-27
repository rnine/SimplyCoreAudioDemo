//
//  Float64+Extensions.swift
//  SimplyCoreAudioDemo
//
//  Created by Ruben Nine on 27/3/21.
//

import Foundation

extension Float64 {
    var kiloHertzs: String { String(format: "%.1f kHz", self / 1000) }
}

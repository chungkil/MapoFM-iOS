//
//  Stream.swift
//  Mapofm
//
//  Created by Jongwook Park on 2/17/25.
//
import Foundation

struct Stream {
    var streamURL: URL?

    init() {
        self.streamURL = URL(string: "http://onair.mapofm.net/mapofm")
    }
}

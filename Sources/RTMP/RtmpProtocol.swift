//
//  RtmpProtocol.swift
//  swift-rtmp
//
//  Created by kPherox on 2019/02/24.
//  Copyright © 2019 kPherox. All rights reserved.
//

import Foundation

public enum RtmpProtocol: Int {
    case UNDEFINED = -1
    case RTMP      = 0
    case RTMPE     = 2
    case RTMPT     = 1
    case RTMPS     = 4
    case RTMPTE    = 3
    case RTMPTS    = 5
    case RTMFP     = 8

    func toInt32() -> Int32 {
        return Int32(self.rawValue)
    }
}

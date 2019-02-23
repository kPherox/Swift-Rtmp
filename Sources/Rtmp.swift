//
//  Rtmp.swift
//  SwiftRtmp
//
//  Created by kPherox on 2019/02/23.
//  Copyright © 2019 kPherox. All rights reserved.
//

import Foundation
import CRtmp

public final class Rtmp {

    var rtmp: RTMP

    public init() {
        self.rtmp = RTMP()
        RTMP_Init(&self.rtmp)
    }

}

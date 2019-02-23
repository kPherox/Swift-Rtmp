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

    let rtmp: UnsafeMutablePointer<RTMP>

    init(_ rtmp: UnsafeMutablePointer<RTMP>) {
        self.rtmp = rtmp
        RTMP_Init(self.rtmp)
    }

    public convenience init() {
        self.init(RTMP_Alloc())
    }

}

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

    public func parseUrl(_ url: String, urlProtocol: inout Int32, host: inout String, port: inout UInt, playpath: inout String, appName: inout String) -> Bool {
        var parsedHost: AVal = AVal()
        var parsedPlaypath: AVal = AVal()
        var parsedApp: AVal = AVal()
        var parsedProtocol: Int32 = CRtmp.RTMP_PROTOCOL_UNDEFINED
        var parsedPort: UInt32 = 0
        let result: Int32 = RTMP_ParseURL(url.toCString(), &parsedProtocol, &parsedHost, &parsedPort, &parsedPlaypath, &parsedApp)

        urlProtocol = parsedProtocol
        host = String(cString: parsedHost.av_val)
        port = UInt(parsedPort)
        playpath = String(cString: parsedPlaypath.av_val)
        appName = String(cString: parsedApp.av_val)
        return result != 0
    }

    public func setBuffer(milliSeconds size: Int32) {
        RTMP_SetBufferMS(self.rtmp, size)
    }

    public func updateBufferMilliSeconds() {
        RTMP_UpdateBufferMS(self.rtmp)
    }

    public func setOption(kind: String, value: String) -> Bool {
        var avOption: AVal = kind.toAVal()
        var avValue: AVal = value.toAVal()
        let result: Int32 = RTMP_SetOpt(self.rtmp, &avOption, &avValue)

        return result != 0
    }

    public func setupUrl(_ url: String) -> Bool {
        let result: Int32 = RTMP_SetupURL(self.rtmp, url.toCString())

        return result != 0
    }

}

//
//  String++.swift
//  SwiftRtmp
//
//  Created by kPherox on 2019/02/23.
//  Copyright © 2019 kPherox. All rights reserved.
//

import Foundation
import CRtmp

extension String {

    public func toCString() -> UnsafeMutablePointer<Int8>? {
        let count = self.utf8CString.count
        let result: UnsafeMutableBufferPointer<Int8> = UnsafeMutableBufferPointer<Int8>.allocate(capacity: count)
        _ = result.initialize(from: self.utf8CString)
        return result.baseAddress
    }

    public func toAVal() -> AVal {
        return AVal(av_val: self.toCString(), av_len: Int32(self.count))
    }

}

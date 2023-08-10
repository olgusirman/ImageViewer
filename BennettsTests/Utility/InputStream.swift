//
//  InputStream.swift
//  BennettsTests
//
//  Created by Olgu SIRMAN on 10/08/2023.
//

import Foundation

extension InputStream {
    /// The avalable stream data.
    var data: Data {
        var data = Data()
        open()

        let maxLength = 1024
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: maxLength)
        while hasBytesAvailable {
            let read = read(buffer, maxLength: maxLength)
            guard read > 0 else { break }
            data.append(buffer, count: read)
        }

        buffer.deallocate()
        close()

        return data
    }
}

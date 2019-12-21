//
//  XcodeReleaseController.swift
//  App
//
//  Created by Jeff Lett on 7/13/19.
//

import Vapor
import XcodeReleasesKit

final class XcodeReleaseController {
    func index(_ req: Request) throws -> Future<[XcodeRelease]> {
        return XcodeRelease.query(on: req).sort(\.id, .descending).all()
    }
}
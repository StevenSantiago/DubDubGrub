//
//  Utility+Ext.swift
//  DubDubGrub
//
//  Created by Steven Santiago on 5/6/22.
//

import Combine

extension Subscribers.Completion {
    func error() throws -> Failure {
        if case let .failure(error) = self {
            return error
        }
        throw ErrorFunctionThrowsError.error
    }
    private enum ErrorFunctionThrowsError: Error { case error }
}

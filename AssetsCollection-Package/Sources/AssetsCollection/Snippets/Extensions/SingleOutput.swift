//
// MARK: Combine's Single Output
//
//
//  Created by Kovs on 28.08.2023.
//  Copyright © 2023 CodingKovs. All rights reserved.
//

import Foundation
import Combine

/*
 return the first output value that a given Combine publisher emitted,
 so it should only be used on publishers which aren’t expected to produce multiple values over time
 (unless we’re only interested in the very first value)
 */


@available(iOS 13.0, *)
extension Publishers {
    struct MissingOutputError: Error {}
}

@available(iOS 13.0, *)
extension Publisher {
    func singleOutput() async throws -> Output {
        var cancellable: AnyCancellable?
        var didReceiveValue = false

        return try await withCheckedThrowingContinuation { continuation in
            cancellable = sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    case .finished:
                        if !didReceiveValue {
                            continuation.resume(
                                throwing: Publishers.MissingOutputError()
                            )
                        }
                    }
                },
                receiveValue: { value in
                    guard !didReceiveValue else { return }

                    didReceiveValue = true
                    cancellable?.cancel()
                    continuation.resume(returning: value)
                }
            )
        }
    }
}


// MARK: - Usage

/*
 struct CommentLoader {
     ...

     func loadCommentsForDocument(
         withID id: Document.ID
     ) -> AnyPublisher<[Comment], Error> {
         ...
     }
 }

 ...

 let comments = try await loader
     .loadCommentsForDocument(withID: documentID)
     .singleOutput()
 */


//  Copyright © 2018 Derek Clarkson. All rights reserved.

import PromiseKit

extension Promise {

    static func readSnapshot<Snapshot>(snapshotFunction function:(@escaping (Snapshot?, Error?) -> Void) -> Void,
                                       snapshotHandler handler:@escaping (Snapshot, (T) -> Void, (Error) -> Void) -> Void) -> Promise<T> {
        return Promise { fulfil, reject in
            function { snapshot, error in
                if let snapshot = snapshot {
                    handler(snapshot, fulfil, reject)
                }
                if let error = error {
                    reject(error)
                }
                reject(DocumentError.notFound)
            }
        }
    }
}

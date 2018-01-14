
//  Copyright © 2018 Derek Clarkson. All rights reserved.

import PromiseKit

func readDocument<Snapshot,Object>(snapshotFunction:(@escaping (Snapshot?, Error?) -> Void) -> Void,
                                   snapshotHandler:@escaping (Snapshot, (Object) -> Void, (Error) -> Void) -> Void) -> Promise<Object> {
    return Promise { fulfil, reject in
        snapshotFunction { firestoreSnapshot, error in
            if let snapshot = firestoreSnapshot {
                snapshotHandler(snapshot, fulfil, reject)
            }
            if let error = error {
                reject(error)
            }
            reject(DocumentError.notFound)
        }
    }
}

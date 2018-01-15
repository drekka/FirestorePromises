
//  Copyright © 2017 Derek Clarkson. All rights reserved.

import PromiseKit
import FirebaseFirestore

public extension DocumentReference {

    /**
     Produces a new object from the data contained in the document.

     - Returns: An instance of T
    */
    func read<T>() -> Promise<T> where T: DictionaryInitable {
        return read()
            .then { data -> T in
                T(dictionary:data)
        }
    }

    func read() -> Promise<[String:Any]> {
        let function:(@escaping (DocumentSnapshot?, Error?) -> Void) -> Void = self.getDocument
        return Promise.readSnapshot(snapshotFunction:function) { snapshot, fulfil, _ in
            fulfil(snapshot.data())
        }
    }
}


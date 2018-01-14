
//  Copyright © 2017 Derek Clarkson. All rights reserved.

import PromiseKit
import FirebaseFirestore

public extension DocumentReference {

    func read<T>() -> Promise<T> where T:DictionaryInitable {
        return read()
            .then { data -> T in
                T(data: data)
        }
    }

    func read() -> Promise<[String:Any]> {
        let function:(@escaping (DocumentSnapshot?, Error?) -> Void) -> Void = self.getDocument
        return readDocument(snapshotFunction:function) { snapshot, fulfil, _ in
            fulfil(snapshot.data())
        }
    }
}



//  Copyright © 2017 Derek Clarkson. All rights reserved.

import PromiseKit
import FirebaseFirestore

public extension CollectionReference {

    /**
     Produces a new array of objects from the data contained in this collection.

     - Returns: An array of T instances.
     */
    func read<T>() -> Promise<[T]> where T:DictionaryInitable {
        return read()
            .then { data -> [T] in
                data.map { T(dictionary: $0) }
        }
    }

    func read() -> Promise<[[String:Any]]> {
        let function:(@escaping (QuerySnapshot?, Error?) -> Void) -> Void = self.getDocuments
        return Promise.readSnapshot(snapshotFunction:function) { snapshot, fulfil, _ in
            var documents = [[String:Any]]()
            snapshot.documents.forEach { documents.append($0.data()) }
            fulfil(documents)
        }
    }
}


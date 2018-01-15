
//  Copyright © 2018 Derek Clarkson. All rights reserved.

/**
 Defines an initializer that takes a Dictionary as an argument.
 */
public protocol DictionaryInitable {

    /**
     Dictionary based initializer.

     - Parameter data: The Dictionary containing the data to load into the class.
    */
    init(dictionary:[String:Any])

}

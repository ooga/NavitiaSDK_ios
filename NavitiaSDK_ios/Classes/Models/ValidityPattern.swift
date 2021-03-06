//
// ValidityPattern.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import ObjectMapper


open class ValidityPattern: JSONEncodable, Mappable {

    public var beginningDate: String?
    public var days: String?

    public init() {}
    required public init?(map: Map) {

    }


    public func mapping(map: Map) {
        beginningDate <- map["beginning_date"]
        days <- map["days"]
    }

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["beginning_date"] = self.beginningDate
        nillableDictionary["days"] = self.days

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}

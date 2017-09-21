//
// Cost.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import ObjectMapper


open class Cost: JSONEncodable, Mappable {

    public var currency: String?
    public var value: String?

    public init() {}
    required public init?(map: Map) {

    }


    public func mapping(map: Map) {
        currency <- map["currency"]
        value <- map["value"]
    }

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["currency"] = self.currency
        nillableDictionary["value"] = self.value

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
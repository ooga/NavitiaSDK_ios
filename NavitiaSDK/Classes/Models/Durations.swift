//
// Durations.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import ObjectMapper


open class Durations: JSONEncodable, Mappable {

    /** Walking total duration of the journey (seconds) */
    public var walking: Int32?
    /** Total duration of the journey (seconds) */
    public var total: Int32?

    public init() {}
    required public init?(map: Map) {

    }


    public func mapping(map: Map) {
        walking <- map["walking"]
        total <- map["total"]
    }

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["walking"] = self.walking?.encodeToJSON()
        nillableDictionary["total"] = self.total?.encodeToJSON()

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
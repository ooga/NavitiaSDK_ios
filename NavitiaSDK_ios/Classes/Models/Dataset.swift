//
// Dataset.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import ObjectMapper


open class Dataset: JSONEncodable, Mappable {

    public var realtimeLevel: String?
    public var description: String?
    /** Type of dataset provided (GTFS, Chouette, ...) */
    public var system: String?
    /** Start of the validity period for the dataset */
    public var startValidationDate: String?
    /** End of the validity period for the dataset */
    public var endValidationDate: String?
    /** Contributor providing the dataset */
    public var contributor: Contributor?
    /** Identifier of the object */
    public var id: String?

    public init() {}
    required public init?(map: Map) {

    }


    public func mapping(map: Map) {
        realtimeLevel <- map["realtime_level"]
        description <- map["description"]
        system <- map["system"]
        startValidationDate <- map["start_validation_date"]
        endValidationDate <- map["end_validation_date"]
        contributor <- map["contributor"]
        id <- map["id"]
    }

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["realtime_level"] = self.realtimeLevel
        nillableDictionary["description"] = self.description
        nillableDictionary["system"] = self.system
        nillableDictionary["start_validation_date"] = self.startValidationDate
        nillableDictionary["end_validation_date"] = self.endValidationDate
        nillableDictionary["contributor"] = self.contributor?.encodeToJSON()
        nillableDictionary["id"] = self.id

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}

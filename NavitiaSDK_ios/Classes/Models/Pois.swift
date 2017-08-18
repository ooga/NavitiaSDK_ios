//
// Pois.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import ObjectMapper


open class Pois: JSONEncodable, Mappable {

    public var disruptions: [Disruption]?
    public var pagination: Pagination?
    public var pois: [Poi]?
    public var error: ModelError?
    public var feedPublishers: [FeedPublisher]?

    public init() {}
    required public init?(map: Map) {

    }


    public func mapping(map: Map) {
        disruptions <- map["disruptions"]
        pagination <- map["pagination"]
        pois <- map["pois"]
        error <- map["error"]
        feedPublishers <- map["feed_publishers"]
    }

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["disruptions"] = self.disruptions?.encodeToJSON()
        nillableDictionary["pagination"] = self.pagination?.encodeToJSON()
        nillableDictionary["pois"] = self.pois?.encodeToJSON()
        nillableDictionary["error"] = self.error?.encodeToJSON()
        nillableDictionary["feed_publishers"] = self.feedPublishers?.encodeToJSON()

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}

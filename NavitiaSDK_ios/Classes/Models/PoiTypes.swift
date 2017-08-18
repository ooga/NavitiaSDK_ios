//
// PoiTypes.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import ObjectMapper


open class PoiTypes: JSONEncodable, Mappable {

    public var disruptions: [Disruption]?
    public var pagination: Pagination?
    public var error: ModelError?
    public var poiTypes: [PoiType]?
    public var feedPublishers: [FeedPublisher]?

    public init() {}
    required public init?(map: Map) {

    }


    public func mapping(map: Map) {
        disruptions <- map["disruptions"]
        pagination <- map["pagination"]
        error <- map["error"]
        poiTypes <- map["poi_types"]
        feedPublishers <- map["feed_publishers"]
    }

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["disruptions"] = self.disruptions?.encodeToJSON()
        nillableDictionary["pagination"] = self.pagination?.encodeToJSON()
        nillableDictionary["error"] = self.error?.encodeToJSON()
        nillableDictionary["poi_types"] = self.poiTypes?.encodeToJSON()
        nillableDictionary["feed_publishers"] = self.feedPublishers?.encodeToJSON()

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}

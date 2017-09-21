//
// StopSchedule.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import ObjectMapper


open class StopSchedule: JSONEncodable, Mappable {

    public var stopPoint: StopPoint?
    public var links: [LinkSchema]?
    public var dateTimes: [DateTimeType]?
    public var route: Route?
    public var additionalInformations: String?
    public var displayInformations: RouteDisplayInformation?

    public init() {}
    required public init?(map: Map) {

    }


    public func mapping(map: Map) {
        stopPoint <- map["stop_point"]
        links <- map["links"]
        dateTimes <- map["date_times"]
        route <- map["route"]
        additionalInformations <- map["additional_informations"]
        displayInformations <- map["display_informations"]
    }

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["stop_point"] = self.stopPoint?.encodeToJSON()
        nillableDictionary["links"] = self.links?.encodeToJSON()
        nillableDictionary["date_times"] = self.dateTimes?.encodeToJSON()
        nillableDictionary["route"] = self.route?.encodeToJSON()
        nillableDictionary["additional_informations"] = self.additionalInformations
        nillableDictionary["display_informations"] = self.displayInformations?.encodeToJSON()

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
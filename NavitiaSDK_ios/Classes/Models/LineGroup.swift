//
// LineGroup.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import ObjectMapper


open class LineGroup: JSONEncodable, Mappable {

    /** Name of the object */
    public var name: String?
    public var lines: [Line]?
    public var mainLine: Line?
    public var comments: [Comment]?
    /** Identifier of the object */
    public var id: String?

    public init() {}
    required public init?(map: Map) {

    }


    public func mapping(map: Map) {
        name <- map["name"]
        lines <- map["lines"]
        mainLine <- map["main_line"]
        comments <- map["comments"]
        id <- map["id"]
    }

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["name"] = self.name
        nillableDictionary["lines"] = self.lines?.encodeToJSON()
        nillableDictionary["main_line"] = self.mainLine?.encodeToJSON()
        nillableDictionary["comments"] = self.comments?.encodeToJSON()
        nillableDictionary["id"] = self.id

        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}

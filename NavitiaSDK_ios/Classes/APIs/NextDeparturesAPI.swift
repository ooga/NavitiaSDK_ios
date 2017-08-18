//
// NextDeparturesAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire
import AlamofireObjectMapper


open class CoverageLonLatDeparturesRequestBuilder: NSObject {
    let currentApi: NextDeparturesAPI

    /**
    * enum for parameter dataFreshness
    */
    public enum DataFreshness_getCoverageLonLatDepartures: String { 
        case baseSchedule = "base_schedule"
        case adaptedSchedule = "adapted_schedule"
        case realtime = "realtime"
    }
    var lat: Double? = nil
    var lon: Double? = nil
    var filter: String? = nil
    var fromDatetime: String? = nil
    var untilDatetime: String? = nil
    var duration: Int32? = nil
    var depth: Int32? = nil
    var count: Int32? = nil
    var startPage: Int32? = nil
    var maxDateTimes: Int32? = nil
    var forbiddenId: [String]? = nil
    var forbiddenUris: [String]? = nil
    var calendar: String? = nil
    var distance: Int32? = nil
    var showCodes: Bool? = nil
    var dataFreshness: DataFreshness_getCoverageLonLatDepartures? = nil
    var itemsPerSchedule: Int32? = nil
    var disableGeojson: Bool? = nil

    public init(currentApi: NextDeparturesAPI) {
        self.currentApi = currentApi
    }

    open func withLat(_ lat: Double) -> CoverageLonLatDeparturesRequestBuilder {
        self.lat = lat
        return self
    }
    open func withLon(_ lon: Double) -> CoverageLonLatDeparturesRequestBuilder {
        self.lon = lon
        return self
    }
    open func withFilter(_ filter: String) -> CoverageLonLatDeparturesRequestBuilder {
        self.filter = filter
        return self
    }
    open func withFromDatetime(_ fromDatetime: String) -> CoverageLonLatDeparturesRequestBuilder {
        self.fromDatetime = fromDatetime
        return self
    }
    open func withUntilDatetime(_ untilDatetime: String) -> CoverageLonLatDeparturesRequestBuilder {
        self.untilDatetime = untilDatetime
        return self
    }
    open func withDuration(_ duration: Int32) -> CoverageLonLatDeparturesRequestBuilder {
        self.duration = duration
        return self
    }
    open func withDepth(_ depth: Int32) -> CoverageLonLatDeparturesRequestBuilder {
        self.depth = depth
        return self
    }
    open func withCount(_ count: Int32) -> CoverageLonLatDeparturesRequestBuilder {
        self.count = count
        return self
    }
    open func withStartPage(_ startPage: Int32) -> CoverageLonLatDeparturesRequestBuilder {
        self.startPage = startPage
        return self
    }
    open func withMaxDateTimes(_ maxDateTimes: Int32) -> CoverageLonLatDeparturesRequestBuilder {
        self.maxDateTimes = maxDateTimes
        return self
    }
    open func withForbiddenId(_ forbiddenId: [String]) -> CoverageLonLatDeparturesRequestBuilder {
        self.forbiddenId = forbiddenId
        return self
    }
    open func withForbiddenUris(_ forbiddenUris: [String]) -> CoverageLonLatDeparturesRequestBuilder {
        self.forbiddenUris = forbiddenUris
        return self
    }
    open func withCalendar(_ calendar: String) -> CoverageLonLatDeparturesRequestBuilder {
        self.calendar = calendar
        return self
    }
    open func withDistance(_ distance: Int32) -> CoverageLonLatDeparturesRequestBuilder {
        self.distance = distance
        return self
    }
    open func withShowCodes(_ showCodes: Bool) -> CoverageLonLatDeparturesRequestBuilder {
        self.showCodes = showCodes
        return self
    }
    open func withDataFreshness(_ dataFreshness: DataFreshness_getCoverageLonLatDepartures) -> CoverageLonLatDeparturesRequestBuilder {
        self.dataFreshness = dataFreshness
        return self
    }
    open func withDataFreshness(_ dataFreshnessValue: String) -> CoverageLonLatDeparturesRequestBuilder {
        return withDataFreshness(DataFreshness_getCoverageLonLatDepartures(rawValue: dataFreshnessValue)!);
    }
    open func withItemsPerSchedule(_ itemsPerSchedule: Int32) -> CoverageLonLatDeparturesRequestBuilder {
        self.itemsPerSchedule = itemsPerSchedule
        return self
    }
    open func withDisableGeojson(_ disableGeojson: Bool) -> CoverageLonLatDeparturesRequestBuilder {
        self.disableGeojson = disableGeojson
        return self
    }

    open func makeUrl() -> String {
        var path = "/coverage/{lon};{lat}/departures"
        path = path.replacingOccurrences(of: "{lat}", with: "\(self.lat!)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{lon}", with: "\(self.lon!)", options: .literal, range: nil)
        let URLString = "https://api.navitia.io/v1" + path
        let url = NSURLComponents(string: URLString)

        let paramValues: [String: Any] = [
            "filter": self.filter, 
            "from_datetime": self.fromDatetime, 
            "until_datetime": self.untilDatetime, 
            "duration": self.duration?.encodeToJSON(), 
            "depth": self.depth?.encodeToJSON(), 
            "count": self.count?.encodeToJSON(), 
            "start_page": self.startPage?.encodeToJSON(), 
            "max_date_times": self.maxDateTimes?.encodeToJSON(), 
            "forbidden_id[]": self.forbiddenId, 
            "forbidden_uris[]": self.forbiddenUris, 
            "calendar": self.calendar, 
            "distance": self.distance?.encodeToJSON(), 
            "show_codes": self.showCodes, 
            "data_freshness": self.dataFreshness?.rawValue, 
            "items_per_schedule": self.itemsPerSchedule?.encodeToJSON(), 
            "disable_geojson": self.disableGeojson
        ]
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: paramValues)

        return (url?.string ?? URLString)
    }

    open func get(completion: @escaping ((_ data: Departures?,_ error: Error?) -> Void)) {
        if (self.lat == nil) {
            completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : lat"])))
        }
        if (self.lon == nil) {
            completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : lon"])))
        }

        Alamofire.request(self.makeUrl())
            .authenticate(user: currentApi.token, password: "")
            .validate()
            .responseObject{ (response: (DataResponse<Departures>)) in
                switch response.result {
                case .success:
                    completion(response.result.value, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }

    open func rawGet(completion: @escaping ((_ data: String?,_ error: Error?) -> Void)) {
    if (self.lat == nil) {
        completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : lat"])))
    }
    if (self.lon == nil) {
        completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : lon"])))
    }

    Alamofire.request(self.makeUrl())
        .authenticate(user: currentApi.token, password: "")
        .validate()
        .responseString{ (response: (DataResponse<String>)) in
            switch response.result {
            case .success:
                completion(response.result.value, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

open class CoverageLonLatUriDeparturesRequestBuilder: NSObject {
    let currentApi: NextDeparturesAPI

    /**
    * enum for parameter dataFreshness
    */
    public enum DataFreshness_getCoverageLonLatUriDepartures: String { 
        case baseSchedule = "base_schedule"
        case adaptedSchedule = "adapted_schedule"
        case realtime = "realtime"
    }
    var lat: Double? = nil
    var lon: Double? = nil
    var uri: String? = nil
    var filter: String? = nil
    var fromDatetime: String? = nil
    var untilDatetime: String? = nil
    var duration: Int32? = nil
    var depth: Int32? = nil
    var count: Int32? = nil
    var startPage: Int32? = nil
    var maxDateTimes: Int32? = nil
    var forbiddenId: [String]? = nil
    var forbiddenUris: [String]? = nil
    var calendar: String? = nil
    var distance: Int32? = nil
    var showCodes: Bool? = nil
    var dataFreshness: DataFreshness_getCoverageLonLatUriDepartures? = nil
    var itemsPerSchedule: Int32? = nil
    var disableGeojson: Bool? = nil

    public init(currentApi: NextDeparturesAPI) {
        self.currentApi = currentApi
    }

    open func withLat(_ lat: Double) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.lat = lat
        return self
    }
    open func withLon(_ lon: Double) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.lon = lon
        return self
    }
    open func withUri(_ uri: String) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.uri = uri
        return self
    }
    open func withFilter(_ filter: String) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.filter = filter
        return self
    }
    open func withFromDatetime(_ fromDatetime: String) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.fromDatetime = fromDatetime
        return self
    }
    open func withUntilDatetime(_ untilDatetime: String) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.untilDatetime = untilDatetime
        return self
    }
    open func withDuration(_ duration: Int32) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.duration = duration
        return self
    }
    open func withDepth(_ depth: Int32) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.depth = depth
        return self
    }
    open func withCount(_ count: Int32) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.count = count
        return self
    }
    open func withStartPage(_ startPage: Int32) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.startPage = startPage
        return self
    }
    open func withMaxDateTimes(_ maxDateTimes: Int32) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.maxDateTimes = maxDateTimes
        return self
    }
    open func withForbiddenId(_ forbiddenId: [String]) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.forbiddenId = forbiddenId
        return self
    }
    open func withForbiddenUris(_ forbiddenUris: [String]) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.forbiddenUris = forbiddenUris
        return self
    }
    open func withCalendar(_ calendar: String) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.calendar = calendar
        return self
    }
    open func withDistance(_ distance: Int32) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.distance = distance
        return self
    }
    open func withShowCodes(_ showCodes: Bool) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.showCodes = showCodes
        return self
    }
    open func withDataFreshness(_ dataFreshness: DataFreshness_getCoverageLonLatUriDepartures) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.dataFreshness = dataFreshness
        return self
    }
    open func withDataFreshness(_ dataFreshnessValue: String) -> CoverageLonLatUriDeparturesRequestBuilder {
        return withDataFreshness(DataFreshness_getCoverageLonLatUriDepartures(rawValue: dataFreshnessValue)!);
    }
    open func withItemsPerSchedule(_ itemsPerSchedule: Int32) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.itemsPerSchedule = itemsPerSchedule
        return self
    }
    open func withDisableGeojson(_ disableGeojson: Bool) -> CoverageLonLatUriDeparturesRequestBuilder {
        self.disableGeojson = disableGeojson
        return self
    }

    open func makeUrl() -> String {
        var path = "/coverage/{lon};{lat}/{uri}/departures"
        path = path.replacingOccurrences(of: "{lat}", with: "\(self.lat!)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{lon}", with: "\(self.lon!)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{uri}", with: "\(self.uri!)", options: .literal, range: nil)
        let URLString = "https://api.navitia.io/v1" + path
        let url = NSURLComponents(string: URLString)

        let paramValues: [String: Any] = [
            "filter": self.filter, 
            "from_datetime": self.fromDatetime, 
            "until_datetime": self.untilDatetime, 
            "duration": self.duration?.encodeToJSON(), 
            "depth": self.depth?.encodeToJSON(), 
            "count": self.count?.encodeToJSON(), 
            "start_page": self.startPage?.encodeToJSON(), 
            "max_date_times": self.maxDateTimes?.encodeToJSON(), 
            "forbidden_id[]": self.forbiddenId, 
            "forbidden_uris[]": self.forbiddenUris, 
            "calendar": self.calendar, 
            "distance": self.distance?.encodeToJSON(), 
            "show_codes": self.showCodes, 
            "data_freshness": self.dataFreshness?.rawValue, 
            "items_per_schedule": self.itemsPerSchedule?.encodeToJSON(), 
            "disable_geojson": self.disableGeojson
        ]
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: paramValues)

        return (url?.string ?? URLString)
    }

    open func get(completion: @escaping ((_ data: Departures?,_ error: Error?) -> Void)) {
        if (self.lat == nil) {
            completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : lat"])))
        }
        if (self.lon == nil) {
            completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : lon"])))
        }
        if (self.uri == nil) {
            completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : uri"])))
        }

        Alamofire.request(self.makeUrl())
            .authenticate(user: currentApi.token, password: "")
            .validate()
            .responseObject{ (response: (DataResponse<Departures>)) in
                switch response.result {
                case .success:
                    completion(response.result.value, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }

    open func rawGet(completion: @escaping ((_ data: String?,_ error: Error?) -> Void)) {
    if (self.lat == nil) {
        completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : lat"])))
    }
    if (self.lon == nil) {
        completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : lon"])))
    }
    if (self.uri == nil) {
        completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : uri"])))
    }

    Alamofire.request(self.makeUrl())
        .authenticate(user: currentApi.token, password: "")
        .validate()
        .responseString{ (response: (DataResponse<String>)) in
            switch response.result {
            case .success:
                completion(response.result.value, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

open class CoverageRegionDeparturesRequestBuilder: NSObject {
    let currentApi: NextDeparturesAPI

    /**
    * enum for parameter dataFreshness
    */
    public enum DataFreshness_getCoverageRegionDepartures: String { 
        case baseSchedule = "base_schedule"
        case adaptedSchedule = "adapted_schedule"
        case realtime = "realtime"
    }
    var region: String? = nil
    var filter: String? = nil
    var fromDatetime: String? = nil
    var untilDatetime: String? = nil
    var duration: Int32? = nil
    var depth: Int32? = nil
    var count: Int32? = nil
    var startPage: Int32? = nil
    var maxDateTimes: Int32? = nil
    var forbiddenId: [String]? = nil
    var forbiddenUris: [String]? = nil
    var calendar: String? = nil
    var distance: Int32? = nil
    var showCodes: Bool? = nil
    var dataFreshness: DataFreshness_getCoverageRegionDepartures? = nil
    var itemsPerSchedule: Int32? = nil
    var disableGeojson: Bool? = nil

    public init(currentApi: NextDeparturesAPI) {
        self.currentApi = currentApi
    }

    open func withRegion(_ region: String) -> CoverageRegionDeparturesRequestBuilder {
        self.region = region
        return self
    }
    open func withFilter(_ filter: String) -> CoverageRegionDeparturesRequestBuilder {
        self.filter = filter
        return self
    }
    open func withFromDatetime(_ fromDatetime: String) -> CoverageRegionDeparturesRequestBuilder {
        self.fromDatetime = fromDatetime
        return self
    }
    open func withUntilDatetime(_ untilDatetime: String) -> CoverageRegionDeparturesRequestBuilder {
        self.untilDatetime = untilDatetime
        return self
    }
    open func withDuration(_ duration: Int32) -> CoverageRegionDeparturesRequestBuilder {
        self.duration = duration
        return self
    }
    open func withDepth(_ depth: Int32) -> CoverageRegionDeparturesRequestBuilder {
        self.depth = depth
        return self
    }
    open func withCount(_ count: Int32) -> CoverageRegionDeparturesRequestBuilder {
        self.count = count
        return self
    }
    open func withStartPage(_ startPage: Int32) -> CoverageRegionDeparturesRequestBuilder {
        self.startPage = startPage
        return self
    }
    open func withMaxDateTimes(_ maxDateTimes: Int32) -> CoverageRegionDeparturesRequestBuilder {
        self.maxDateTimes = maxDateTimes
        return self
    }
    open func withForbiddenId(_ forbiddenId: [String]) -> CoverageRegionDeparturesRequestBuilder {
        self.forbiddenId = forbiddenId
        return self
    }
    open func withForbiddenUris(_ forbiddenUris: [String]) -> CoverageRegionDeparturesRequestBuilder {
        self.forbiddenUris = forbiddenUris
        return self
    }
    open func withCalendar(_ calendar: String) -> CoverageRegionDeparturesRequestBuilder {
        self.calendar = calendar
        return self
    }
    open func withDistance(_ distance: Int32) -> CoverageRegionDeparturesRequestBuilder {
        self.distance = distance
        return self
    }
    open func withShowCodes(_ showCodes: Bool) -> CoverageRegionDeparturesRequestBuilder {
        self.showCodes = showCodes
        return self
    }
    open func withDataFreshness(_ dataFreshness: DataFreshness_getCoverageRegionDepartures) -> CoverageRegionDeparturesRequestBuilder {
        self.dataFreshness = dataFreshness
        return self
    }
    open func withDataFreshness(_ dataFreshnessValue: String) -> CoverageRegionDeparturesRequestBuilder {
        return withDataFreshness(DataFreshness_getCoverageRegionDepartures(rawValue: dataFreshnessValue)!);
    }
    open func withItemsPerSchedule(_ itemsPerSchedule: Int32) -> CoverageRegionDeparturesRequestBuilder {
        self.itemsPerSchedule = itemsPerSchedule
        return self
    }
    open func withDisableGeojson(_ disableGeojson: Bool) -> CoverageRegionDeparturesRequestBuilder {
        self.disableGeojson = disableGeojson
        return self
    }

    open func makeUrl() -> String {
        var path = "/coverage/{region}/departures"
        path = path.replacingOccurrences(of: "{region}", with: "\(self.region!)", options: .literal, range: nil)
        let URLString = "https://api.navitia.io/v1" + path
        let url = NSURLComponents(string: URLString)

        let paramValues: [String: Any] = [
            "filter": self.filter, 
            "from_datetime": self.fromDatetime, 
            "until_datetime": self.untilDatetime, 
            "duration": self.duration?.encodeToJSON(), 
            "depth": self.depth?.encodeToJSON(), 
            "count": self.count?.encodeToJSON(), 
            "start_page": self.startPage?.encodeToJSON(), 
            "max_date_times": self.maxDateTimes?.encodeToJSON(), 
            "forbidden_id[]": self.forbiddenId, 
            "forbidden_uris[]": self.forbiddenUris, 
            "calendar": self.calendar, 
            "distance": self.distance?.encodeToJSON(), 
            "show_codes": self.showCodes, 
            "data_freshness": self.dataFreshness?.rawValue, 
            "items_per_schedule": self.itemsPerSchedule?.encodeToJSON(), 
            "disable_geojson": self.disableGeojson
        ]
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: paramValues)

        return (url?.string ?? URLString)
    }

    open func get(completion: @escaping ((_ data: Departures?,_ error: Error?) -> Void)) {
        if (self.region == nil) {
            completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : region"])))
        }

        Alamofire.request(self.makeUrl())
            .authenticate(user: currentApi.token, password: "")
            .validate()
            .responseObject{ (response: (DataResponse<Departures>)) in
                switch response.result {
                case .success:
                    completion(response.result.value, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }

    open func rawGet(completion: @escaping ((_ data: String?,_ error: Error?) -> Void)) {
    if (self.region == nil) {
        completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : region"])))
    }

    Alamofire.request(self.makeUrl())
        .authenticate(user: currentApi.token, password: "")
        .validate()
        .responseString{ (response: (DataResponse<String>)) in
            switch response.result {
            case .success:
                completion(response.result.value, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}

open class CoverageRegionUriDeparturesRequestBuilder: NSObject {
    let currentApi: NextDeparturesAPI

    /**
    * enum for parameter dataFreshness
    */
    public enum DataFreshness_getCoverageRegionUriDepartures: String { 
        case baseSchedule = "base_schedule"
        case adaptedSchedule = "adapted_schedule"
        case realtime = "realtime"
    }
    var region: String? = nil
    var uri: String? = nil
    var filter: String? = nil
    var fromDatetime: String? = nil
    var untilDatetime: String? = nil
    var duration: Int32? = nil
    var depth: Int32? = nil
    var count: Int32? = nil
    var startPage: Int32? = nil
    var maxDateTimes: Int32? = nil
    var forbiddenId: [String]? = nil
    var forbiddenUris: [String]? = nil
    var calendar: String? = nil
    var distance: Int32? = nil
    var showCodes: Bool? = nil
    var dataFreshness: DataFreshness_getCoverageRegionUriDepartures? = nil
    var itemsPerSchedule: Int32? = nil
    var disableGeojson: Bool? = nil

    public init(currentApi: NextDeparturesAPI) {
        self.currentApi = currentApi
    }

    open func withRegion(_ region: String) -> CoverageRegionUriDeparturesRequestBuilder {
        self.region = region
        return self
    }
    open func withUri(_ uri: String) -> CoverageRegionUriDeparturesRequestBuilder {
        self.uri = uri
        return self
    }
    open func withFilter(_ filter: String) -> CoverageRegionUriDeparturesRequestBuilder {
        self.filter = filter
        return self
    }
    open func withFromDatetime(_ fromDatetime: String) -> CoverageRegionUriDeparturesRequestBuilder {
        self.fromDatetime = fromDatetime
        return self
    }
    open func withUntilDatetime(_ untilDatetime: String) -> CoverageRegionUriDeparturesRequestBuilder {
        self.untilDatetime = untilDatetime
        return self
    }
    open func withDuration(_ duration: Int32) -> CoverageRegionUriDeparturesRequestBuilder {
        self.duration = duration
        return self
    }
    open func withDepth(_ depth: Int32) -> CoverageRegionUriDeparturesRequestBuilder {
        self.depth = depth
        return self
    }
    open func withCount(_ count: Int32) -> CoverageRegionUriDeparturesRequestBuilder {
        self.count = count
        return self
    }
    open func withStartPage(_ startPage: Int32) -> CoverageRegionUriDeparturesRequestBuilder {
        self.startPage = startPage
        return self
    }
    open func withMaxDateTimes(_ maxDateTimes: Int32) -> CoverageRegionUriDeparturesRequestBuilder {
        self.maxDateTimes = maxDateTimes
        return self
    }
    open func withForbiddenId(_ forbiddenId: [String]) -> CoverageRegionUriDeparturesRequestBuilder {
        self.forbiddenId = forbiddenId
        return self
    }
    open func withForbiddenUris(_ forbiddenUris: [String]) -> CoverageRegionUriDeparturesRequestBuilder {
        self.forbiddenUris = forbiddenUris
        return self
    }
    open func withCalendar(_ calendar: String) -> CoverageRegionUriDeparturesRequestBuilder {
        self.calendar = calendar
        return self
    }
    open func withDistance(_ distance: Int32) -> CoverageRegionUriDeparturesRequestBuilder {
        self.distance = distance
        return self
    }
    open func withShowCodes(_ showCodes: Bool) -> CoverageRegionUriDeparturesRequestBuilder {
        self.showCodes = showCodes
        return self
    }
    open func withDataFreshness(_ dataFreshness: DataFreshness_getCoverageRegionUriDepartures) -> CoverageRegionUriDeparturesRequestBuilder {
        self.dataFreshness = dataFreshness
        return self
    }
    open func withDataFreshness(_ dataFreshnessValue: String) -> CoverageRegionUriDeparturesRequestBuilder {
        return withDataFreshness(DataFreshness_getCoverageRegionUriDepartures(rawValue: dataFreshnessValue)!);
    }
    open func withItemsPerSchedule(_ itemsPerSchedule: Int32) -> CoverageRegionUriDeparturesRequestBuilder {
        self.itemsPerSchedule = itemsPerSchedule
        return self
    }
    open func withDisableGeojson(_ disableGeojson: Bool) -> CoverageRegionUriDeparturesRequestBuilder {
        self.disableGeojson = disableGeojson
        return self
    }

    open func makeUrl() -> String {
        var path = "/coverage/{region}/{uri}/departures"
        path = path.replacingOccurrences(of: "{region}", with: "\(self.region!)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{uri}", with: "\(self.uri!)", options: .literal, range: nil)
        let URLString = "https://api.navitia.io/v1" + path
        let url = NSURLComponents(string: URLString)

        let paramValues: [String: Any] = [
            "filter": self.filter, 
            "from_datetime": self.fromDatetime, 
            "until_datetime": self.untilDatetime, 
            "duration": self.duration?.encodeToJSON(), 
            "depth": self.depth?.encodeToJSON(), 
            "count": self.count?.encodeToJSON(), 
            "start_page": self.startPage?.encodeToJSON(), 
            "max_date_times": self.maxDateTimes?.encodeToJSON(), 
            "forbidden_id[]": self.forbiddenId, 
            "forbidden_uris[]": self.forbiddenUris, 
            "calendar": self.calendar, 
            "distance": self.distance?.encodeToJSON(), 
            "show_codes": self.showCodes, 
            "data_freshness": self.dataFreshness?.rawValue, 
            "items_per_schedule": self.itemsPerSchedule?.encodeToJSON(), 
            "disable_geojson": self.disableGeojson
        ]
        url?.queryItems = APIHelper.mapValuesToQueryItems(values: paramValues)

        return (url?.string ?? URLString)
    }

    open func get(completion: @escaping ((_ data: Departures?,_ error: Error?) -> Void)) {
        if (self.region == nil) {
            completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : region"])))
        }
        if (self.uri == nil) {
            completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : uri"])))
        }

        Alamofire.request(self.makeUrl())
            .authenticate(user: currentApi.token, password: "")
            .validate()
            .responseObject{ (response: (DataResponse<Departures>)) in
                switch response.result {
                case .success:
                    completion(response.result.value, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }

    open func rawGet(completion: @escaping ((_ data: String?,_ error: Error?) -> Void)) {
    if (self.region == nil) {
        completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : region"])))
    }
    if (self.uri == nil) {
        completion(nil, ErrorResponse.Error(500, nil, NSError(domain: "localhost", code: 500, userInfo: ["reason": "Missing mandatory argument : uri"])))
    }

    Alamofire.request(self.makeUrl())
        .authenticate(user: currentApi.token, password: "")
        .validate()
        .responseString{ (response: (DataResponse<String>)) in
            switch response.result {
            case .success:
                completion(response.result.value, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}



open class NextDeparturesAPI: APIBase {
    let token: String

    public init(token: String) {
        self.token = token
    }

    public func newCoverageLonLatDeparturesRequestBuilder() -> CoverageLonLatDeparturesRequestBuilder {
        return CoverageLonLatDeparturesRequestBuilder(currentApi: self)
    }
    public func newCoverageLonLatUriDeparturesRequestBuilder() -> CoverageLonLatUriDeparturesRequestBuilder {
        return CoverageLonLatUriDeparturesRequestBuilder(currentApi: self)
    }
    public func newCoverageRegionDeparturesRequestBuilder() -> CoverageRegionDeparturesRequestBuilder {
        return CoverageRegionDeparturesRequestBuilder(currentApi: self)
    }
    public func newCoverageRegionUriDeparturesRequestBuilder() -> CoverageRegionUriDeparturesRequestBuilder {
        return CoverageRegionUriDeparturesRequestBuilder(currentApi: self)
    }
}

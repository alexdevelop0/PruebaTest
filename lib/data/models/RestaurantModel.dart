// To parse this JSON data, do
//
//     final modelRestaurant = modelRestaurantFromJson(jsonString);

import 'dart:convert';

ModelRestaurant modelRestaurantFromJson(String str) => ModelRestaurant.fromJson(json.decode(str));

String modelRestaurantToJson(ModelRestaurant data) => json.encode(data.toJson());

class ModelRestaurant {
    ModelRestaurant({
        this.type,
        this.features,
    });

    String type;
    List<Feature> features;

    factory ModelRestaurant.fromJson(Map<String, dynamic> json) => ModelRestaurant(
        type: json["type"],
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
    };
}

class Feature {
    Feature({
        this.type,
        this.properties,
        this.geometry,
    });

    FeatureType type;
    Properties properties;
    Geometry geometry;

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: featureTypeValues.map[json["type"]],
        properties: Properties.fromJson(json["properties"]),
        geometry: Geometry.fromJson(json["geometry"]),
    );

    Map<String, dynamic> toJson() => {
        "type": featureTypeValues.reverse[type],
        "properties": properties.toJson(),
        "geometry": geometry.toJson(),
    };
}

class Geometry {
    Geometry({
        this.type,
        this.coordinates,
    });

    GeometryType type;
    List<double> coordinates;

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: geometryTypeValues.map[json["type"]],
        coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": geometryTypeValues.reverse[type],
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    };
}

enum GeometryType { POINT }

final geometryTypeValues = EnumValues({
    "Point": GeometryType.POINT
});

class Properties {
    Properties({
        this.name,
        this.housenumber,
        this.street,
        this.suburb,
        this.city,
        this.county,
        this.state,
        this.postcode,
        this.country,
        this.countryCode,
        this.lon,
        this.lat,
        this.formatted,
        this.addressLine1,
        this.addressLine2,
        this.categories,
        this.details,
        this.datasource,
        this.placeId,
        this.town,
    });

    String name;
    String housenumber;
    String street;
    String suburb;
    City city;
    County county;
    StateBase state;
    String postcode;
    Country country;
    CountryCode countryCode;
    double lon;
    double lat;
    String formatted;
    String addressLine1;
    String addressLine2;
    List<String> categories;
    List<Detail> details;
    Datasource datasource;
    String placeId;
    City town;

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        name: json["name"],
        housenumber: json["housenumber"] == null ? null : json["housenumber"],
        street: json["street"],
        suburb: json["suburb"] == null ? null : json["suburb"],
        city: cityValues.map[json["city"]],
        county: countyValues.map[json["county"]],
        state: stateValues.map[json["state"]],
        postcode: json["postcode"],
        country: countryValues.map[json["country"]],
        countryCode: countryCodeValues.map[json["country_code"]],
        lon: json["lon"].toDouble(),
        lat: json["lat"].toDouble(),
        formatted: json["formatted"],
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        details: List<Detail>.from(json["details"].map((x) => detailValues.map[x])),
        datasource: Datasource.fromJson(json["datasource"]),
        placeId: json["place_id"],
        town: json["town"] == null ? null : cityValues.map[json["town"]],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "housenumber": housenumber == null ? null : housenumber,
        "street": street,
        "suburb": suburb == null ? null : suburb,
        "city": cityValues.reverse[city],
        "county": countyValues.reverse[county],
        "state": stateValues.reverse[state],
        "postcode": postcode,
        "country": countryValues.reverse[country],
        "country_code": countryCodeValues.reverse[countryCode],
        "lon": lon,
        "lat": lat,
        "formatted": formatted,
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "details": List<dynamic>.from(details.map((x) => detailValues.reverse[x])),
        "datasource": datasource.toJson(),
        "place_id": placeId,
        "town": town == null ? null : cityValues.reverse[town],
    };
}

enum City { DONAUWRTH, ASBACH_BUMENHEIM, FELSHEIM }

final cityValues = EnumValues({
    "Asbach-Bäumenheim": City.ASBACH_BUMENHEIM,
    "Donauwörth": City.DONAUWRTH,
    "Felsheim": City.FELSHEIM
});

enum Country { GERMANY }

final countryValues = EnumValues({
    "Germany": Country.GERMANY
});

enum CountryCode { DE }

final countryCodeValues = EnumValues({
    "de": CountryCode.DE
});

enum County { LANDKREIS_DONAU_RIES }

final countyValues = EnumValues({
    "Landkreis Donau-Ries": County.LANDKREIS_DONAU_RIES
});

class Datasource {
    Datasource({
        this.sourcename,
        this.attribution,
        this.license,
        this.url,
    });

    Sourcename sourcename;
    Attribution attribution;
    License license;
    String url;

    factory Datasource.fromJson(Map<String, dynamic> json) => Datasource(
        sourcename: sourcenameValues.map[json["sourcename"]],
        attribution: attributionValues.map[json["attribution"]],
        license: licenseValues.map[json["license"]],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "sourcename": sourcenameValues.reverse[sourcename],
        "attribution": attributionValues.reverse[attribution],
        "license": licenseValues.reverse[license],
        "url": url,
    };
}

enum Attribution { OPEN_STREET_MAP_CONTRIBUTORS }

final attributionValues = EnumValues({
    "© OpenStreetMap contributors": Attribution.OPEN_STREET_MAP_CONTRIBUTORS
});

enum License { OPEN_DATABASE_LICENCE }

final licenseValues = EnumValues({
    "Open Database Licence": License.OPEN_DATABASE_LICENCE
});

enum Sourcename { OPENSTREETMAP }

final sourcenameValues = EnumValues({
    "openstreetmap": Sourcename.OPENSTREETMAP
});

enum Detail { DETAILS, DETAILS_CATERING, DETAILS_CONTACT, DETAILS_FACILITIES }

final detailValues = EnumValues({
    "details": Detail.DETAILS,
    "details.catering": Detail.DETAILS_CATERING,
    "details.contact": Detail.DETAILS_CONTACT,
    "details.facilities": Detail.DETAILS_FACILITIES
});

enum StateBase { BAVARIA }

final stateValues = EnumValues({
    "Bavaria": StateBase.BAVARIA
});

enum FeatureType { FEATURE }

final featureTypeValues = EnumValues({
    "Feature": FeatureType.FEATURE
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}

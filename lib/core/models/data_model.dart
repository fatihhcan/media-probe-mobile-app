// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    String uri;
    String url;
    int id;
    int assetId;
    String source;
    DateTime publishedDate;
    DateTime updated;
    String section;
    String subsection;
    String nytdsection;
    String adxKeywords;
    dynamic column;
    String byline;
    String type;
    String title;
    String dataModelAbstract;
    List<String> desFacet;
    List<dynamic> orgFacet;
    List<String> perFacet;
    List<dynamic> geoFacet;
    List<Media> media;
    int etaId;

    DataModel({
        required this.uri,
        required this.url,
        required this.id,
        required this.assetId,
        required this.source,
        required this.publishedDate,
        required this.updated,
        required this.section,
        required this.subsection,
        required this.nytdsection,
        required this.adxKeywords,
        this.column,
        required this.byline,
        required this.type,
        required this.title,
        required this.dataModelAbstract,
        required this.desFacet,
        required this.orgFacet,
        required this.perFacet,
        required this.geoFacet,
        required this.media,
        required this.etaId,
    });

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        uri: json["uri"],
        url: json["url"],
        id: json["id"],
        assetId: json["asset_id"],
        source: json["source"],
        publishedDate: DateTime.parse(json["published_date"]),
        updated: DateTime.parse(json["updated"]),
        section: json["section"],
        subsection: json["subsection"],
        nytdsection: json["nytdsection"],
        adxKeywords: json["adx_keywords"],
        column: json["column"],
        byline: json["byline"],
        type: json["type"],
        title: json["title"],
        dataModelAbstract: json["abstract"],
        desFacet: List<String>.from(json["des_facet"].map((x) => x)),
        orgFacet: List<dynamic>.from(json["org_facet"].map((x) => x)),
        perFacet: List<String>.from(json["per_facet"].map((x) => x)),
        geoFacet: List<dynamic>.from(json["geo_facet"].map((x) => x)),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        etaId: json["eta_id"],
    );

    Map<String, dynamic> toJson() => {
        "uri": uri,
        "url": url,
        "id": id,
        "asset_id": assetId,
        "source": source,
        "published_date": "${publishedDate.year.toString().padLeft(4, '0')}-${publishedDate.month.toString().padLeft(2, '0')}-${publishedDate.day.toString().padLeft(2, '0')}",
        "updated": updated.toIso8601String(),
        "section": section,
        "subsection": subsection,
        "nytdsection": nytdsection,
        "adx_keywords": adxKeywords,
        "column": column,
        "byline": byline,
        "type": type,
        "title": title,
        "abstract": dataModelAbstract,
        "des_facet": List<dynamic>.from(desFacet.map((x) => x)),
        "org_facet": List<dynamic>.from(orgFacet.map((x) => x)),
        "per_facet": List<dynamic>.from(perFacet.map((x) => x)),
        "geo_facet": List<dynamic>.from(geoFacet.map((x) => x)),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
        "eta_id": etaId,
    };
}

class Media {
    String type;
    String subtype;
    String caption;
    String copyright;
    int approvedForSyndication;
    List<MediaMetadatum> mediaMetadata;

    Media({
        required this.type,
        required this.subtype,
        required this.caption,
        required this.copyright,
        required this.approvedForSyndication,
        required this.mediaMetadata,
    });

    factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: json["type"],
        subtype: json["subtype"],
        caption: json["caption"],
        copyright: json["copyright"],
        approvedForSyndication: json["approved_for_syndication"],
        mediaMetadata: List<MediaMetadatum>.from(json["media-metadata"].map((x) => MediaMetadatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "subtype": subtype,
        "caption": caption,
        "copyright": copyright,
        "approved_for_syndication": approvedForSyndication,
        "media-metadata": List<dynamic>.from(mediaMetadata.map((x) => x.toJson())),
    };
}

class MediaMetadatum {
    String url;
    String format;
    int height;
    int width;

    MediaMetadatum({
        required this.url,
        required this.format,
        required this.height,
        required this.width,
    });

    factory MediaMetadatum.fromJson(Map<String, dynamic> json) => MediaMetadatum(
        url: json["url"],
        format: json["format"],
        height: json["height"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "format": format,
        "height": height,
        "width": width,
    };
}

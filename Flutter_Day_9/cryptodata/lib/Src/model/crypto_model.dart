// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

class CryptoData {
  CryptoData({
    required this.message,
    required this.type,
    required this.metaData,
    required this.sponsoredData,
    required this.data,
    required this.rateLimit,
    required this.hasWarning,
  });

  String message;
  int type;
  MetaData metaData;
  List<SponsoredDatum> sponsoredData;
  List<Datum> data;
  RateLimit rateLimit;
  bool hasWarning;

  factory CryptoData.fromRawJson(String str) =>
      CryptoData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CryptoData.fromJson(Map<String, dynamic> json) => CryptoData(
        message: json["Message"],
        type: json["Type"],
        metaData: MetaData.fromJson(json["MetaData"]),
        sponsoredData: List<SponsoredDatum>.from(
            json["SponsoredData"].map((x) => SponsoredDatum.fromJson(x))),
        data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
        rateLimit: RateLimit.fromJson(json["RateLimit"]),
        hasWarning: json["HasWarning"],
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Type": type,
        "MetaData": metaData.toJson(),
        "SponsoredData":
            List<dynamic>.from(sponsoredData.map((x) => x.toJson())),
        "Data": List<dynamic>.from(data.map((x) => x.toJson())),
        "RateLimit": rateLimit.toJson(),
        "HasWarning": hasWarning,
      };
}

class Datum {
  Datum({
    required this.coinInfo,
    required this.raw,
    required this.display,
  });

  CoinInfo coinInfo;
  Raw raw;
  Display display;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        coinInfo: CoinInfo.fromJson(json["CoinInfo"]),
        raw: Raw.fromJson(json["RAW"]),
        display: Display.fromJson(json["DISPLAY"]),
      );

  Map<String, dynamic> toJson() => {
        "CoinInfo": coinInfo.toJson(),
        "RAW": raw.toJson(),
        "DISPLAY": display.toJson(),
      };
}

class CoinInfo {
  CoinInfo({
    required this.id,
    required this.name,
    required this.fullName,
    required this.internal,
    required this.imageUrl,
    required this.url,
    required this.algorithm,
    required this.proofType,
    required this.rating,
    required this.netHashesPerSecond,
    required this.blockNumber,
    required this.blockTime,
    required this.blockReward,
    required this.assetLaunchDate,
    required this.maxSupply,
    required this.type,
    required this.documentType,
  });

  String id;
  String name;
  String fullName;
  String internal;
  String imageUrl;
  String url;
  String algorithm;
  String proofType;
  Rating rating;
  double netHashesPerSecond;
  int blockNumber;
  var blockTime;
  double blockReward;
  DateTime assetLaunchDate;
  double maxSupply;
  int type;
  String documentType;

  factory CoinInfo.fromRawJson(String str) =>
      CoinInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CoinInfo.fromJson(Map<String, dynamic> json) => CoinInfo(
        id: json["Id"],
        name: json["Name"],
        fullName: json["FullName"],
        internal: json["Internal"],
        imageUrl: json["ImageUrl"],
        url: json["Url"],
        algorithm: json["Algorithm"],
        proofType: json["ProofType"],
        rating: Rating.fromJson(json["Rating"]),
        netHashesPerSecond: json["NetHashesPerSecond"].toDouble(),
        blockNumber: json["BlockNumber"],
        blockTime: json["BlockTime"],
        blockReward: json["BlockReward"].toDouble(),
        assetLaunchDate: DateTime.parse(json["AssetLaunchDate"]),
        maxSupply: json["MaxSupply"].toDouble(),
        type: json["Type"],
        documentType: json["DocumentType"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "FullName": fullName,
        "Internal": internal,
        "ImageUrl": imageUrl,
        "Url": url,
        "Algorithm": algorithm,
        "ProofType": proofType,
        "Rating": rating.toJson(),
        "NetHashesPerSecond": netHashesPerSecond,
        "BlockNumber": blockNumber,
        "BlockTime": blockTime,
        "BlockReward": blockReward,
        "AssetLaunchDate":
            "${assetLaunchDate.year.toString().padLeft(4, '0')}-${assetLaunchDate.month.toString().padLeft(2, '0')}-${assetLaunchDate.day.toString().padLeft(2, '0')}",
        "MaxSupply": maxSupply,
        "Type": type,
        "DocumentType": documentType,
      };
}

class Rating {
  Rating({
    required this.weiss,
  });

  Weiss weiss;

  factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        weiss: Weiss.fromJson(json["Weiss"]),
      );

  Map<String, dynamic> toJson() => {
        "Weiss": weiss.toJson(),
      };
}

class Weiss {
  Weiss({
    required this.rating,
    required this.technologyAdoptionRating,
    required this.marketPerformanceRating,
  });

  String rating;
  String technologyAdoptionRating;
  String marketPerformanceRating;

  factory Weiss.fromRawJson(String str) => Weiss.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Weiss.fromJson(Map<String, dynamic> json) => Weiss(
        rating: json["Rating"],
        technologyAdoptionRating: json["TechnologyAdoptionRating"],
        marketPerformanceRating: json["MarketPerformanceRating"],
      );

  Map<String, dynamic> toJson() => {
        "Rating": rating,
        "TechnologyAdoptionRating": technologyAdoptionRating,
        "MarketPerformanceRating": marketPerformanceRating,
      };
}

class Display {
  Display({
    required this.usd,
  });

  DisplayUsd usd;

  factory Display.fromRawJson(String str) => Display.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Display.fromJson(Map<String, dynamic> json) => Display(
        usd: DisplayUsd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd.toJson(),
      };
}

class DisplayUsd {
  DisplayUsd({
    required this.fromsymbol,
    required this.tosymbol,
    required this.market,
    required this.price,
    required this.lastupdate,
    required this.lastvolume,
    required this.lastvolumeto,
    required this.lasttradeid,
    required this.volumeday,
    required this.volumedayto,
    required this.volume24Hour,
    required this.volume24Hourto,
    required this.openday,
    required this.highday,
    required this.lowday,
    required this.open24Hour,
    required this.high24Hour,
    required this.low24Hour,
    required this.lastmarket,
    required this.volumehour,
    required this.volumehourto,
    required this.openhour,
    required this.highhour,
    required this.lowhour,
    required this.toptiervolume24Hour,
    required this.toptiervolume24Hourto,
    required this.change24Hour,
    required this.changepct24Hour,
    required this.changeday,
    required this.changepctday,
    required this.changehour,
    required this.changepcthour,
    required this.conversiontype,
    required this.conversionsymbol,
    required this.supply,
    required this.mktcap,
    required this.mktcappenalty,
    required this.circulatingsupply,
    required this.circulatingsupplymktcap,
    required this.totalvolume24H,
    required this.totalvolume24Hto,
    required this.totaltoptiervolume24H,
    required this.totaltoptiervolume24Hto,
    required this.imageurl,
  });

  String fromsymbol;
  String tosymbol;
  String market;
  String price;
  String lastupdate;
  String lastvolume;
  String lastvolumeto;
  String lasttradeid;
  String volumeday;
  String volumedayto;
  String volume24Hour;
  String volume24Hourto;
  String openday;
  String highday;
  String lowday;
  String open24Hour;
  String high24Hour;
  String low24Hour;
  String lastmarket;
  String volumehour;
  String volumehourto;
  String openhour;
  String highhour;
  String lowhour;
  String toptiervolume24Hour;
  String toptiervolume24Hourto;
  String change24Hour;
  String changepct24Hour;
  String changeday;
  String changepctday;
  String changehour;
  String changepcthour;
  String conversiontype;
  String conversionsymbol;
  String supply;
  String mktcap;
  String mktcappenalty;
  String circulatingsupply;
  String circulatingsupplymktcap;
  String totalvolume24H;
  String totalvolume24Hto;
  String totaltoptiervolume24H;
  String totaltoptiervolume24Hto;
  String imageurl;

  factory DisplayUsd.fromRawJson(String str) =>
      DisplayUsd.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DisplayUsd.fromJson(Map<String, dynamic> json) => DisplayUsd(
        fromsymbol: json["FROMSYMBOL"],
        tosymbol: json["TOSYMBOL"],
        market: json["MARKET"],
        price: json["PRICE"],
        lastupdate: json["LASTUPDATE"],
        lastvolume: json["LASTVOLUME"],
        lastvolumeto: json["LASTVOLUMETO"],
        lasttradeid: json["LASTTRADEID"],
        volumeday: json["VOLUMEDAY"],
        volumedayto: json["VOLUMEDAYTO"],
        volume24Hour: json["VOLUME24HOUR"],
        volume24Hourto: json["VOLUME24HOURTO"],
        openday: json["OPENDAY"],
        highday: json["HIGHDAY"],
        lowday: json["LOWDAY"],
        open24Hour: json["OPEN24HOUR"],
        high24Hour: json["HIGH24HOUR"],
        low24Hour: json["LOW24HOUR"],
        lastmarket: json["LASTMARKET"],
        volumehour: json["VOLUMEHOUR"],
        volumehourto: json["VOLUMEHOURTO"],
        openhour: json["OPENHOUR"],
        highhour: json["HIGHHOUR"],
        lowhour: json["LOWHOUR"],
        toptiervolume24Hour: json["TOPTIERVOLUME24HOUR"],
        toptiervolume24Hourto: json["TOPTIERVOLUME24HOURTO"],
        change24Hour: json["CHANGE24HOUR"],
        changepct24Hour: json["CHANGEPCT24HOUR"],
        changeday: json["CHANGEDAY"],
        changepctday: json["CHANGEPCTDAY"],
        changehour: json["CHANGEHOUR"],
        changepcthour: json["CHANGEPCTHOUR"],
        conversiontype: json["CONVERSIONTYPE"],
        conversionsymbol: json["CONVERSIONSYMBOL"],
        supply: json["SUPPLY"],
        mktcap: json["MKTCAP"],
        mktcappenalty: json["MKTCAPPENALTY"],
        circulatingsupply: json["CIRCULATINGSUPPLY"],
        circulatingsupplymktcap: json["CIRCULATINGSUPPLYMKTCAP"],
        totalvolume24H: json["TOTALVOLUME24H"],
        totalvolume24Hto: json["TOTALVOLUME24HTO"],
        totaltoptiervolume24H: json["TOTALTOPTIERVOLUME24H"],
        totaltoptiervolume24Hto: json["TOTALTOPTIERVOLUME24HTO"],
        imageurl: json["IMAGEURL"],
      );

  Map<String, dynamic> toJson() => {
        "FROMSYMBOL": fromsymbol,
        "TOSYMBOL": tosymbol,
        "MARKET": market,
        "PRICE": price,
        "LASTUPDATE": lastupdate,
        "LASTVOLUME": lastvolume,
        "LASTVOLUMETO": lastvolumeto,
        "LASTTRADEID": lasttradeid,
        "VOLUMEDAY": volumeday,
        "VOLUMEDAYTO": volumedayto,
        "VOLUME24HOUR": volume24Hour,
        "VOLUME24HOURTO": volume24Hourto,
        "OPENDAY": openday,
        "HIGHDAY": highday,
        "LOWDAY": lowday,
        "OPEN24HOUR": open24Hour,
        "HIGH24HOUR": high24Hour,
        "LOW24HOUR": low24Hour,
        "LASTMARKET": lastmarket,
        "VOLUMEHOUR": volumehour,
        "VOLUMEHOURTO": volumehourto,
        "OPENHOUR": openhour,
        "HIGHHOUR": highhour,
        "LOWHOUR": lowhour,
        "TOPTIERVOLUME24HOUR": toptiervolume24Hour,
        "TOPTIERVOLUME24HOURTO": toptiervolume24Hourto,
        "CHANGE24HOUR": change24Hour,
        "CHANGEPCT24HOUR": changepct24Hour,
        "CHANGEDAY": changeday,
        "CHANGEPCTDAY": changepctday,
        "CHANGEHOUR": changehour,
        "CHANGEPCTHOUR": changepcthour,
        "CONVERSIONTYPE": conversiontype,
        "CONVERSIONSYMBOL": conversionsymbol,
        "SUPPLY": supply,
        "MKTCAP": mktcap,
        "MKTCAPPENALTY": mktcappenalty,
        "CIRCULATINGSUPPLY": circulatingsupply,
        "CIRCULATINGSUPPLYMKTCAP": circulatingsupplymktcap,
        "TOTALVOLUME24H": totalvolume24H,
        "TOTALVOLUME24HTO": totalvolume24Hto,
        "TOTALTOPTIERVOLUME24H": totaltoptiervolume24H,
        "TOTALTOPTIERVOLUME24HTO": totaltoptiervolume24Hto,
        "IMAGEURL": imageurl,
      };
}

class Raw {
  Raw({
    required this.usd,
  });

  RawUsd usd;

  factory Raw.fromRawJson(String str) => Raw.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Raw.fromJson(Map<String, dynamic> json) => Raw(
        usd: RawUsd.fromJson(json["USD"]),
      );

  Map<String, dynamic> toJson() => {
        "USD": usd.toJson(),
      };
}

class RawUsd {
  RawUsd({
    required this.type,
    required this.market,
    required this.fromsymbol,
    required this.tosymbol,
    required this.flags,
    required this.price,
    required this.lastupdate,
    required this.median,
    required this.lastvolume,
    required this.lastvolumeto,
    required this.lasttradeid,
    required this.volumeday,
    required this.volumedayto,
    required this.volume24Hour,
    required this.volume24Hourto,
    required this.openday,
    required this.highday,
    required this.lowday,
    required this.open24Hour,
    required this.high24Hour,
    required this.low24Hour,
    required this.lastmarket,
    required this.volumehour,
    required this.volumehourto,
    required this.openhour,
    required this.highhour,
    required this.lowhour,
    required this.toptiervolume24Hour,
    required this.toptiervolume24Hourto,
    required this.change24Hour,
    required this.changepct24Hour,
    required this.changeday,
    required this.changepctday,
    required this.changehour,
    required this.changepcthour,
    required this.conversiontype,
    required this.conversionsymbol,
    required this.supply,
    required this.mktcap,
    required this.mktcappenalty,
    required this.circulatingsupply,
    required this.circulatingsupplymktcap,
    required this.totalvolume24H,
    required this.totalvolume24Hto,
    required this.totaltoptiervolume24H,
    required this.totaltoptiervolume24Hto,
    required this.imageurl,
  });

  String type;
  String market;
  String fromsymbol;
  String tosymbol;
  String flags;
  double price;
  int lastupdate;
  double median;
  double lastvolume;
  double lastvolumeto;
  String lasttradeid;
  double volumeday;
  double volumedayto;
  double volume24Hour;
  double volume24Hourto;
  double openday;
  double highday;
  double lowday;
  double open24Hour;
  double high24Hour;
  double low24Hour;
  String lastmarket;
  double volumehour;
  double volumehourto;
  double openhour;
  double highhour;
  double lowhour;
  double toptiervolume24Hour;
  double toptiervolume24Hourto;
  double change24Hour;
  double changepct24Hour;
  double changeday;
  double changepctday;
  double changehour;
  double changepcthour;
  String conversiontype;
  String conversionsymbol;
  var supply;
  double mktcap;
  var mktcappenalty;
  var circulatingsupply;
  double circulatingsupplymktcap;
  double totalvolume24H;
  double totalvolume24Hto;
  double totaltoptiervolume24H;
  double totaltoptiervolume24Hto;
  String imageurl;

  factory RawUsd.fromRawJson(String str) => RawUsd.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RawUsd.fromJson(Map<String, dynamic> json) => RawUsd(
        type: json["TYPE"],
        market: json["MARKET"],
        fromsymbol: json["FROMSYMBOL"],
        tosymbol: json["TOSYMBOL"],
        flags: json["FLAGS"],
        price: json["PRICE"].toDouble(),
        lastupdate: json["LASTUPDATE"],
        median: json["MEDIAN"].toDouble(),
        lastvolume: json["LASTVOLUME"].toDouble(),
        lastvolumeto: json["LASTVOLUMETO"].toDouble(),
        lasttradeid: json["LASTTRADEID"],
        volumeday: json["VOLUMEDAY"].toDouble(),
        volumedayto: json["VOLUMEDAYTO"].toDouble(),
        volume24Hour: json["VOLUME24HOUR"].toDouble(),
        volume24Hourto: json["VOLUME24HOURTO"].toDouble(),
        openday: json["OPENDAY"].toDouble(),
        highday: json["HIGHDAY"].toDouble(),
        lowday: json["LOWDAY"].toDouble(),
        open24Hour: json["OPEN24HOUR"].toDouble(),
        high24Hour: json["HIGH24HOUR"].toDouble(),
        low24Hour: json["LOW24HOUR"].toDouble(),
        lastmarket: json["LASTMARKET"],
        volumehour: json["VOLUMEHOUR"].toDouble(),
        volumehourto: json["VOLUMEHOURTO"].toDouble(),
        openhour: json["OPENHOUR"].toDouble(),
        highhour: json["HIGHHOUR"].toDouble(),
        lowhour: json["LOWHOUR"].toDouble(),
        toptiervolume24Hour: json["TOPTIERVOLUME24HOUR"].toDouble(),
        toptiervolume24Hourto: json["TOPTIERVOLUME24HOURTO"].toDouble(),
        change24Hour: json["CHANGE24HOUR"].toDouble(),
        changepct24Hour: json["CHANGEPCT24HOUR"].toDouble(),
        changeday: json["CHANGEDAY"].toDouble(),
        changepctday: json["CHANGEPCTDAY"].toDouble(),
        changehour: json["CHANGEHOUR"].toDouble(),
        changepcthour: json["CHANGEPCTHOUR"].toDouble(),
        conversiontype: json["CONVERSIONTYPE"],
        conversionsymbol: json["CONVERSIONSYMBOL"],
        supply: json["SUPPLY"],
        mktcap: json["MKTCAP"].toDouble(),
        mktcappenalty: json["MKTCAPPENALTY"],
        circulatingsupply: json["CIRCULATINGSUPPLY"],
        circulatingsupplymktcap: json["CIRCULATINGSUPPLYMKTCAP"].toDouble(),
        totalvolume24H: json["TOTALVOLUME24H"].toDouble(),
        totalvolume24Hto: json["TOTALVOLUME24HTO"].toDouble(),
        totaltoptiervolume24H: json["TOTALTOPTIERVOLUME24H"].toDouble(),
        totaltoptiervolume24Hto: json["TOTALTOPTIERVOLUME24HTO"].toDouble(),
        imageurl: json["IMAGEURL"],
      );

  Map<String, dynamic> toJson() => {
        "TYPE": type,
        "MARKET": market,
        "FROMSYMBOL": fromsymbol,
        "TOSYMBOL": tosymbol,
        "FLAGS": flags,
        "PRICE": price,
        "LASTUPDATE": lastupdate,
        "MEDIAN": median,
        "LASTVOLUME": lastvolume,
        "LASTVOLUMETO": lastvolumeto,
        "LASTTRADEID": lasttradeid,
        "VOLUMEDAY": volumeday,
        "VOLUMEDAYTO": volumedayto,
        "VOLUME24HOUR": volume24Hour,
        "VOLUME24HOURTO": volume24Hourto,
        "OPENDAY": openday,
        "HIGHDAY": highday,
        "LOWDAY": lowday,
        "OPEN24HOUR": open24Hour,
        "HIGH24HOUR": high24Hour,
        "LOW24HOUR": low24Hour,
        "LASTMARKET": lastmarket,
        "VOLUMEHOUR": volumehour,
        "VOLUMEHOURTO": volumehourto,
        "OPENHOUR": openhour,
        "HIGHHOUR": highhour,
        "LOWHOUR": lowhour,
        "TOPTIERVOLUME24HOUR": toptiervolume24Hour,
        "TOPTIERVOLUME24HOURTO": toptiervolume24Hourto,
        "CHANGE24HOUR": change24Hour,
        "CHANGEPCT24HOUR": changepct24Hour,
        "CHANGEDAY": changeday,
        "CHANGEPCTDAY": changepctday,
        "CHANGEHOUR": changehour,
        "CHANGEPCTHOUR": changepcthour,
        "CONVERSIONTYPE": conversiontype,
        "CONVERSIONSYMBOL": conversionsymbol,
        "SUPPLY": supply,
        "MKTCAP": mktcap,
        "MKTCAPPENALTY": mktcappenalty,
        "CIRCULATINGSUPPLY": circulatingsupply,
        "CIRCULATINGSUPPLYMKTCAP": circulatingsupplymktcap,
        "TOTALVOLUME24H": totalvolume24H,
        "TOTALVOLUME24HTO": totalvolume24Hto,
        "TOTALTOPTIERVOLUME24H": totaltoptiervolume24H,
        "TOTALTOPTIERVOLUME24HTO": totaltoptiervolume24Hto,
        "IMAGEURL": imageurl,
      };
}

class MetaData {
  MetaData({
    required this.count,
  });

  int count;

  factory MetaData.fromRawJson(String str) =>
      MetaData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        count: json["Count"],
      );

  Map<String, dynamic> toJson() => {
        "Count": count,
      };
}

class RateLimit {
  RateLimit();

  factory RateLimit.fromRawJson(String str) =>
      RateLimit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RateLimit.fromJson(Map<String, dynamic> json) => RateLimit();

  Map<String, dynamic> toJson() => {};
}

class SponsoredDatum {
  SponsoredDatum({
    required this.coinInfo,
  });

  CoinInfo coinInfo;

  factory SponsoredDatum.fromRawJson(String str) =>
      SponsoredDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SponsoredDatum.fromJson(Map<String, dynamic> json) => SponsoredDatum(
        coinInfo: CoinInfo.fromJson(json["CoinInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "CoinInfo": coinInfo.toJson(),
      };
}

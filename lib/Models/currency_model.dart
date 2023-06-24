// To parse this JSON data, do
//
//     final currency = currencyFromJson(jsonString);

import 'dart:convert';

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));

String currencyToJson(Currency data) => json.encode(data.toJson());

class Currency {
    Motd motd;
    bool success;
    Map<String, Symbol> symbols;

    Currency({
        required this.motd,
        required this.success,
        required this.symbols,
    });

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        motd: Motd.fromJson(json["motd"]),
        success: json["success"],
        symbols: Map.from(json["symbols"]).map((k, v) => MapEntry<String, Symbol>(k, Symbol.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "motd": motd.toJson(),
        "success": success,
        "symbols": Map.from(symbols).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class Motd {
    String msg;
    String url;

    Motd({
        required this.msg,
        required this.url,
    });

    factory Motd.fromJson(Map<String, dynamic> json) => Motd(
        msg: json["msg"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "url": url,
    };
}

class Symbol {
    String description;
    String code;

    Symbol({
        required this.description,
        required this.code,
    });

    factory Symbol.fromJson(Map<String, dynamic> json) => Symbol(
        description: json["description"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "code": code,
    };
}

import 'Sources.dart';

class SourcesResponse {
  SourcesResponse({
      this.code, 
      this.message, 
      this.status, 
      this.sources,});

  SourcesResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    status = json['status'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }
  String? code;
  String? message;
  String? status;
  List<Source>? sources;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
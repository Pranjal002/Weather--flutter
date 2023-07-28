import 'dart:convert';

extension MapDynamicExt on Map<String, dynamic> {
  String toPrettyJson() {
    return "\n${"=" * 100}\n|| Pretty Map ||:\n${"-" * 100}\n${const JsonEncoder.withIndent("\t").convert(this)}\n${"-" * 100}\n";
  }
}

extension ListDynamicExt on List<dynamic> {
  String toPrettyJson() {
    return "\n${"=" * 100}\n|| Pretty List ||:\n${"-" * 100}\n${const JsonEncoder.withIndent("\t").convert(this)}\n${"-" * 100}\n";
  }
}
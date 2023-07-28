
import 'dart:convert';

extension StringExt on String {
  String format(List<dynamic> args) {
    String result = this;
    for (int i = 0; i < args.length; i++) {
      result = result.replaceAllMapped(
        RegExp(r'\{' + i.toString() + r'\}'),
            (match) => args[i].toString(),
      );
    }
    return result;
  }

/*String toLocaleDigits() {
    final numbers = RegExp(r'\d+');
    return input.replaceAllMapped(numbers, (match) {
      final nepaliNumber = NepaliUnicode.convert(match.group(0)!);
      return nepaliNumber;
    });
  }*/

  String toPrettyJson() {
    return "\n${"=" * 100}\n|| PrettyJson ||:\n${"-" * 100}\n${const JsonEncoder.withIndent("\t").convert(this)}\n${"-" * 100}\n";
  }

}

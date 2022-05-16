import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart main.dart <inputfile.csv>');
    exit(1);
  }
  var filename = arguments.first;
  print(filename);
  var lines = File(filename).readAsLinesSync();
  // print(lines);
  lines.removeAt(0);
  // print(lines);

  var totalDurationByTag = <String, dynamic>{};
  var totalDuration = 0.0;

  for (var line in lines) {
    // print(line);
    var values = line.split(',');
    // print(values);
    var durationStr = values[3].replaceAll('"', '');
    // print(durationStr);
    var duration = double.parse(durationStr);
    var tag = values[5].replaceAll('"', '');
    // print(tag);
    var previousTotal = totalDurationByTag[tag];
    if (previousTotal == null) {
      totalDurationByTag[tag] = duration;
    } else {
      totalDurationByTag[tag] = previousTotal + duration;
    }
    totalDuration += duration;
  }
  print(totalDurationByTag);
  print('total time = $totalDuration');
  for (var entry in totalDurationByTag.entries) {
    // print(entry.key);
    // print(entry.value);
    print('${entry.key} : ${entry.value.toStringAsFixed(1)}h');
  }
}

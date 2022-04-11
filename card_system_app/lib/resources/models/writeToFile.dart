import 'dart:io';

void userCredWriteToFile() async {
  const filename = 'userCred.json';
  var file = await File(filename).writeAsString('some content');
  // Do something with the file.
}
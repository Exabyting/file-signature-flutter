# file_signature

File Signature Matcher written in Dart ~

## About

`file_signature` is a Flutter package that can match specific file extension from a file's byte stream.
```dart
final fileSignatureMatcher = FileSignatureMatcher();
final List<FileExtension>? matchedExtensions = fileSignatureMatcher.getFileExtension(_fileAsUint8List);
```


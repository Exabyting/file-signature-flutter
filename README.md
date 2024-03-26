# File Type Matcher

File Signature Matcher written in Dart can be used to determine file type from its byte array.
It's useful when you cannot rely on the file extension to determine the file type.


## About

`file_signature` is a Flutter package that can match specific file extension from a file's byte stream.

![example](https://i.postimg.cc/DzsKKdqf/example.gif)

### Sample Code

```dart
  final uri = Uri.parse($_YOUR_URL);
  late http.Response response;
  try {
    response = await http.get(uri);
  } catch (e) {
    // TODO: Handle Exceptions
  } finally {
    final bytes = response.bodyBytes;
    final matcher = FileSignatureMatcher();
    final List<FileExtension>? matchedExtensions = matcher.getFileExtension(headerBytes: bytes);
    // Some file formats shares the same extensions, such as doc and docx
    debugPrint('Matched extensions: ${matchedExtensions.toString()}')
  }   
```
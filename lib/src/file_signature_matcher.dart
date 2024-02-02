import 'package:file_signature/src/file_signature.dart';

abstract class IFileSignatureMatcher{
  List<FileExtension>? getFileExtension({required List<int> headerBytes});
}

class FileSignatureMatcher implements IFileSignatureMatcher {
  final List<FileSignature> fileSignatureList = [
    FileSignature(
      hexSignature: [0x25, 0x50, 0x44, 0x46, 0x2D],
      extension: [FileExtension.pdf],
    ),
    FileSignature(
      hexSignature: [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A],
      extension: [FileExtension.png],
    ),
    FileSignature(
      hexSignature: [0xFF, 0xD8, 0xFF, 0xE0],
      extension: [FileExtension.jpg],
    ),

    /// jpg and jpeg has 4 different signatures but
    /// among them the first 3 bytes are common
    /// todo: to be checked if this creates any confidence issue
    FileSignature(
      hexSignature: [0xFF, 0xD8, 0xFF, 0xDB],
      extension: [FileExtension.jpg, FileExtension.jpeg],
    ),
  ];
  @override
  List<FileExtension>? getFileExtension({required List<int> headerBytes}) {
    final matchedExtensions = <FileExtension>[];
    for (var signature in fileSignatureList){
      if(signature.hasMatch(headerBytes: headerBytes)){
        matchedExtensions.addAll(signature.extension);
      }
    }
    return matchedExtensions.isEmpty ? null : matchedExtensions.toSet().toList();
  }

}
import 'file_signature.dart';

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
    FileSignature(
      hexSignature: [0x66, 0x74, 0x79, 0x70, 0x33, 0x67],
      extension: [
        FileExtension.$3gp,
        FileExtension.$3g2,
      ],
    ),
    FileSignature(
        hexSignature: [0x37, 0x7A, 0xBC, 0xAF, 0x27, 0x1C],
        extension: [FileExtension.$7z],
    ),
    FileSignature(
      hexSignature: [
        0x30, 0x26, 0xB2, 0x75, 0x8E, 0x66, 0xCF, 0x11
        , 0xA6, 0xD9, 0x00, 0xAA, 0x00, 0x62, 0xCE, 0x6C],
      extension: [
        FileExtension.asf,
        FileExtension.wma,
        FileExtension.wmv,
    ],),
    FileSignature(
      hexSignature: [0x52, 0x49, 0x46, 0x46],
      extension: [FileExtension.avi],
    ),
    FileSignature(
      hexSignature: [0x53, 0x50, 0x30, 0x31],
      extension: [FileExtension.bin],
    ),
    FileSignature(hexSignature: [
      0x42,
      0x4D
    ], extension: [
      FileExtension.bmp,
      FileExtension.dib,
    ]),
    FileSignature(
      hexSignature: [0x6B, 0x6F, 0x6C, 0x79],
      extension: [FileExtension.dmg],
    ),
    FileSignature(
      hexSignature: [0x0D, 0x44, 0x4F, 0x43],
      extension: [FileExtension.doc],
    ),
    FileSignature(
      hexSignature: [0xD0, 0xCF, 0x11, 0xE0, 0xA1, 0xB1, 0x1A, 0xE1],
      extension: [
        FileExtension.doc,
        FileExtension.xls,
        FileExtension.ppt,
        FileExtension.msi,
        FileExtension.msg,
      ],
    ),
    FileSignature(
      hexSignature: [0x5A, 0x4D],
      extension: [FileExtension.exe],
    ),
    FileSignature(
      hexSignature: [0x46, 0x4C, 0x56],
      extension: [
        FileExtension.flv,
      ],
    ),
    FileSignature(
      hexSignature: [0x47, 0x49, 0x46, 0x38, 0x37, 0x61],
      extension: [FileExtension.gif],
    ),
    FileSignature(
      hexSignature: [0x47, 0x49, 0x46, 0x38, 0x39, 0x61],
      extension: [FileExtension.gif],
    ),
    FileSignature(
      hexSignature: [0x66, 0x74, 0x79, 0x70, 0x68, 0x65, 0x69, 0x6],
      extension: [FileExtension.heic],
    ),

    FileSignature(
      hexSignature: [0x66, 0x74, 0x79, 0x70, 0x6d],
      extension: [FileExtension.heic],
    ),

    FileSignature(
      hexSignature: [0xFF, 0xFB],
      extension: [FileExtension.mp3],
    ),
    FileSignature(
      hexSignature: [0xFF, 0xF3],
      extension: [FileExtension.mp3],
    ),
    FileSignature(
      hexSignature: [0xFF, 0xF2],
      extension: [FileExtension.mp3],
    ),
    FileSignature(
      hexSignature: [0x49, 0x44, 0x33],
      extension: [FileExtension.mp3],
    ),
    FileSignature(
      hexSignature: [0x66, 0x74, 0x79, 0x70, 0x69, 0x73, 0x6F, 0x6D],
      extension: [FileExtension.mp4],
    ),
    FileSignature(
      hexSignature: [0x66, 0x74, 0x79, 0x70, 0x4D, 0x53, 0x4E, 0x56],
      extension: [FileExtension.mp4],
    ),
    FileSignature(
      hexSignature: [0x00, 0x00, 0x01, 0xB3],
      extension: [FileExtension.mpg, FileExtension.mpeg],
    ),
    FileSignature(
      hexSignature: [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A],
      extension: [FileExtension.png],
    ),

    FileSignature(
      hexSignature: [0x47],
      extension: [
        FileExtension.ts,
        FileExtension.tsv,
        FileExtension.tsa,
        FileExtension.mpg,
        FileExtension.mpeg
      ],
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
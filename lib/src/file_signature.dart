enum FileExtension{
  pdf,
  png,
  tar_gz,
  jpg,
  jpeg
}

class FileSignature {
  final List<int> hexSignature;
  final List<FileExtension> extension;

  FileSignature({
    required this.hexSignature,
    required this.extension,
  });

  bool hasMatch({required List<int> headerBytes}) {
    assert(headerBytes.length >= 12, "At least 12 Bytes are needed to match");
    if (hexSignature.length < headerBytes.length) return false;

    for (var i = 0; i < headerBytes.length; i++) {
      if (headerBytes[i] != hexSignature[i]) return false;
    }

    return true;
  }
}

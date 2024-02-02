enum FileExtension{
  pdf,
  png,
  tar_gz,
  jpg,
  jpeg,
  $3gp,
  $3g2,
  $7z,
  asf,
  wma,
  wmv,
  avi,
  bin,
  dmg,
  doc,
  xls,
  ppt,
  msi,
  msg,
  exe,
  jp2,
  j2k,
  jpf,
  jpm,
  jpg2,
  j2c,
  jpc,
  jpx,
  mj2,
  mp3,
  mp4,
  mpeg,
  webp,
  bmp,
  dib,
  flv,
  gif,
  heic,
  mpg,
  tsv,
  tsa,
  ts,
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

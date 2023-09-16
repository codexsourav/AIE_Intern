class UploadFile {
  Map<String, dynamic>? formData;
  String filepath;
  String serverPath;
  String apiuri;
  UploadFile(
      {required this.filepath,
      required this.serverPath,
      this.formData,
      required this.apiuri});
}

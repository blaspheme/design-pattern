abstract class File {
  late String name;

  String getName() => name;

  void setName(name) => this.name = name;

  void showFileName();
}

class Folder extends File {
  List<File> fileList = <File>[];

  Folder(String name) {
    super.name = name;
  }

  @override
  void showFileName() => print(name);

  addFile(File file) => fileList.add(file);

  displayFiles() {
    for (var file in fileList) {
      file.showFileName();
    }
  }
}

class TxtFile extends File {
  TxtFile(String name) {
    super.name = name;
  }

  @override
  void showFileName() => print(name);
}

import 'dart:io';
import 'package:mastra_music/import.dart';
import 'package:path/path.dart' as path;

class FilesController extends GetxController {
  final audioFiles = [].obs;
  final audioLength = [].obs;
  RxInt playerIndex = 999.obs;

  Future<void> getFiles(filePath) async {
    Utils.permissionRequest().then((value) async {
      // check permission and if is granted the clear and add
      if (value == true) {
        audioFiles.clear();
        audioLength.clear();
        Directory directory = Directory(filePath);
// list of files
        List<FileSystemEntity> files = await directory.list().toList();
// fetch files based on their filetype
        var temp = files
            .where((file) => (file.path.endsWith('.mp3') ||
                (file.path.endsWith('.wav')) ||
                (file.path.endsWith('.mp2')) ||
                (file.path.endsWith('.amr')) ||
                (file.path.endsWith('.aac'))))
            .toList();

        for (int i = 0; i < temp.length; i++) {
          String name = path.basename(temp[i].path);
          name = name.substring(0, name.indexOf('.'));
          if (name.length > 20) {
            name.substring(0, 19);
          }
// adding files content to file model.........
          Utils.getFilesLength(temp[i].path);
          audioFiles.add(AudioFiles(
                  name: name,
                  path: temp[i].path,
                  size: File(temp[i].path).lengthSync())
              .toString());
        }
      } else {
        Utils.permissionRequest();
      }
    }).onError((error, stackTrace) => null);
  }

  Future<void> addToAlbum(String PathFile, String filename) async {
    if (File(PathFile).existsSync()) {}
    var dir = await getApplicationDocumentsDirectory();
    File(PathFile).copySync('${dir.path}/$filename.mp3');

    if (File('${dir.path}/$filename').existsSync()) {
    } else {}
  }
}

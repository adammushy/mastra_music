

import 'package:just_audio/just_audio.dart';
import 'package:mastra_music/import.dart';
// import 'package:path/path.dart' as path;

class Utils {
  static final controller = Get.put(FilesController());

  static Future<bool> permissionRequest() async {
    var status = await Permission.storage.status;

    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.location,
      ].request();

      var temp = await Permission.storage.status;

      if (temp.isGranted) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  static getFilesLength(String filePath) async {
    final player = AudioPlayer();

    await player.setFilePath(filePath).then((value) {
      String prefix = player.duration!.inMinutes.toString();
      String postfix = player.duration!.inSeconds.toString();
      if (prefix.length < 2) {
        prefix = '0$prefix';
      }
      if (postfix.length < 2) {
        postfix = '0$postfix';
      }
      controller.audioLength.add('$prefix : $postfix');
    });
    player.dispose();
  }
}

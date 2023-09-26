import 'package:mastra_music/import.dart';
import 'package:path/path.dart' as path;

class BottomPlayerController extends GetxController {
  RxBool isPlaying = false.obs;
  RxDouble angle = 0.0.obs;
  RxDouble progress = 0.0.obs;
  RxString totalLength = ''.obs;
  RxString currentLength = '0:0'.obs;
  RxString filePath = ''.obs;
  RxString fileName = ''.obs;
  final player = AudioPlayer();

  setFilePath(String filePath1) {
    player.setFilePath(filePath1).then((value) {
      // Set total length of the audio
      totalLength.value =
          '${player.duration!.inMinutes.toString()}:${player.duration!.inSeconds.toString()}';

      // Set file path, file name, and truncated file name

      filePath.value = filePath1;
      var temp = path.basename(filePath1);
      temp = temp.substring(0, temp.indexOf('.'));
      if (temp.length > 20) {
        temp = temp.substring(0, 20);
      }

      fileName.value = temp;
    });
  }

  playSong() async {
    isPlaying.value = true;
    player.play().then((value) async {});
  }

  // Toggle between play and pause
  setPlay() {
    if (isPlaying.value) {
      pauseSong();
    } else {
      playSong();
    }
  }

  pauseSong() async {
    player.stop();
    isPlaying.value = false;
  }

  // Set the progress of the audio playback
  setProgress() {
    if (player.playerState.playing) {
      progress.value = player.position.inSeconds / player.duration!.inSeconds;
      currentLength.value =
          '${player.duration!.inMinutes.toString()}:${player.duration!.inSeconds.toString()}';
      if (currentLength == totalLength) {
        player.stop();
        isPlaying.value = false;
      }
    }
  }
}

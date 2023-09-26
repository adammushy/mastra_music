import 'package:mastra_music/import.dart';

class ListViewFiles extends StatelessWidget {
  ListViewFiles({super.key});

  final controller = Get.put(FilesController());
  final bottomController = Get.put(BottomPlayerController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.audioFiles.isEmpty
        ? Expanded(child: Center())
        : Expanded(child: AnimatedFileList()));
  }
}

class AnimatedFileList extends StatefulWidget {
  const AnimatedFileList({super.key});

  @override
  State<AnimatedFileList> createState() => _AnimatedFileListState();
}

class _AnimatedFileListState extends State<AnimatedFileList> {
  final controller = Get.put(FilesController());
  final bottomController = Get.put(BottomPlayerController());
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

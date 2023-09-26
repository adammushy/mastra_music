import 'package:mastra_music/import.dart';

class AudioList extends StatefulWidget {
  final String path;

  const AudioList({super.key, this.path = AppPaths.musicPath});

  @override
  State<AudioList> createState() => _AudioListState();
}

class _AudioListState extends State<AudioList> {
  final _controller = Get.put(FilesController());
  // final bottomController = Get.put(Bot);
  @override
  void initState() {
    super.initState();
    _controller.getFiles(widget.path);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      Stack(
        children: [
          Positioned.fill(child: Column(
            children: [
              // const customAppBar()
              
            ],
          ))
        ],
      )),
    );
  }
}

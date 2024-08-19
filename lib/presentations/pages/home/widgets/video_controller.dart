import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoController {
  YoutubePlayerController? _activeController;

  void onPlay(YoutubePlayerController playerController) {
    if (_activeController != null && _activeController != playerController) {
      _activeController!.pause();
    }
    _activeController = playerController;
  }
}

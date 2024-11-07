import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class Navermapcontroller with ChangeNotifier {
  late NaverMapController _controller;
  final List<NMarker> _markers = [];

  NaverMapController get controller => _controller;

  void setController(NaverMapController controller) {
    _controller = controller;
    notifyListeners();
  }

  void addMarker(NMarker marker) {
    _markers.add(marker);
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeStateProvider =
    StateNotifierProvider.autoDispose<HomeStateNotifier, int>(
  (ref) => HomeStateNotifier(),
);

class HomeStateNotifier extends StateNotifier<int> {
  HomeStateNotifier() : super(0) {
    _pageController = PageController();
  }

  late final PageController _pageController;

  PageController get pageController => _pageController;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onNavigationTap(int index) {
    state = index;
    _pageController.jumpToPage(index);
  }
}

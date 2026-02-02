import 'package:flutter/material.dart';

/// Onboarding state provider
class OnboardingProvider extends ChangeNotifier {
  int _currentPage = 0;
  bool _isCompleted = false;

  int get currentPage => _currentPage;
  bool get isCompleted => _isCompleted;
  bool get isLastPage => _currentPage == 2;
  bool get isFirstPage => _currentPage == 0;

  void setPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < 2) {
      _currentPage++;
      notifyListeners();
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _currentPage--;
      notifyListeners();
    }
  }

  void completeOnboarding() {
    _isCompleted = true;
    notifyListeners();
  }

  void reset() {
    _currentPage = 0;
    _isCompleted = false;
    notifyListeners();
  }
}

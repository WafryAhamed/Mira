import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../constants/app_constants.dart';

/// Authentication state provider for Mira Banking App
/// Handles login, register, OTP verification, and email verification
class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isLoggedIn = false;
  User? _currentUser;
  String? _errorMessage;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  // Getters
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  User? get currentUser => _currentUser;
  String? get errorMessage => _errorMessage;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  // Toggle password visibility
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  // Clear error
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  // Mock Login
  Future<bool> login({
    required String emailOrAccount,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Mock validation
      if ((emailOrAccount == MockData.demoEmail ||
              emailOrAccount == MockData.demoAccountNumber) &&
          password == MockData.demoPassword) {
        _currentUser = User.demoUser;
        _isLoggedIn = true;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Invalid email/account number or password';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Mock Register
  Future<bool> register({
    required String fullName,
    required String email,
    required String phone,
    required String nic,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // Create new user (mock)
      _currentUser = User(
        id: 'user-${DateTime.now().millisecondsSinceEpoch}',
        fullName: fullName,
        email: email,
        phone: phone,
        nic: nic,
        isEmailVerified: false,
        createdAt: DateTime.now(),
      );

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Registration failed. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Mock OTP Verification
  Future<bool> verifyOtp(String otp) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Mock validation
      if (otp == MockData.demoOtp || otp.length == AppConstants.otpLength) {
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Invalid OTP. Please try again.';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'OTP verification failed. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Mock Email Verification
  Future<bool> verifyEmail() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      if (_currentUser != null) {
        _currentUser = _currentUser!.copyWith(isEmailVerified: true);
      }

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Email verification failed. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Mock Resend OTP
  Future<bool> resendOtp() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Failed to resend OTP. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Logout
  void logout() {
    _currentUser = null;
    _isLoggedIn = false;
    _isPasswordVisible = false;
    _isConfirmPasswordVisible = false;
    _errorMessage = null;
    notifyListeners();
  }

  // Reset state
  void reset() {
    _isLoading = false;
    _isLoggedIn = false;
    _currentUser = null;
    _errorMessage = null;
    _isPasswordVisible = false;
    _isConfirmPasswordVisible = false;
    notifyListeners();
  }
}

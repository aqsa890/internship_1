class AppConstants {
  static const String appName = 'Task Management App';

  // Shared Preferences Keys
  static const String taskListKey = 'taskList';
  static const String isLoggedInKey = 'isLoggedIn';
  static const String userEmailKey = 'userEmail';

  // Validation Messages
  static const String emailRequired = 'Email is required';
  static const String invalidEmail = 'Please enter a valid email';
  static const String passwordRequired = 'Password is required';
  static const String passwordTooShort =
      'Password must be at least 6 characters';

  // Route Names
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String addTaskRoute = '/add-task';
}

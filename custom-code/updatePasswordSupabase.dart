import '/auth/supabase_auth/auth_util.dart';

Future<bool> updatePasswordSupabase(
  String newPassword,
  String confirmPassword,
) async {
  try {
    // Validate the new password and confirm password.
    if ((newPassword.isEmpty || confirmPassword.isEmpty) ||
        (newPassword != confirmPassword)) {
      return false;
    }

    // Update the user's password.
    final UserResponse response = await SupaFlow.client.auth.updateUser(
      UserAttributes(
        password: newPassword.trim(),
      ),
    );

    return response.user != null;
  } catch (error) {
    print("Error: $error");
    return false;
  }
}
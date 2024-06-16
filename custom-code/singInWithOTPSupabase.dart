Future<bool> singInWithOTPSupabase(String email) async {
  try {
    if (email.isEmpty) {
      return false;
    }

    await SupaFlow.client.auth.signInWithOtp(
      email: email,
      shouldCreateUser: false,
    );
    return true;
  } catch (error) {
    print('Error: $error');
    return false;
  }
}
Future<bool> validateOTPCodeSupabase(String email, String token) async {
  try {
    if (email.isEmpty || token.isEmpty) {
      return false;
    }

    AuthResponse authResponse = await SupaFlow.client.auth.verifyOTP(
      token: token,
      type: OtpType.email,
      email: email,
    );

    return authResponse.user != null;
  } catch (error) {
    print('Error: $error');
    return false;
  }
}
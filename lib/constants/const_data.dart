class ConstData {
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
  static const gcpWebClientId = String.fromEnvironment('GCP_WEB_CLIENT_ID');
  static const gcpAndroidClientId =
      String.fromEnvironment('GCP_ANDROID_CLIENT_ID');
}

class ApiConfig {
  const ApiConfig({
    required this.supabaseUrl,
    required this.supabaseAnonKey,
    required this.apiBaseUrl,
  });

  final String supabaseUrl;
  final String supabaseAnonKey;
  final String apiBaseUrl;

  bool get isConfigured =>
      supabaseUrl.isNotEmpty &&
      supabaseAnonKey.isNotEmpty &&
      apiBaseUrl.isNotEmpty;

  factory ApiConfig.fromEnvironment() {
    return ApiConfig(
      supabaseUrl: const String.fromEnvironment('SUPABASE_URL'),
      supabaseAnonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
      apiBaseUrl: const String.fromEnvironment('API_BASE_URL'),
    );
  }
}

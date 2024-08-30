abstract class ApiUrl {
  //http://api.nixler.xyz/v1/events/?city=Delhi&category=66b195fcf061bbc1c22731dd

  // Base Url
  static const String baseUrl = "http://api.nixler.xyz";

  //? Version
  static String version = "/v1/";

  static String getEvent = '$baseUrl${version}events/';
}

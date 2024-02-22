class ConnectionStrings {
  static String _hostname = "";
  static const int _port = 3001;

  static void setHostName(String hostname) {
    _hostname = hostname;
  }

  static String _resolveHostname() {
    return "http://$_hostname:$_port/";
  }

  static String getOpenWebApiUrl() {
    return "${_resolveHostname()}open/web";
  }

  static String getSetVolumeApiUrl() {
    return "${_resolveHostname()}set/volume";
  }

  static String getVideoControlApiUrl() {
    return "${_resolveHostname()}set/video";
  }

  static String getTypeApiUrl() {
    return "${_resolveHostname()}typing";
  }

  static String getMouseSetterApiUrl() {
    return "${_resolveHostname()}set/mouse";
  }
}

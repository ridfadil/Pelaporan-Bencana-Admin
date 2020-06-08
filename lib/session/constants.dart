///////////////////////// Untuk Constant ////////////////////
class APIResponseCode {
  static const int SUCCESS = 200;
  static const int UNAUTHORIZED = 401;
  static const int UNPROCCESS = 422;
}

class SharedPrefKeys {
  static const String IS_USER_LOGGED_IN = "IS_USER_LOGGED_IN";
  static const String APP_ID = "APP_ID";
  static const String TOKEN = "TOKEN";
  static const String ROLE = "ROLE";
  static const String DEVICE_ID = "DEVICE_ID";
  static const String USER = "USER";
  static const String NAME = "NAME";
  static const String EMAIL = "EMAIL";
  static const String USER_ID = "USER_ID";
  static const String STUDENT_ID = "STUDENT_ID";
  static const String FIREBASE_TOKEN = 'FIREBASE_TOKEN';
}

class FirebaseKeys {
  static const String FB_USER_NAMA = "nama";
  static const String FB_USER_NO_TELP = "telp";
  static const String FB_USER_ALAMAT = "alamat";
  static const String FB_USER_EMAIL = "email";
  static const String FB_USER_PASSWORD = "password";
  static const String FB_USER_ROLE = "role";


  static const String FB_REPORT_ID_USER = "id_user_pelapor";
  static const String FB_REPORT_DATE_KECELAKAAN = "date_kecelakaan";
  static const String FB_REPORT_TIME_KECELAKAAN = "time_kecelakaan";
  static const String FB_REPORT_JENIS_KECELAKAAN = "jenis_kecelakaan";
  static const String FB_REPORT_LOKASI_KECELAKAAN = "lokasi_kecelakaan";
  static const String FB_REPORT_URAIAN_KECELAKAAN = "uraian_kecelakaan";
  static const String FB_REPORT_FILE_KECELAKAAN = "file_kecelakaan";
}

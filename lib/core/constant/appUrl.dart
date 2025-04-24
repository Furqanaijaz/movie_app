class Appurl {
  static const baseUrl = "http://192.168.100.173:5000/";
  // static const register = "$baseUrl/api/v1/auth/signup";
  static const apiV = 'api/v1/';

  static const signup = '${apiV}auth/signup';
  static const signin = '${apiV}auth/signin';
  static const trendingMovies = '${apiV}movie/trending';
  static const nowPlayingMovies = '${apiV}movie/nowplaying';
  static const popularTV = '${apiV}tv/popular';
  static const movie = '${apiV}movie/';
  static const tv = '${apiV}tv/';
  static const search = '${apiV}search/';
  static const trailerBAse = 'https://www.youtube.com/watch?v=';

  // static const userProfile = "$baseUrl/profile";
  // static const login = "$baseUrl/login";
}

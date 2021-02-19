class AppStrings {
  const AppStrings();
  static const String newsArticleUrl = "https://newsapi.org/v2/";
  static const String flickrImages = "https://api.flickr.com/";
  static const String apiKey = "40f2058302f54861a17b235a850c49b3";

  static const String appName = "Los Presidentes Dominicanos";
  static const String email = "info@noelvillaman.com";
  static const String webpage = "www.presidentesdominicanos.com";
  static const String comparte = "Comparte";

  static const String getSourcesUrl = '$newsArticleUrl/sources';
  static const String getTopHeadlinesUrl = '$newsArticleUrl/top-headlines';
  static const String everythingUrl = "$newsArticleUrl/everything";
  static const String getImages = "$flickrImages/services/feeds/photos_public.gne?nojsoncallback=1&tagmode=any&format=json&tags=[INPUT]";
}
// * This is my Article Model Class constructed according to the the NYT API response
class ArticleModel {
  final int id;
  final String publishedDate;
  final String author;
  final String title;
  final String abstract;
  final String section;
  final String thumbnail;
  final String image;

  ArticleModel({
    required this.id,
    required this.publishedDate,
    required this.author,
    required this.title,
    required this.abstract,
    required this.section,
    required this.thumbnail,
    required this.image,
  });

  // * Factory method used to transform incoming article json data into an ArticleModel object while making sure all data is validated and not null
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    // * this is the validation of the thumbnail since it is nested in the API and not as easy to access and validate using a one-liner
    // * In this case, i've used an empty string in case the API value is invalid since i'm going to use a placeholder icon in case of an error via CachedNetworkImage
    // * Instead of an empty string, we could also use a designated placeholder image url instead of a placeholder icon
    String validThumbnail = "";
    String validImage = "";
    // * checking if media proprety is in json response and is a non empty list
    if (json['media'] != null &&
        json['media'] is List &&
        json['media'].isNotEmpty) {
      // * checking if json['media']'s first element is a Map
      if (json['media'][0] is Map) {
        // * checking if json['media']s first element has a media-metadata proprety that's a non empty list
        if (json['media'][0]['media-metadata'] != null &&
            json['media'][0]['media-metadata'] is List &&
            json['media'][0]['media-metadata'].isNotEmpty) {
          // * checking if the first element of the latter is Map
          if (json['media'][0]['media-metadata'][0] is Map) {
            var refFirst = json['media'][0]['media-metadata'][0]['url'];
            // * checking if the url proprety in the first map is not null and is a string for use in thumbnail
            validThumbnail =
                refFirst != null && refFirst is String ? refFirst : "";
          }
          // * checking if the last element of the latter is Map
          if ((json['media'][0]['media-metadata'] as List).last is Map) {
            var refLast =
                (json['media'][0]['media-metadata'] as List).last['url'];
            // * checking if the url proprety in the last map is not null and is a string for use in thumbnail
            validImage = refLast != null && refLast is String ? refLast : "";
          }
        }
      }
    }

    // * checking if the elements in the map are not null and are the correct type
    return ArticleModel(
      id: json['id'] != null && json['id'] is int ? json['id'] : 0,
      publishedDate:
          json['published_date'] != null && json['published_date'] is String
              ? json['published_date']
              : "Unknown Date",
      author: json['byline'] != null && json['byline'] is String
          ? json['byline']
          : "Unknown Author",
      title: json['title'] != null && json['title'] is String
          ? json['title']
          : "Unknown Title",
      abstract: json['abstract'] != null && json['abstract'] is String
          ? json['abstract']
          : "This article has no abstract",
      section: json['section'] != null && json['section'] is String
          ? json['section']
          : "Unknown Section",
      thumbnail: validThumbnail,
      image: validImage,
    );
  }
}

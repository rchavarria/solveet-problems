import 'image_url_builder.dart';

/**
  * Represents a Marvel comic
  */
class Comic {
    var builder = new ImageUrlBuilder();
    String id;
    String title;
    String description;
    /* URL to an image of the comic */
    String thumbnailUrl;

    /**
      * Named constructor to make it easy to parse data from Marvel API
      */
    Comic.fromJson(Map json) {
        id = json['id'];
        title = json['title'];
        description = json['description'];
        thumbnailUrl = builder.fromMap(json['thumbnail']);
    }

}


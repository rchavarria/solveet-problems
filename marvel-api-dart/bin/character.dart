import 'image_url_builder.dart';

/**
  * Represents a Marvel character
  */
class Character {
    var builder = new ImageUrlBuilder();
    String id;
    String name;
    String description;
    /* URL to an image of the character */
    String thumbnailUrl;

    /**
      * Named constructor to make it easy to parse data from Marvel API
      */
    Character.fromJson(Map json) {
        id = json['id'];
        name = json['name'];
        description = json['description'];
        thumbnailUrl = builder.fromMap(json['thumbnail']);
    }

}


import 'image_url_builder.dart';

class Comic {
    var builder = new ImageUrlBuilder();
    String id;
    String title;
    String description;
    String thumbnailUrl;

    Comic.fromJson(Map json) {
        id = json['id'];
        title = json['title'];
        description = json['description'];
        thumbnailUrl = builder.fromMap(json['thumbnail']);
    }

}


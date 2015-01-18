import 'image_url_builder.dart';

class Character {
    var builder = new ImageUrlBuilder();
    String id;
    String name;
    String description;
    String thumbnailUrl;

    Character.fromJson(Map json) {
        id = json['id'];
        name = json['name'];
        description = json['description'];
        thumbnailUrl = builder.fromMap(json['thumbnail']);
    }

}


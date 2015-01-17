class Comic {
    String id;
    String title;
    String description;
    String thumbnailUrl;

    Comic.fromJson(Map json) {
        id = json['id'];
        title = json['title'];
        description = json['description'];
        thumbnailUrl = json['thumbnail']['path'];
    }

}


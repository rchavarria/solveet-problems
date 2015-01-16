class Comic {
    String title;
    String description;
    String thumbnailUrl;

    Comic.fromJson(Map json) {
        title = json['title'];
        description = json['description'];
        thumbnailUrl = json['thumbnail']['path'];
    }

}


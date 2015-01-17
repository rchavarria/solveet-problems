class Character {
    String id;
    String name;
    String description;
    String thumbnailUrl;

    Character.fromJson(Map json) {
        id = json['id'];
        name = json['name'];
        description = json['description'];
        thumbnailUrl = buildThumbnailUrl(json);
    }

    String buildThumbnailUrl(Map json) {
        Map thumbnail = json['thumbnail'];
        if (thumbnail == null) {
            return '';
        }

        var path = thumbnail['path'];
        var extension = thumbnail['extension'];
        return '${path}.${extension}';
    }
}


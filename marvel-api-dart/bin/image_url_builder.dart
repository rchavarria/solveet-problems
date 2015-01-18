class ImageUrlBuilder {
    String fromMap(Map thumbnail) {
        if (thumbnail == null) {
            return '';
        }

        var path = thumbnail['path'];
        var extension = thumbnail['extension'];
        return '${path}.${extension}';
    }
}

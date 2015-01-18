/**
  * Handles Image entities
  */
class ImageUrlBuilder {

    /**
      * Builds an Image URL from a map returned by the API
      */
    String fromMap(Map thumbnail) {
        if (thumbnail == null) {
            return '';
        }

        var path = thumbnail['path'];
        var extension = thumbnail['extension'];
        return '${path}.${extension}';
    }

}

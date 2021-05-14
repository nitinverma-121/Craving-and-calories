class RecipeModel {
  String label;
  String image;
  String source;
  String url;

  RecipeModel({this.image, this.label, this.source, this.url});

  factory RecipeModel.fromMap(Map<String, dynamic> parsedJson) {
    return RecipeModel(
      label: parsedJson["label"],
      image: parsedJson["image"],
      source: parsedJson["source"],
      url: parsedJson["url"],
    );
  }
}

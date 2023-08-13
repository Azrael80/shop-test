class Rating {
  /// Note de l'objet.
  double? rate;

  /// Nombre de notes.
  int? count;

  Rating.fromJson(Map<String, dynamic> json)
      : rate =
            json['rate'] != null ? double.tryParse(['rate'].toString()) : null,
        count = json['count'];

  Map<String, dynamic> toJson() => {
        'rate': rate,
        'count': count,
      };
}

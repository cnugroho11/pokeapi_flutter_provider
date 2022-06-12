class PokemonName {
  String name;
  String url;

  PokemonName({
    required this.name,
    required this.url,
  });

  factory PokemonName.fromJson(Map<String, dynamic> json){
    return PokemonName(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
    );
  }
}

class NextUrl {
  String next;

  NextUrl({required this.next});
  
  factory NextUrl.fromJson(Map<String, dynamic> json){
    return NextUrl(
      next: json['next']
    );
  }
}

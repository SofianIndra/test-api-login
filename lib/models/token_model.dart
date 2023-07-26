class TokenModel {
  String? accessToken;
  final String? tokenType;

  TokenModel({
    this.accessToken,
    this.tokenType,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        accessToken: json['access_token'],
        tokenType: json['token_type'],
      );

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'token_type': tokenType,
    };
  }
}

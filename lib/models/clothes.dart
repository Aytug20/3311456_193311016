class Clothes {
  String? productName;
  String? price;
  String? imageUrl;

  Clothes(
    this.productName,
    this.price,
    this.imageUrl,
  );

  static List<Clothes> generateClothes() {
    return [
      Clothes(
        'Memphis Grizzlies Forma',
        '\₺ 899',
        'assets/images/MemphisGrizzlies_FINAL.jpg',
      ),
      Clothes(
        'Memphis Grizzlies Şapka',
        '\₺ 499',
        'assets/images/thumb_aspx.jpg',
      ),
      Clothes(
        'Memphis Grizzlies Basketbol topu',
        '\₺ 599',
        'assets/images/top.jpg',
      ),
    ];
  }
}

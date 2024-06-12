import 'dart:convert';

class RecipeModel {
  final int? from;
  final int? to;
  final int? count;
  final Links? links;
  final List<Hit>? hits;

  RecipeModel({
    this.from,
    this.to,
    this.count,
    this.links,
    this.hits,
  });

  factory RecipeModel.fromJson(String str) =>
      RecipeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromMap(Map<String, dynamic> json) => RecipeModel(
        from: json["from"],
        to: json["to"],
        count: json["count"],
        links: Links.fromMap(json["_links"]),
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "from": from,
        "to": to,
        "count": count,
        "_links": links?.toMap(),
        "hits": List<dynamic>.from(hits!.map((x) => x.toMap())),
      };
}

class Hit {
  final Recipe recipe;
  final Links links;

  Hit({
    required this.recipe,
    required this.links,
  });

  factory Hit.fromJson(String str) => Hit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hit.fromMap(Map<String, dynamic> json) => Hit(
        recipe: Recipe.fromMap(json["recipe"]),
        links: Links.fromMap(json["_links"]),
      );

  Map<String, dynamic> toMap() => {
        "recipe": recipe.toMap(),
        "_links": links.toMap(),
      };
}

class Links {
  final Next self;
  final Next next;

  Links({
    required this.self,
    required this.next,
  });

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        self: Next.fromMap(json["self"]),
        next: Next.fromMap(json["next"]),
      );

  Map<String, dynamic> toMap() => {
        "self": self.toMap(),
        "next": next.toMap(),
      };
}

class Next {
  final String href;
  final String title;

  Next({
    required this.href,
    required this.title,
  });

  factory Next.fromJson(String str) => Next.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Next.fromMap(Map<String, dynamic> json) => Next(
        href: json["href"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
        "title": title,
      };
}

class Recipe {
  final String uri;
  final String label;
  final String image;
  final Images images;
  final String source;
  final String url;
  final String shareAs;
  final int recipeYield;
  final List<String> dietLabels;
  final List<String> healthLabels;
  final List<String> cautions;
  final List<String> ingredientLines;
  final List<Ingredient> ingredients;
  final int calories;
  final int glycemicIndex;
  final int inflammatoryIndex;
  final int totalCo2Emissions;
  final String co2EmissionsClass;
  final int totalWeight;
  final List<String> cuisineType;
  final List<String> mealType;
  final List<String> dishType;
  final List<String> instructions;
  final List<String> tags;
  final String externalId;
  final Total totalNutrients;
  final Total totalDaily;
  final List<Digest> digest;

  Recipe({
    required this.uri,
    required this.label,
    required this.image,
    required this.images,
    required this.source,
    required this.url,
    required this.shareAs,
    required this.recipeYield,
    required this.dietLabels,
    required this.healthLabels,
    required this.cautions,
    required this.ingredientLines,
    required this.ingredients,
    required this.calories,
    required this.glycemicIndex,
    required this.inflammatoryIndex,
    required this.totalCo2Emissions,
    required this.co2EmissionsClass,
    required this.totalWeight,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
    required this.instructions,
    required this.tags,
    required this.externalId,
    required this.totalNutrients,
    required this.totalDaily,
    required this.digest,
  });

  factory Recipe.fromJson(String str) => Recipe.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Recipe.fromMap(Map<String, dynamic> json) => Recipe(
        uri: json["uri"],
        label: json["label"],
        image: json["image"],
        images: Images.fromMap(json["images"]),
        source: json["source"],
        url: json["url"],
        shareAs: json["shareAs"],
        recipeYield: json["yield"],
        dietLabels: List<String>.from(json["dietLabels"].map((x) => x)),
        healthLabels: List<String>.from(json["healthLabels"].map((x) => x)),
        cautions: List<String>.from(json["cautions"].map((x) => x)),
        ingredientLines:
            List<String>.from(json["ingredientLines"].map((x) => x)),
        ingredients: List<Ingredient>.from(
            json["ingredients"].map((x) => Ingredient.fromMap(x))),
        calories: json["calories"],
        glycemicIndex: json["glycemicIndex"],
        inflammatoryIndex: json["inflammatoryIndex"],
        totalCo2Emissions: json["totalCO2Emissions"],
        co2EmissionsClass: json["co2EmissionsClass"],
        totalWeight: json["totalWeight"],
        cuisineType: List<String>.from(json["cuisineType"].map((x) => x)),
        mealType: List<String>.from(json["mealType"].map((x) => x)),
        dishType: List<String>.from(json["dishType"].map((x) => x)),
        instructions: List<String>.from(json["instructions"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
        externalId: json["externalId"],
        totalNutrients: Total.fromMap(json["totalNutrients"]),
        totalDaily: Total.fromMap(json["totalDaily"]),
        digest: List<Digest>.from(json["digest"].map((x) => Digest.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "uri": uri,
        "label": label,
        "image": image,
        "images": images.toMap(),
        "source": source,
        "url": url,
        "shareAs": shareAs,
        "yield": recipeYield,
        "dietLabels": List<dynamic>.from(dietLabels.map((x) => x)),
        "healthLabels": List<dynamic>.from(healthLabels.map((x) => x)),
        "cautions": List<dynamic>.from(cautions.map((x) => x)),
        "ingredientLines": List<dynamic>.from(ingredientLines.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toMap())),
        "calories": calories,
        "glycemicIndex": glycemicIndex,
        "inflammatoryIndex": inflammatoryIndex,
        "totalCO2Emissions": totalCo2Emissions,
        "co2EmissionsClass": co2EmissionsClass,
        "totalWeight": totalWeight,
        "cuisineType": List<dynamic>.from(cuisineType.map((x) => x)),
        "mealType": List<dynamic>.from(mealType.map((x) => x)),
        "dishType": List<dynamic>.from(dishType.map((x) => x)),
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "externalId": externalId,
        "totalNutrients": totalNutrients.toMap(),
        "totalDaily": totalDaily.toMap(),
        "digest": List<dynamic>.from(digest.map((x) => x.toMap())),
      };
}

class Digest {
  final String label;
  final String tag;
  final String schemaOrgTag;
  final int total;
  final bool hasRdi;
  final int daily;
  final String unit;
  final String sub;

  Digest({
    required this.label,
    required this.tag,
    required this.schemaOrgTag,
    required this.total,
    required this.hasRdi,
    required this.daily,
    required this.unit,
    required this.sub,
  });

  factory Digest.fromJson(String str) => Digest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Digest.fromMap(Map<String, dynamic> json) => Digest(
        label: json["label"],
        tag: json["tag"],
        schemaOrgTag: json["schemaOrgTag"],
        total: json["total"],
        hasRdi: json["hasRDI"],
        daily: json["daily"],
        unit: json["unit"],
        sub: json["sub"],
      );

  Map<String, dynamic> toMap() => {
        "label": label,
        "tag": tag,
        "schemaOrgTag": schemaOrgTag,
        "total": total,
        "hasRDI": hasRdi,
        "daily": daily,
        "unit": unit,
        "sub": sub,
      };
}

class Images {
  final Large thumbnail;
  final Large small;
  final Large regular;
  final Large large;

  Images({
    required this.thumbnail,
    required this.small,
    required this.regular,
    required this.large,
  });

  factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Images.fromMap(Map<String, dynamic> json) => Images(
        thumbnail: Large.fromMap(json["THUMBNAIL"]),
        small: Large.fromMap(json["SMALL"]),
        regular: Large.fromMap(json["REGULAR"]),
        large: Large.fromMap(json["LARGE"]),
      );

  Map<String, dynamic> toMap() => {
        "THUMBNAIL": thumbnail.toMap(),
        "SMALL": small.toMap(),
        "REGULAR": regular.toMap(),
        "LARGE": large.toMap(),
      };
}

class Large {
  final String url;
  final int width;
  final int height;

  Large({
    required this.url,
    required this.width,
    required this.height,
  });

  factory Large.fromJson(String str) => Large.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Large.fromMap(Map<String, dynamic> json) => Large(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class Ingredient {
  final String text;
  final int quantity;
  final String measure;
  final String food;
  final int weight;
  final String foodId;

  Ingredient({
    required this.text,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.weight,
    required this.foodId,
  });

  factory Ingredient.fromJson(String str) =>
      Ingredient.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ingredient.fromMap(Map<String, dynamic> json) => Ingredient(
        text: json["text"],
        quantity: json["quantity"],
        measure: json["measure"],
        food: json["food"],
        weight: json["weight"],
        foodId: json["foodId"],
      );

  Map<String, dynamic> toMap() => {
        "text": text,
        "quantity": quantity,
        "measure": measure,
        "food": food,
        "weight": weight,
        "foodId": foodId,
      };
}

class Total {
  final AdditionalProp additionalProp1;
  final AdditionalProp additionalProp2;
  final AdditionalProp additionalProp3;

  Total({
    required this.additionalProp1,
    required this.additionalProp2,
    required this.additionalProp3,
  });

  factory Total.fromJson(String str) => Total.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Total.fromMap(Map<String, dynamic> json) => Total(
        additionalProp1: AdditionalProp.fromMap(json["additionalProp1"]),
        additionalProp2: AdditionalProp.fromMap(json["additionalProp2"]),
        additionalProp3: AdditionalProp.fromMap(json["additionalProp3"]),
      );

  Map<String, dynamic> toMap() => {
        "additionalProp1": additionalProp1.toMap(),
        "additionalProp2": additionalProp2.toMap(),
        "additionalProp3": additionalProp3.toMap(),
      };
}

class AdditionalProp {
  final String label;
  final int quantity;
  final String unit;

  AdditionalProp({
    required this.label,
    required this.quantity,
    required this.unit,
  });

  factory AdditionalProp.fromJson(String str) =>
      AdditionalProp.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AdditionalProp.fromMap(Map<String, dynamic> json) => AdditionalProp(
        label: json["label"],
        quantity: json["quantity"],
        unit: json["unit"],
      );

  Map<String, dynamic> toMap() => {
        "label": label,
        "quantity": quantity,
        "unit": unit,
      };
}

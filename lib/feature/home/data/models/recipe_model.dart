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
        links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
        hits: json["hits"] == null
            ? []
            : List<Hit>.from(json["hits"]!.map((x) => Hit.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "from": from,
        "to": to,
        "count": count,
        "_links": links?.toMap(),
        "hits":
            hits == null ? [] : List<dynamic>.from(hits!.map((x) => x.toMap())),
      };
}

class Hit {
  final Recipe? recipe;
  final Links? links;

  Hit({
    this.recipe,
    this.links,
  });

  factory Hit.fromJson(String str) => Hit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Hit.fromMap(Map<String, dynamic> json) => Hit(
        recipe: json["recipe"] == null ? null : Recipe.fromMap(json["recipe"]),
        links: json["_links"] == null ? null : Links.fromMap(json["_links"]),
      );

  Map<String, dynamic> toMap() => {
        "recipe": recipe?.toMap(),
        "_links": links?.toMap(),
      };
}

class Links {
  final Next? self;
  final Next? next;

  Links({
    this.self,
    this.next,
  });

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? null : Next.fromMap(json["self"]),
        next: json["next"] == null ? null : Next.fromMap(json["next"]),
      );

  Map<String, dynamic> toMap() => {
        "self": self?.toMap(),
        "next": next?.toMap(),
      };
}

class Next {
  final String? href;
  final String? title;

  Next({
    this.href,
    this.title,
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
  final String? uri;
  final String? label;
  final String? image;
  final Images? images;
  final String? source;
  final String? url;
  final String? shareAs;
  final double? recipeYield;
  final List<String>? dietLabels;
  final List<String>? healthLabels;
  final List<String>? cautions;
  final List<String>? ingredientLines;
  final List<Ingredient>? ingredients;
  final double? calories;
  final int? glycemicIndex;
  final int? inflammatoryIndex;
  final double? totalCo2Emissions;
  final String? co2EmissionsClass;
  final double? totalWeight;
  final List<String>? cuisineType;
  final List<String>? mealType;
  final List<String>? dishType;
  final List<String>? instructions;
  final List<String>? tags;
  final String? externalId;
  final Total? totalNutrients;
  final Total? totalDaily;
  final List<Digest>? digest;

  Recipe({
    this.uri,
    this.label,
    this.image,
    this.images,
    this.source,
    this.url,
    this.shareAs,
    this.recipeYield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.ingredients,
    this.calories,
    this.glycemicIndex,
    this.inflammatoryIndex,
    this.totalCo2Emissions,
    this.co2EmissionsClass,
    this.totalWeight,
    this.cuisineType,
    this.mealType,
    this.dishType,
    this.instructions,
    this.tags,
    this.externalId,
    this.totalNutrients,
    this.totalDaily,
    this.digest,
  });

  factory Recipe.fromJson(String str) => Recipe.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Recipe.fromMap(Map<String, dynamic> json) => Recipe(
        uri: json["uri"],
        label: json["label"],
        image: json["image"],
        images: json["images"] == null ? null : Images.fromMap(json["images"]),
        source: json["source"],
        url: json["url"],
        shareAs: json["shareAs"],
        recipeYield: json["yield"],
        dietLabels: json["dietLabels"] == null
            ? []
            : List<String>.from(json["dietLabels"]!.map((x) => x)),
        healthLabels: json["healthLabels"] == null
            ? []
            : List<String>.from(json["healthLabels"]!.map((x) => x)),
        cautions: json["cautions"] == null
            ? []
            : List<String>.from(json["cautions"]!.map((x) => x)),
        ingredientLines: json["ingredientLines"] == null
            ? []
            : List<String>.from(json["ingredientLines"]!.map((x) => x)),
        ingredients: json["ingredients"] == null
            ? []
            : List<Ingredient>.from(
                json["ingredients"]!.map((x) => Ingredient.fromMap(x))),
        calories: json["calories"],
        glycemicIndex: json["glycemicIndex"],
        inflammatoryIndex: json["inflammatoryIndex"],
        totalCo2Emissions: json["totalCO2Emissions"],
        co2EmissionsClass: json["co2EmissionsClass"],
        totalWeight: json["totalWeight"],
        cuisineType: json["cuisineType"] == null
            ? []
            : List<String>.from(json["cuisineType"]!.map((x) => x)),
        mealType: json["mealType"] == null
            ? []
            : List<String>.from(json["mealType"]!.map((x) => x)),
        dishType: json["dishType"] == null
            ? []
            : List<String>.from(json["dishType"]!.map((x) => x)),
        instructions: json["instructions"] == null
            ? []
            : List<String>.from(json["instructions"]!.map((x) => x)),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        externalId: json["externalId"],
        totalNutrients: json["totalNutrients"] == null
            ? null
            : Total.fromMap(json["totalNutrients"]),
        totalDaily: json["totalDaily"] == null
            ? null
            : Total.fromMap(json["totalDaily"]),
        digest: json["digest"] == null
            ? []
            : List<Digest>.from(json["digest"]!.map((x) => Digest.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "uri": uri,
        "label": label,
        "image": image,
        "images": images?.toMap(),
        "source": source,
        "url": url,
        "shareAs": shareAs,
        "yield": recipeYield,
        "dietLabels": dietLabels == null
            ? []
            : List<dynamic>.from(dietLabels!.map((x) => x)),
        "healthLabels": healthLabels == null
            ? []
            : List<dynamic>.from(healthLabels!.map((x) => x)),
        "cautions":
            cautions == null ? [] : List<dynamic>.from(cautions!.map((x) => x)),
        "ingredientLines": ingredientLines == null
            ? []
            : List<dynamic>.from(ingredientLines!.map((x) => x)),
        "ingredients": ingredients == null
            ? []
            : List<dynamic>.from(ingredients!.map((x) => x.toMap())),
        "calories": calories,
        "glycemicIndex": glycemicIndex,
        "inflammatoryIndex": inflammatoryIndex,
        "totalCO2Emissions": totalCo2Emissions,
        "co2EmissionsClass": co2EmissionsClass,
        "totalWeight": totalWeight,
        "cuisineType": cuisineType == null
            ? []
            : List<dynamic>.from(cuisineType!.map((x) => x)),
        "mealType":
            mealType == null ? [] : List<dynamic>.from(mealType!.map((x) => x)),
        "dishType":
            dishType == null ? [] : List<dynamic>.from(dishType!.map((x) => x)),
        "instructions": instructions == null
            ? []
            : List<dynamic>.from(instructions!.map((x) => x)),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "externalId": externalId,
        "totalNutrients": totalNutrients?.toMap(),
        "totalDaily": totalDaily?.toMap(),
        "digest": digest == null
            ? []
            : List<dynamic>.from(digest!.map((x) => x.toMap())),
      };
}

class Digest {
  final String? label;
  final String? tag;
  final String? schemaOrgTag;
  final double? total;
  final bool? hasRdi;
  final double? daily;
  final String? unit;
  final List<Digest>? sub;

  Digest({
    this.label,
    this.tag,
    this.schemaOrgTag,
    this.total,
    this.hasRdi,
    this.daily,
    this.unit,
    this.sub,
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
        sub: json["sub"] == null
            ? []
            : List<Digest>.from(json["sub"]!.map((x) => Digest.fromMap(x))),
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
  final Large? thumbnail;
  final Large? small;
  final Large? regular;
  final Large? large;

  Images({
    this.thumbnail,
    this.small,
    this.regular,
    this.large,
  });

  factory Images.fromJson(String str) => Images.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Images.fromMap(Map<String, dynamic> json) => Images(
        thumbnail:
            json["THUMBNAIL"] == null ? null : Large.fromMap(json["THUMBNAIL"]),
        small: json["SMALL"] == null ? null : Large.fromMap(json["SMALL"]),
        regular:
            json["REGULAR"] == null ? null : Large.fromMap(json["REGULAR"]),
        large: json["LARGE"] == null ? null : Large.fromMap(json["LARGE"]),
      );

  Map<String, dynamic> toMap() => {
        "THUMBNAIL": thumbnail?.toMap(),
        "SMALL": small?.toMap(),
        "REGULAR": regular?.toMap(),
        "LARGE": large?.toMap(),
      };
}

class Large {
  final String? url;
  final int? width;
  final int? height;

  Large({
    this.url,
    this.width,
    this.height,
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
  final String? text;
  final double? quantity;
  final String? measure;
  final String? food;
  final double? weight;
  final String? foodId;

  Ingredient({
    this.text,
    this.quantity,
    this.measure,
    this.food,
    this.weight,
    this.foodId,
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
  final AdditionalProp? additionalProp1;
  final AdditionalProp? additionalProp2;
  final AdditionalProp? additionalProp3;

  Total({
    this.additionalProp1,
    this.additionalProp2,
    this.additionalProp3,
  });

  factory Total.fromJson(String str) => Total.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Total.fromMap(Map<String, dynamic> json) => Total(
        additionalProp1: json["additionalProp1"] == null
            ? null
            : AdditionalProp.fromMap(json["additionalProp1"]),
        additionalProp2: json["additionalProp2"] == null
            ? null
            : AdditionalProp.fromMap(json["additionalProp2"]),
        additionalProp3: json["additionalProp3"] == null
            ? null
            : AdditionalProp.fromMap(json["additionalProp3"]),
      );

  Map<String, dynamic> toMap() => {
        "additionalProp1": additionalProp1?.toMap(),
        "additionalProp2": additionalProp2?.toMap(),
        "additionalProp3": additionalProp3?.toMap(),
      };
}

class AdditionalProp {
  final String? label;
  final int? quantity;
  final String? unit;

  AdditionalProp({
    this.label,
    this.quantity,
    this.unit,
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

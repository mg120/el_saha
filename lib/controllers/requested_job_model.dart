class RequestedJobModel {
  List<Fabrics> fabrics;
  List<Patterns> patterns;
  List<Accessories> accessories;
  List<ProductionCost> productionCost;
  List<Taxes> taxes;
  List<ExtraCost> extraCost;

  RequestedJobModel(
      {this.fabrics,
        this.patterns,
        this.accessories,
        this.productionCost,
        this.taxes,
        this.extraCost});

  RequestedJobModel.fromJson(Map<String, dynamic> json) {
    if (json['fabrics'] != null) {
      fabrics = new List<Fabrics>();
      json['fabrics'].forEach((v) {
        fabrics.add(new Fabrics.fromJson(v));
      });
    }
    if (json['patterns'] != null) {
      patterns = new List<Patterns>();
      json['patterns'].forEach((v) {
        patterns.add(new Patterns.fromJson(v));
      });
    }
    if (json['accessories'] != null) {
      accessories = new List<Accessories>();
      json['accessories'].forEach((v) {
        accessories.add(new Accessories.fromJson(v));
      });
    }
    if (json['production_cost'] != null) {
      productionCost = new List<ProductionCost>();
      json['production_cost'].forEach((v) {
        productionCost.add(new ProductionCost.fromJson(v));
      });
    }
    if (json['taxes'] != null) {
      taxes = new List<Taxes>();
      json['taxes'].forEach((v) {
        taxes.add(new Taxes.fromJson(v));
      });
    }
    if (json['extra_cost'] != null) {
      extraCost = new List<ExtraCost>();
      json['extra_cost'].forEach((v) {
        extraCost.add(new ExtraCost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fabrics != null) {
      data['fabrics'] = this.fabrics.map((v) => v.toJson()).toList();
    }
    if (this.patterns != null) {
      data['patterns'] = this.patterns.map((v) => v.toJson()).toList();
    }
    if (this.accessories != null) {
      data['accessories'] = this.accessories.map((v) => v.toJson()).toList();
    }
    if (this.productionCost != null) {
      data['production_cost'] =
          this.productionCost.map((v) => v.toJson()).toList();
    }
    if (this.taxes != null) {
      data['taxes'] = this.taxes.map((v) => v.toJson()).toList();
    }
    if (this.extraCost != null) {
      data['extra_cost'] = this.extraCost.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Fabrics {
  int type;
  String name;
  int width;
  int mass;
  double cost;

  Fabrics({this.type, this.name, this.width, this.mass, this.cost});

  Fabrics.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    width = json['width'];
    mass = json['mass'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['name'] = this.name;
    data['width'] = this.width;
    data['mass'] = this.mass;
    data['cost'] = this.cost;
    return data;
  }
}

class Patterns {
  String fabric;
  int areaType;
  String name;
  List<Edges> edges;

  Patterns({this.fabric, this.areaType, this.name, this.edges});

  Patterns.fromJson(Map<String, dynamic> json) {
    fabric = json['fabric'];
    areaType = json['area_type'];
    name = json['name'];
    if (json['edges'] != null) {
      edges = new List<Edges>();
      json['edges'].forEach((v) {
        edges.add(new Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fabric'] = this.fabric;
    data['area_type'] = this.areaType;
    data['name'] = this.name;
    if (this.edges != null) {
      data['edges'] = this.edges.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Edges {
  String name;
  int value;

  Edges({this.name, this.value});

  Edges.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Accessories {
  String name;
  int cost;

  Accessories({this.name, this.cost});

  Accessories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cost'] = this.cost;
    return data;
  }
}

class Taxes {
  String name;
  double percentage;

  Taxes({this.name, this.percentage});

  Taxes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['percentage'] = this.percentage;
    return data;
  }
}

class ExtraCost {
  String name;
  int cost;

  ExtraCost({this.name, this.cost});

  ExtraCost.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cost'] = this.cost;
    return data;
  }
}

class ProductionCost {
  String name;
  int cost;

  ProductionCost({this.name, this.cost});

  ProductionCost.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cost = json['cost'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cost'] = this.cost;
    return data;
  }
}
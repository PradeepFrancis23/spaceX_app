class RocketModel {
  Diameter? height;
  Diameter? diameter;
  Mass? mass;
  FirstStage? firstStage;
  SecondStage? secondStage;
  Engines? engines;
  LandingLegs? landingLegs;
  List<PayloadWeights>? payloadWeights;
  List<String>? flickrImages;
  String? name;
  String? type;
  bool? active;
  int? stages;
  int? boosters;
  int? costPerLaunch;
  int? successRatePct;
  String? firstFlight;
  String? country;
  String? company;
  String? wikipedia;
  String? description;
  String? id;

  RocketModel(
      {this.height,
      this.diameter,
      this.mass,
      this.firstStage,
      this.secondStage,
      this.engines,
      this.landingLegs,
      this.payloadWeights,
      this.flickrImages,
      this.name,
      this.type,
      this.active,
      this.stages,
      this.boosters,
      this.costPerLaunch,
      this.successRatePct,
      this.firstFlight,
      this.country,
      this.company,
      this.wikipedia,
      this.description,
      this.id});

  RocketModel.fromJson(Map<String, dynamic> json) {
    height =
        json['height'] != null ? new Diameter.fromJson(json['height']) : null;
    diameter = json['diameter'] != null
        ? new Diameter.fromJson(json['diameter'])
        : null;
    mass = json['mass'] != null ? new Mass.fromJson(json['mass']) : null;
    firstStage = json['first_stage'] != null
        ? new FirstStage.fromJson(json['first_stage'])
        : null;
    secondStage = json['second_stage'] != null
        ? new SecondStage.fromJson(json['second_stage'])
        : null;
    engines =
        json['engines'] != null ? new Engines.fromJson(json['engines']) : null;
    landingLegs = json['landing_legs'] != null
        ? new LandingLegs.fromJson(json['landing_legs'])
        : null;
    if (json['payload_weights'] != null) {
      payloadWeights = <PayloadWeights>[];
      json['payload_weights'].forEach((v) {
        payloadWeights!.add(new PayloadWeights.fromJson(v));
      });
    }
    flickrImages = json['flickr_images'].cast<String>();
    name = json['name'];
    type = json['type'];
    active = json['active'];
    stages = json['stages'];
    boosters = json['boosters'];
    costPerLaunch = json['cost_per_launch'];
    successRatePct = json['success_rate_pct'];
    firstFlight = json['first_flight'];
    country = json['country'];
    company = json['company'];
    wikipedia = json['wikipedia'];
    description = json['description'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.height != null) {
      data['height'] = this.height!.toJson();
    }
    if (this.diameter != null) {
      data['diameter'] = this.diameter!.toJson();
    }
    if (this.mass != null) {
      data['mass'] = this.mass!.toJson();
    }
    if (this.firstStage != null) {
      data['first_stage'] = this.firstStage!.toJson();
    }
    if (this.secondStage != null) {
      data['second_stage'] = this.secondStage!.toJson();
    }
    if (this.engines != null) {
      data['engines'] = this.engines!.toJson();
    }
    if (this.landingLegs != null) {
      data['landing_legs'] = this.landingLegs!.toJson();
    }
    if (this.payloadWeights != null) {
      data['payload_weights'] =
          this.payloadWeights!.map((v) => v.toJson()).toList();
    }
    data['flickr_images'] = this.flickrImages;
    data['name'] = this.name;
    data['type'] = this.type;
    data['active'] = this.active;
    data['stages'] = this.stages;
    data['boosters'] = this.boosters;
    data['cost_per_launch'] = this.costPerLaunch;
    data['success_rate_pct'] = this.successRatePct;
    data['first_flight'] = this.firstFlight;
    data['country'] = this.country;
    data['company'] = this.company;
    data['wikipedia'] = this.wikipedia;
    data['description'] = this.description;
    data['id'] = this.id;
    return data;
  }
}

class Height {
  double? meters;
  double? feet;

  Height({this.meters, this.feet});

  Height.fromJson(Map<String, dynamic> json) {
    meters = json['meters'];
    feet = json['feet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meters'] = this.meters;
    data['feet'] = this.feet;
    return data;
  }
}

class Diameter {
  num? meters;
  num? feet;

  Diameter({this.meters, this.feet});

  Diameter.fromJson(Map<String, dynamic> json) {
    meters = json['meters'];
    feet = json['feet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meters'] = this.meters;
    data['feet'] = this.feet;
    return data;
  }
}

class Mass {
  int? kg;
  int? lb;

  Mass({this.kg, this.lb});

  Mass.fromJson(Map<String, dynamic> json) {
    kg = json['kg'];
    lb = json['lb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kg'] = this.kg;
    data['lb'] = this.lb;
    return data;
  }
}

class FirstStage {
  ThrustSeaLevel? thrustSeaLevel;
  ThrustSeaLevel? thrustVacuum;
  bool? reusable;
  int? engines;
  num? fuelAmountTons;
  int? burnTimeSec;

  FirstStage(
      {this.thrustSeaLevel,
      this.thrustVacuum,
      this.reusable,
      this.engines,
      this.fuelAmountTons,
      this.burnTimeSec});

  FirstStage.fromJson(Map<String, dynamic> json) {
    thrustSeaLevel = json['thrust_sea_level'] != null
        ? new ThrustSeaLevel.fromJson(json['thrust_sea_level'])
        : null;
    thrustVacuum = json['thrust_vacuum'] != null
        ? new ThrustSeaLevel.fromJson(json['thrust_vacuum'])
        : null;
    reusable = json['reusable'];
    engines = json['engines'];
    fuelAmountTons = json['fuel_amount_tons'];
    burnTimeSec = json['burn_time_sec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thrustSeaLevel != null) {
      data['thrust_sea_level'] = this.thrustSeaLevel!.toJson();
    }
    if (this.thrustVacuum != null) {
      data['thrust_vacuum'] = this.thrustVacuum!.toJson();
    }
    data['reusable'] = this.reusable;
    data['engines'] = this.engines;
    data['fuel_amount_tons'] = this.fuelAmountTons;
    data['burn_time_sec'] = this.burnTimeSec;
    return data;
  }
}

class ThrustSeaLevel {
  int? kN;
  int? lbf;

  ThrustSeaLevel({this.kN, this.lbf});

  ThrustSeaLevel.fromJson(Map<String, dynamic> json) {
    kN = json['kN'];
    lbf = json['lbf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kN'] = this.kN;
    data['lbf'] = this.lbf;
    return data;
  }
}

class SecondStage {
  ThrustSeaLevel? thrust;
  Payloads? payloads;
  bool? reusable;
  int? engines;
  num? fuelAmountTons;
  int? burnTimeSec;

  SecondStage(
      {this.thrust,
      this.payloads,
      this.reusable,
      this.engines,
      this.fuelAmountTons,
      this.burnTimeSec});

  SecondStage.fromJson(Map<String, dynamic> json) {
    thrust = json['thrust'] != null
        ? new ThrustSeaLevel.fromJson(json['thrust'])
        : null;
    payloads = json['payloads'] != null
        ? new Payloads.fromJson(json['payloads'])
        : null;
    reusable = json['reusable'];
    engines = json['engines'];
    fuelAmountTons = json['fuel_amount_tons'];
    burnTimeSec = json['burn_time_sec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.thrust != null) {
      data['thrust'] = this.thrust!.toJson();
    }
    if (this.payloads != null) {
      data['payloads'] = this.payloads!.toJson();
    }
    data['reusable'] = this.reusable;
    data['engines'] = this.engines;
    data['fuel_amount_tons'] = this.fuelAmountTons;
    data['burn_time_sec'] = this.burnTimeSec;
    return data;
  }
}

class Payloads {
  CompositeFairing? compositeFairing;
  String? option1;

  Payloads({this.compositeFairing, this.option1});

  Payloads.fromJson(Map<String, dynamic> json) {
    compositeFairing = json['composite_fairing'] != null
        ? new CompositeFairing.fromJson(json['composite_fairing'])
        : null;
    option1 = json['option_1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.compositeFairing != null) {
      data['composite_fairing'] = this.compositeFairing!.toJson();
    }
    data['option_1'] = this.option1;
    return data;
  }
}

class CompositeFairing {
  Diameter? height;
  Diameter? diameter;

  CompositeFairing({this.height, this.diameter});

  CompositeFairing.fromJson(Map<String, dynamic> json) {
    height =
        json['height'] != null ? new Diameter.fromJson(json['height']) : null;
    diameter = json['diameter'] != null
        ? new Diameter.fromJson(json['diameter'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.height != null) {
      data['height'] = this.height!.toJson();
    }
    if (this.diameter != null) {
      data['diameter'] = this.diameter!.toJson();
    }
    return data;
  }
}

class Engines {
  Isp? isp;
  ThrustSeaLevel? thrustSeaLevel;
  ThrustSeaLevel? thrustVacuum;
  int? number;
  String? type;
  String? version;
  String? layout;
  int? engineLossMax;
  String? propellant1;
  String? propellant2;
  num? thrustToWeight;

  Engines(
      {this.isp,
      this.thrustSeaLevel,
      this.thrustVacuum,
      this.number,
      this.type,
      this.version,
      this.layout,
      this.engineLossMax,
      this.propellant1,
      this.propellant2,
      this.thrustToWeight});

  Engines.fromJson(Map<String, dynamic> json) {
    isp = json['isp'] != null ? new Isp.fromJson(json['isp']) : null;
    thrustSeaLevel = json['thrust_sea_level'] != null
        ? new ThrustSeaLevel.fromJson(json['thrust_sea_level'])
        : null;
    thrustVacuum = json['thrust_vacuum'] != null
        ? new ThrustSeaLevel.fromJson(json['thrust_vacuum'])
        : null;
    number = json['number'];
    type = json['type'];
    version = json['version'];
    layout = json['layout'];
    engineLossMax = json['engine_loss_max'];
    propellant1 = json['propellant_1'];
    propellant2 = json['propellant_2'];
    thrustToWeight = json['thrust_to_weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.isp != null) {
      data['isp'] = this.isp!.toJson();
    }
    if (this.thrustSeaLevel != null) {
      data['thrust_sea_level'] = this.thrustSeaLevel!.toJson();
    }
    if (this.thrustVacuum != null) {
      data['thrust_vacuum'] = this.thrustVacuum!.toJson();
    }
    data['number'] = this.number;
    data['type'] = this.type;
    data['version'] = this.version;
    data['layout'] = this.layout;
    data['engine_loss_max'] = this.engineLossMax;
    data['propellant_1'] = this.propellant1;
    data['propellant_2'] = this.propellant2;
    data['thrust_to_weight'] = this.thrustToWeight;
    return data;
  }
}

class Isp {
  int? seaLevel;
  int? vacuum;

  Isp({this.seaLevel, this.vacuum});

  Isp.fromJson(Map<String, dynamic> json) {
    seaLevel = json['sea_level'];
    vacuum = json['vacuum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sea_level'] = this.seaLevel;
    data['vacuum'] = this.vacuum;
    return data;
  }
}

class LandingLegs {
  int? number;
  String? material;

  LandingLegs({this.number, this.material});

  LandingLegs.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    material = json['material'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['material'] = this.material;
    return data;
  }
}

class PayloadWeights {
  String? id;
  String? name;
  int? kg;
  int? lb;

  PayloadWeights({this.id, this.name, this.kg, this.lb});

  PayloadWeights.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    kg = json['kg'];
    lb = json['lb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['kg'] = this.kg;
    data['lb'] = this.lb;
    return data;
  }
}

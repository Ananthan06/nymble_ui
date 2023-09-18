class ApiResponse {
  App? app;
  List<Widgetss>? widgets;

  ApiResponse({this.app, this.widgets});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    app = json['app'] != null ?  App.fromJson(json['app']) : null;
    if (json['widgets'] != null) {
      widgets = <Widgetss>[];
      json['widgets'].forEach((v) {
        widgets!.add( Widgetss.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (app != null) {
      data['app'] = app!.toJson();
    }
    if (widgets != null) {
      data['widgets'] = widgets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class App {
  String? theme;

  App({this.theme});

  App.fromJson(Map<String, dynamic> json) {
    theme = json['theme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['theme'] = theme;
    return data;
  }
}

class Widgetss {
  String? type;
  String? image;
  String? headerText;
  String? footerText;
  bool? footerIcon;
  String? color;
  String? title;
  List<Items>? items;

  Widgetss(
      {this.type,
        this.image,
        this.headerText,
        this.footerText,
        this.footerIcon,
        this.color,
        this.title,
        this.items});

  Widgetss.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    image = json['image'];
    headerText = json['header_text'];
    footerText = json['footer_text'];
    footerIcon = json['footer_icon'];
    color = json['color'];
    title = json['title'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add( Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['type'] = type;
    data['image'] = image;
    data['header_text'] = headerText;
    data['footer_text'] = footerText;
    data['footer_icon'] = footerIcon;
    data['color'] = color;
    data['title'] = title;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? type;
  String? text;
  String? image;

  Items({this.type, this.text, this.image});

  Items.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['text'] = text;
    data['image'] = image;
    return data;
  }
}
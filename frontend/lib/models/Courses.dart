class Courses {
  late final String? id;
   late final String? name;
  late final String? description;
 late final String? pdf;
  late final String? imageUrl;
 late  final String? date;
 late final String? duree;
 late  final String? vd;
 late final String? updated;

  Courses(
     {
    this.id,
    this.name,
    this.description,
     this.pdf,
     this.vd,
    this.imageUrl,
   this.date,
    this.duree,
    this.updated,
  });

  Courses.fromJson(Map<String, dynamic> json) {

      id=json['id'] ;
      name = json['name'];
   description = json['description'] ;
      pdf =  json['pdf'] ;
      imageUrl =  json['imageUrl'] ;
      date = json['date'] ;
      duree =json['duree'] ;
      vd= json['vd'];
      updated= json['updated'];
    
  }
     Map<String, dynamic> toJson(){
    final _data = <String, dynamic>{};
    _data["id"]=id;
    _data["name"]=name;
    _data["description"]=description;
    _data["pdf"]=pdf;
     _data["imageUrl"]=imageUrl;
      _data["date"]=date;
        _data["duree"]=duree;
          _data["vd"]=vd;
             _data["updated"]=updated;

    return _data;

   }

  @override
  String toString() {
    return 'Event{id: $id, name: $name, location: $pdf}';
  }
}
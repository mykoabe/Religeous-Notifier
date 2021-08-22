class Schedule {
  String? createdby;
  List? allprograms;
  Schedule(this.createdby, this.allprograms);

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      json['createdby'],
      json['programs'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      "createdby": createdby,
      "programs ": allprograms,
    };
  }
}

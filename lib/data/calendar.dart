class Calendar {
  final String date;
  final String issuccess;

  Calendar({required this.date, required this.issuccess});

  Calendar.fromJson(Map<String, dynamic> json)
    : date = json['date'],
      issuccess = json['issuccess'];
}
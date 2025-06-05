class Trip {
  final String id;
  final String status;
  final String title;
  final String startDate;
  final String endDate;
  final int unfinishedTasks;
  final String coverImage;
  final List<String> participantAvatars;

  Trip({
    required this.id,
    required this.status,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.unfinishedTasks,
    required this.coverImage,
    required this.participantAvatars,
  });

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      status: json['status'],
      title: json['title'],
      startDate: json['dates']['start'],
      endDate: json['dates']['end'],
      unfinishedTasks: json['unfinished_tasks'],
      coverImage: json['cover_image'],
      participantAvatars: List<String>.from(
        json['participants'].map((p) => p['avatar_url']),
      ),
    );
  }
}

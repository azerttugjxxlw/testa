final String tableNotes = 'notes';

class NoteFields {
  static final List<String> values = [
    /// ajou fichier
    id, isImportant, number, title, description, time, timefin, timedebut
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
  static final String timefin ='timefin';
  static final String timedebut ='timedebut';

}

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;
  final DateTime timefin;
  final DateTime timedebut;


  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
    required this.timefin,
    required this.timedebut,

  });

  Note copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
    DateTime? timefin,
    DateTime? timedebut,

  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
        timefin: timefin ?? this.timefin,
        timedebut: timedebut ?? this.timedebut

      );

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NoteFields.id] as int?,
        isImportant: json[NoteFields.isImportant] == 1,
        number: json[NoteFields.number] as int,
        title: json[NoteFields.title] as String,
        description: json[NoteFields.description] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
        timefin: DateTime.parse(json[NoteFields.timefin] as String) ,
        timedebut: DateTime.parse(json[NoteFields.timedebut] as String),

  );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.isImportant: isImportant ? 1 : 0,
        NoteFields.number: number,
        NoteFields.description: description,
        NoteFields.time: createdTime.toIso8601String(),
        NoteFields.timefin: timefin.toIso8601String(),
        NoteFields.timedebut: timedebut.toIso8601String(),

      };
}

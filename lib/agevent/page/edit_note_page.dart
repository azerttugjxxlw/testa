import 'package:flutter/material.dart';

import '../../constants.dart';
import '../db/notes_database.dart';
import '../model/note.dart';
import '../widget/note_form_widget.dart';


class AddEditNotePage extends StatefulWidget {
  final Note? note;

  const AddEditNotePage({
    Key? key,
    this.note,
  }) : super(key: key);
  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;
  late DateTime timefin;
  late DateTime timedebut;

  @override
  void initState() {
    super.initState();

    isImportant = widget.note?.isImportant ?? false;
    number = widget.note?.number ?? 0;
    title = widget.note?.title ?? '';
    description = widget.note?.description ?? '';
    timefin =widget.note?.timefin ?? DateTime.now();//timefin changer
    timedebut =widget.note?.timedebut ?? DateTime.now();

  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: Appbare('',actions: [buildButton()],),
        body: Form(
          key: _formKey,
          child: NoteFormWidget(
            isImportant: isImportant,
            number: number,
            title: title,
            description: description,
            timefin: timefin,
            timedebut: timedebut,

            onChangedImportant: (isImportant) => setState(() => this.isImportant = isImportant),
            onChangedNumber: (number) => setState(() => this.number = number),
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedTimefin: (timefin)=> setState(() =>this.timefin=timefin as DateTime),
            onChangedTimedebut:  (timedebut) {
              setState(() {
                this.timedebut = timedebut as DateTime ;
              });
            },
            onChangedDescription: (description) => setState(() => this.description = description),

          ),
        ),
      );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty && timefin.toString().isNotEmpty && timedebut.toString().isNotEmpty ;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : Colors.grey.shade700,
        ),
        onPressed: addOrUpdateNote,
        child: Text('Save'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.note != null;

      if (isUpdating) {
        await updateNote();
      } else {
        await addNote();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateNote() async {
    final note = widget.note!.copy(
      isImportant: isImportant,
      number: number,
      title: title,
      description: description,
      timefin: timefin,
      timedebut: timedebut,


    );

    await NotesDatabase.instance.update(note);
  }

  Future addNote() async {
    final note = Note(
      title: title,
      isImportant: true,
      number: number,
      description: description,
      createdTime: DateTime.now(),
      timefin: timefin,
      timedebut: timedebut,

    );

    await NotesDatabase.instance.create(note);
  }
}
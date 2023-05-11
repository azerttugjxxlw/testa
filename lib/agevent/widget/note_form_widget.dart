import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';

import '../../constants.dart';

class NoteFormWidget extends StatelessWidget {

//date variable
//date variable


  final bool? isImportant;
  final int? number;
  final String? title;
  final DateTime? timefin;
  final DateTime? timedebut;
  //date de fin
  final String? description;
  final ValueChanged<bool> onChangedImportant;
  final ValueChanged<int> onChangedNumber;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final ValueChanged<DateTimeRange?>? onChangedTimefin;
  final ValueChanged<DateTimeRange?>? onChangedTimedebut;





   NoteFormWidget({
    Key? key,
    this.isImportant = false,
    this.number = 0,
    this.title = '',
    this.description = '',
     this.timefin,
     this.timedebut,



    required this.onChangedImportant,
    required this.onChangedNumber,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onChangedTimefin,
    required this.onChangedTimedebut,

    // required void Function(dynamic timedebut) onChangedTimedebut,

    //date de fin

  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Switch(
                    value: isImportant ?? false,
                    onChanged: onChangedImportant,
                  ),
                  Expanded(
                    child: Slider(
                      value: (number ?? 0).toDouble(),
                      min: 0,
                      max: 5,
                      divisions: 5,
                      onChanged: (number) => onChangedNumber(number.toInt()),
                    ),
                  )
                ],
              ),
              buildTimefin(),
              const SizedBox(height: 8),
              buildTimedebut(),
              const SizedBox(height: 8),
              buildTitle(),
              const SizedBox(height: 8),
              buildDescription(),
              const SizedBox(height: 16),



            ],
          ),
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        style: kEdit,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'nom',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) =>
            title != null && title.isEmpty ? 'Le nom ne peut pas être vide' : null,
        onChanged: onChangedTitle,
      );


  Widget  buildTimedebut()=>  FastDateRangePicker(
    name: 'timedebut',
    labelText: 'Date Range Picker',
    // initialValue: DateTime.now(),
    decoration: InputDecoration(
      //hintText: timefin,
        hintStyle: TextStyle(color: Colors.black)
    ),
    validator: (timedebut)=> timedebut == null  ?  'fin' : null, onChanged:onChangedTimedebut,

    firstDate: DateTime(1970),
    lastDate: DateTime(2040),
  );
  Widget  buildTimefin()=> FastDateRangePicker(
    name: 'date_range_picker',
    labelText: 'Date Range Picker',
   // initialValue: DateTime.now(),
   decoration: InputDecoration(
     //hintText: timefin,
     hintStyle: TextStyle(color: Colors.black)
   ),
   validator: (timefin)=> timefin == null  ?  'fin' : null, onChanged: onChangedTimefin,
    firstDate: DateTime(1970),
    lastDate: DateTime(2040),
  );/* TextFormField(
    maxLines: 1,
    initialValue: timefin,
    style: kEdit,
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'timefin',
      hintStyle: TextStyle(color: Colors.black),
    ),
    validator: (timefin) =>
    timefin != null && timefin.isEmpty ? 'Le nom ne peut pas être vide' : null,
    onChanged: onChangedTimefin,
  );*/

  /*Widget buildTimefin()=>  FastDateRangePicker(
    decoration: const InputDecoration(
      border: InputBorder.none,
      hintText: 'indeterminer',
      hintStyle: TextStyle(color: Colors.white70),
    ),

    validator: (timedebut) => timedebut != null && timedebut.isEmpty
        ? ' ne peut pas être vide'
        : null,onChanged: (value){
    rest_datedebut= value!.start;
    print(rest_datedebut);
    timedebut:rest_datedebut;
  },
    validator: (timefin) => timefin != null  ? 'Le nom ne peut pas être vide' : null,
    onChanged: (value){

      rest_datefin= value!.end;
      print(rest_datefin);
      timefin:rest_datefin;

    },

    //onChanged: onChangedTimefin,
    name: 'timefin',
    firstDate: DateTime(2020),
    lastDate:  DateTime(3000),
    fieldStartLabelText: 'Debut',
    fieldEndLabelText: 'Fin',
    labelText: 'Dates(debut-fin )',


  );*/
  Widget buildDescription() => TextFormField(
        maxLines: 5,
        initialValue: description,
        style: kEdit,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'ecrir quelque chose...',
          hintStyle: TextStyle(color: Colors.black),
        ),
        validator: (title) => title != null && title.isEmpty
            ? 'La description ne peut pas être vide'
            : null,
        onChanged: onChangedDescription,
      );
}


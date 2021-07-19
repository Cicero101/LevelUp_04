import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloco_de_notas/src/features/new_note/new_note.dart';
import 'package:bloco_de_notas/src/shared/constants/app_colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class HomePageNotes extends StatefulWidget {
  const HomePageNotes({Key? key}) : super(key: key);

  @override
  _HomePageNotesState createState() => _HomePageNotesState();
}
class _HomePageNotesState extends State<HomePageNotes> {
  final notes = <Map<String, dynamic>>[];
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: AppColors.blueGradient2),
        ),
        automaticallyImplyLeading: false,
        backwardsCompatibility: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/notes_logo.png",
              height: 35.0,
            ),
            Image.asset(
              "assets/images/journal.png",
              height: 40.0,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Pesquisar',
                hintStyle: TextStyle(
                  color: Color(0xFF8A000000),
                ),
                suffixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF8A000000),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: RawScrollbar(
                thickness: 7.0,
                radius: Radius.circular(3.0),
                thumbColor: Color(0xFFAFACF3),
                child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2, 
                  itemCount: notes.length,
                  itemBuilder: (BuildContext context, index) => (
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewNotePage(
                              icon: [],
                              title: notes[index]['title'],
                              content: notes[index]['content'],
                            )
                          )
                        ).then((value){
                          notes[index]=value;
                          setState(() {});
                        });
                      },
                      child: Card(
                        elevation: 3.0,
                        child: Flex(
                          mainAxisSize: MainAxisSize.min,
                          direction: Axis.vertical,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 3.0,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                  color: notes[index]['titlecolor'], 
                                ),
                                width: double.infinity,
                                child: Text(
                                  notes[index]['title'], 
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: notes[index]['icon'],
                              ),
                           ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                notes[index]['content'], 
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                              child: Text(
                                'Criação: 18/07/2021',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ),
                  staggeredTileBuilder: (index) =>
                  new StaggeredTile.fit(1),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                )
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewNotePage(icon: [],)))
              .then((value) {
            notes.add(value);
            setState(() {});
          });
        },
        child: Container(
          width: 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            gradient: AppColors.blueGradient,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                offset: Offset(0.0, 1.0),
                blurRadius: 18.0,
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.14),
                offset: Offset(0.0, 6.0),
                blurRadius: 10.0,
              ),
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0.0, 3),
                  blurRadius: 5.0,
                  spreadRadius: -1.0),
            ],
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
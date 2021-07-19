import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloco_de_notas/src/shared/constants/text_styles.dart';
import 'package:bloco_de_notas/src/shared/constants/app_colors.dart';

class NewNotePage extends StatefulWidget {
  final String? title;
  final String? titleColor;
  final String? content;
  final List<Widget> icon;
  final String? date;
  NewNotePage({
    Key? key,
    this.title,
    required this.icon ,
    this.titleColor,
    this.content,
    this.date,
  }) : super(key: key);


  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  var title;
  var titleColor;
  var icon;
  var content;
  var date;
  
void confirm() {
  titleColor = _value.color;
  if(icon == null){
    icon = [Icon(Icons.favorite_border, color: Colors.transparent,)];
  }
  if(title == null){
    title = "";
  }
  if(content == null){
    content = "";
  }
  final map = Map<String, dynamic>();
  map.addAll({"title": title, "content": content, "titlecolor":titleColor, "date":date, "icon":icon});
  Navigator.pop(context, map);
}

  late DropDownItemData _value = DropDownItemData(
    color: AppColors.rosa,
    value: "rosa",
  );

  final List<DropDownItemData> list = [
    DropDownItemData(
      color: AppColors.rosa,
      value: "rosa",
    ),
    DropDownItemData(
      color: AppColors.verde,
      value: "verde",
    ),
    DropDownItemData(
      color: AppColors.roxo3,
      value: "roxo3",
    ),
    DropDownItemData(
      color: AppColors.ciano,
      value: "ciano",
    ),
    DropDownItemData(
      color: AppColors.amarelo,
      value: "amarelo",
    ),
  ];

  @override
  void initState() {
    _value = list[0];
    title = widget.title;
    content = widget.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Image.asset("assets/images/app_bar_logo.png"),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: widget.title,
                          onChanged: (value) {
                            title = value;
                          },
                          decoration: InputDecoration(
                            hintText: "Título",
                            hintStyle: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              letterSpacing: 0.15,
                              color: Colors.black.withOpacity(0.54),
                            ),
                            labelStyle: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0,
                              letterSpacing: 0.15,
                              color: Colors.black.withOpacity(0.54),
                            ),
                            border: InputBorder.none,
                            errorBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      DropdownButton(
                        underline: Container(),
                        onChanged: (value) {
                          setState(() {
                            _value = value as DropDownItemData;
                          });
                        },
                        value: _value,
                        selectedItemBuilder: (BuildContext context) {
                          return list.map<Widget>((DropDownItemData item) {
                            return Center(
                              child: Container(
                                height: 18.0,
                                width: 18.0,
                                decoration: BoxDecoration(
                                  color: _value.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          }).toList();
                        },
                        focusColor: Colors.transparent,
                        items: list
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Center(
                                  child: Container(
                                    height: 18.0,
                                    width: 18.0,
                                    decoration: BoxDecoration(
                                      color: e.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                  TextFormField(
                    initialValue: widget.content,
                    onChanged: (value) {
                      content = value;
                    },
                    maxLines: null,
                    minLines: null,
                    decoration: InputDecoration(
                      hintText: "Digite aqui...",
                      hintStyle: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.15,
                        color: Colors.black.withOpacity(0.54),
                      ),
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 88.0,
            right: 28.0,
            child: InkWell(
              onTap: () {
                confirm();
              },
              child: Container(
                width: 73.0,
                height: 32.0,
                decoration: BoxDecoration(
                  gradient: AppColors.blueGradient,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      offset: Offset(0.0, 1.0),
                      blurRadius: 5.0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.14),
                      offset: Offset(0.0, 2.0),
                      blurRadius: 2.0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.20),
                      offset: Offset(0.0, 3.0),
                      blurRadius: 1.0,
                      spreadRadius: -2.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "SALVAR",
                    style: TextStyles.white14w500Roboto,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: MediaQuery.of(context).viewInsets.bottom == 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  bottom: 24.0,
                ),
                child: SafeArea(
                  bottom: true,
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            icon = [
                              Icon(
                                Icons.date_range,
                                color: Colors.grey,
                              ),
                              Icon(
                                Icons.attach_file,
                                color: Colors.grey,
                              ),
                              Icon(
                                Icons.favorite,
                                color: Colors.grey,
                              ),
                            ];
                          },
                          icon: Icon(
                            Icons.date_range,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                           icon = [Icon(Icons.attach_file_outlined, color: Colors.grey,)];
                          },
                          icon: Icon(
                            Icons.attach_file_outlined,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            icon = [Icon(Icons.favorite, color: Colors.grey,)];
                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black.withOpacity(0.54),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DropDownItemData {
  final Color color;
  final String value;

  DropDownItemData({
    required this.color,
    required this.value,
  });
}

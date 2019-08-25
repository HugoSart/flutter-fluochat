import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  String name = 'Dummy';
  String lastMessage = 'This is the last message of Dummy';
  DateTime date = DateTime.now();
  int numberOfNewMessages = 0;
  bool muted = false;
  AssetImage picture = AssetImage('graphics/sample_pic.jpg');


  ChatItem({this.name, this.lastMessage, this.date, this.numberOfNewMessages,
      this.muted, this.picture}) {
    if (this.name == null) this.name = 'Dummy';
    if (this.lastMessage == null) this.lastMessage = 'Last message of Dummy';
    if (this.date == null) this.date = DateTime.now();
    if (this.numberOfNewMessages == null) this.numberOfNewMessages = 0;
    if (this.muted == null) this.muted = false;
    if (this.picture == null) this.picture = AssetImage('assets/graphics/sample_pic.jpg');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 52,
              height: 52,
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: picture, fit: BoxFit.cover)
              ),
            ), // Picture
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: Text(lastMessage,
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              ),
            ), // Name and last message
            Container(
              margin: EdgeInsets.fromLTRB(4, 0, 16, 0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Visibility(
                        visible: false,
                        maintainState: true,
                        maintainAnimation: true,
                        maintainSize: true,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Icon(Icons.volume_mute),
                        ),
                      ),
                      Text(_formatDate(date),
                          style: TextStyle(
                              fontSize: 11, color: _getHighlightColor(context))),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 2, 4, 0),
                        child: Visibility(
                          visible: false,
                          maintainState: muted && numberOfNewMessages == 0,
                          maintainAnimation: muted && numberOfNewMessages == 0,
                          maintainSize: muted && numberOfNewMessages == 0,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Icon(Icons.volume_off, size: 18, color: Color.fromRGBO(0, 0, 0, 0.25)),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 3, numberOfNewMessages == 0 ? 0 : 4, 0),
                        child: Visibility(
                          visible: muted,
                          maintainState: true,
                          maintainAnimation: true,
                          maintainSize: true,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Icon(Icons.volume_off, size: 18, color: Color.fromRGBO(0, 0, 0, 0.25)),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: numberOfNewMessages > 0,
                        maintainSize: !muted,
                        maintainAnimation: true,
                        maintainState: true,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                          child: Stack(alignment: Alignment.center, children: [
                            Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Text(numberOfNewMessages.toString(),
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white))
                          ]),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ), // Timestamp
          ],
        ),
        Container(
          height: 1,
          margin: EdgeInsets.fromLTRB(81, 0, 16, 0),
          decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.075)),
        )
      ],
    );
  }

  String _formatDate(DateTime date) {
    var today = DateTime.now();
    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day)
      return date.hour.toString().padLeft(2, '0') + ':' + date.minute.toString().padLeft(2, '0');
    else if (date.day == today.day - 1)
      return 'Ontem';
    else
      return date.year.toString() +
          '/' +
          date.month.toString().padLeft(2, '0') +
          '/' +
          date.day.toString().padLeft(2, '0');
  }

  Color _getHighlightColor(BuildContext context) {
    if (numberOfNewMessages > 0) return Theme.of(context).primaryColor;
    return Colors.grey;
  }
  
}

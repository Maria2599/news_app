import 'package:flutter/material.dart';

Widget buildComponent(List list) => Scaffold(
    body: ListView.separated(
        physics: BouncingScrollPhysics(),
        //haid5ol 3la List task w ymsk l index l 2ola 0 w ba3d kda 1
        itemBuilder: (context, index) => TaskItem(list[index], context),
        separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
        itemCount: list.length));

Widget TaskItem(article, context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            article['urlToImage'] != null
                ? Image(
                    image: NetworkImage(article['urlToImage']),
                    height: 140,
                    width: 140,
                    fit: BoxFit.cover,
                  )
                : Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/R.5c2cd59a45fc00aa3d5de63eb949ebe9?rik=brY%2bR0aEUse1rw&riu=http%3a%2f%2fcdn.onlinewebfonts.com%2fsvg%2fimg_526949.png&ehk=Rt58Ja72hUDm3%2ftogOfh%2fvJstFcuZCV39CyQJj53Lb4%3d&risl=&pid=ImgRaw&r=0'),
                    height: 140,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child:
                  article['title']!= null ?
                  Text(
                    article['title'],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ):Text(
                    "No Title",
                    style: TextStyle(fontSize: 17),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                article['description']!=null?
                Text(
                  article['description'],
                  style: TextStyle(fontSize: 17, color: Color.fromARGB(
                      210, 102, 98, 98)),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ):Text(
                  "No description",
                  style: TextStyle(fontSize: 17),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ))
          ],
        ),
      ),
    );

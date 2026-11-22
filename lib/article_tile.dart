import 'package:flutter/material.dart';

import 'article.dart';

class ArticleTile extends StatelessWidget {
  final Article article;

  const ArticleTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
   return InkWell(
     onTap: (){},
     child: Column(
       children: [
         Padding(padding: const EdgeInsets.all(12),
           child: Row(
             children: [
               const Spacer(),
               Text(
                 article.date.toString(),
                 style: TextStyle(
                     color: Colors.red,
                     fontSize: 14
                 ),
               )
             ],
           ),
         ),

          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8
            ),
            clipBehavior: Clip.antiAlias,
            elevation: 8,
            child: (article.imageUrl != "")
                    ? Image.network(article.imageUrl, fit: BoxFit.cover, width: MediaQuery.of(context).size.width,)
                    : const SizedBox(height: 0,),
          ),
         Text(
           article.title,
           style: Theme.of(context).textTheme.titleMedium,
           textAlign: TextAlign.center,
         ),

         // const Divider(
         //   indent: 32,
         //   endIndent: 32,
         // ),

         Padding(padding: const EdgeInsets.symmetric(
             horizontal: 12,
         ),
           child: Text(
             article.description,
             style: const TextStyle(
               fontStyle: FontStyle.italic
             ),
           ),
         )
       ],
     ),
   );
  }


}
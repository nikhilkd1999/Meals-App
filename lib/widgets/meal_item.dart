import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';




class MealItem extends StatelessWidget {


    final String title;
    final String imageUrl;
    final Affordability affordability;
    final Complexity complexity;
    final int duration;


    MealItem({
      @required this.title,
      @required this.imageUrl,
      @required this.affordability,
      @required this.complexity,
      @required this.duration
    });




  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){},


      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),

        elevation: 5,

        margin: EdgeInsets.all(10),


        child: Column(
          children: [

            Stack(
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),

                  child: Image.network(imageUrl,height: 250,width: double.infinity, fit: BoxFit.cover,),
                ),

                Positioned(
                  
                  bottom: 20,
                  right: 10,
                  
                  child: Container(
                    width: 290,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                    color: Colors.black54,
                    child: Text(title,style: TextStyle(fontSize: 26,color: Colors.white),softWrap: true,overflow: TextOverflow.fade,))),



              ],
            )


          ],
        ),



      ),



    );
  }
}
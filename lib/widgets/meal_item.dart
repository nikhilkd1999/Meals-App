import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';




class MealItem extends StatelessWidget {


    final String id;
    final String title;
    final String imageUrl;
    final Affordability affordability;
    final Complexity complexity;
    final int duration;


    MealItem({
      @required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.affordability,
      @required this.complexity,
      @required this.duration
    });


    String get getComplexity
    {

      if( complexity == Complexity.Simple )
      {
        return 'Simple';
      }
      if( complexity == Complexity.Challenging )
      {
        return 'Challenging';
      }
      if( complexity == Complexity.Hard )
      {
        return 'Hard';
      }

      return 'Unkonwn';
    }
    String get getAffordability
    {

      if( affordability == Affordability.Affordable )
      {
        return 'Affordable';
      }
      if( affordability == Affordability.Pricey )
      {
        return 'Pricey';
      }
      if( affordability == Affordability.Luxurious )
      {
        return 'Luxurious';
      }

      return 'Unkonwn';
    }

    void selectMeal(BuildContext context)
    {
      Navigator.of(context).pushNamed(MealDetailsScreen.routName,arguments: id );
    }




  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: ()=> selectMeal(context),

      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),


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
            ),

            Padding(
              padding: EdgeInsets.all(10),
            
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [

                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 5,),
                        Text('$duration min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 5,),
                        Text(getComplexity),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 1,),
                        Text(getAffordability),
                      ],
                    ),


                ],

              ),
            
            
            
            ),


          ],
        ),



      ),



    );
  }
}
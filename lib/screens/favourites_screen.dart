import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text("Favourites List is Empty!!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            padding: EdgeInsets.all(10),
            // child: Text(favouriteMeals[index].title),
            child: MealItem(
                id: favouriteMeals[index].id,
                title: favouriteMeals[index].title,
                imageUrl: favouriteMeals[index].imageUrl,
                affordability: favouriteMeals[index].affordability,
                complexity: favouriteMeals[index].complexity,
                duration: favouriteMeals[index].duration),
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}

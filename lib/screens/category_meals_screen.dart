import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meal';

  // final String categoryId;
  // final String title;

  // CategoryMealsScreen(this.categoryId,this.title);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final categoryID = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMealsList = DUMMY_MEALS.where((meal){

      return meal.categories.contains(categoryID);

    } ).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
              padding: EdgeInsets.all(10),
              // child: Text(categoryMealsList[index].title),
              child: MealItem( id: categoryMealsList[index].id,title: categoryMealsList[index].title, imageUrl: categoryMealsList[index].imageUrl, affordability: categoryMealsList[index].affordability, complexity: categoryMealsList[index].complexity, duration: categoryMealsList[index].duration),
            );
          },
          itemCount: categoryMealsList.length,
        ),
      ),
    );
  }
}

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavBar extends NewsStates {}

class NewsGetHomeLoadingState extends NewsStates {}

class NewsGetHomeSuccessState extends NewsStates{}

class NewsGetHomeErrorState extends NewsStates{
  final String error ;
  NewsGetHomeErrorState(this.error);
}

class NewsGetCategoryLoadingState extends NewsStates {}

class NewsGetCategorySuccessState extends NewsStates{}

class NewsGetCategoryErrorState extends NewsStates{
  final String error ;
  NewsGetCategoryErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates{}

class NewsGetSearchErrorState extends NewsStates{
  final String error ;
  NewsGetSearchErrorState(this.error);
}

class NewsChangeThemeModeState extends NewsStates{}



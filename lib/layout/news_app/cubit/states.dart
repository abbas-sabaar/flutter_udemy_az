abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}

class NewsBottomNavBarStates extends NewsStates {}



class NewsGetBusinessLoadingStates extends NewsStates {}

class NewsGetBusinessSuccessStates extends NewsStates {}

class NewsGetBusinessErrorStates extends NewsStates {
  final String error;

  NewsGetBusinessErrorStates(this.error);
}

class NewsGetTechnologyLoadingStates extends NewsStates {}

class NewsGetTechnologySuccessStates extends NewsStates {}

class NewsGetTechnologyErrorStates extends NewsStates {
  final String error;

  NewsGetTechnologyErrorStates(this.error);
}


class NewsGetSportsLoadingStates extends NewsStates {}

class NewsGetSportsSuccessStates extends NewsStates {}

class NewsGetSportsErrorStates extends NewsStates {
  final String error;

  NewsGetSportsErrorStates(this.error);
}



class NewsGetSearchLoadingStates extends NewsStates {}

class NewsGetSearchSuccessStates extends NewsStates {}

class NewsGetSearchErrorStates extends NewsStates {
  final String error;

  NewsGetSearchErrorStates(this.error);
}




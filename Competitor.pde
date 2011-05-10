class Competitor {
    int points;
    int advantages;
    int penalties;
    
    void init() {
      points = 0;
      advantages = 0;
      penalties = 0;
    }
    
    void changePoints(int num) {
      points += num;
      if (points < 0) points = 0;
    }
    
    void changeAdvantages(int num) {
      advantages += num;
      if (advantages < 0) advantages = 0;
    }
    
    void changePenalties(int num) {
      penalties += num;
      if (penalties < 0) penalties = 0;
    }
    
    int getPoints() {
      return points;
    }
    
    int getAdvantages() {
      return advantages;
    }
    
    int getPenalties() {
      return penalties;
    }
};

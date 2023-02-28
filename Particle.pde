class Particle{
  PVector pos;
  PVector vel;
  PVector acc;
  int age;
  int sparkle_time;
  int sparkle;
  float Hue;
  
  Particle(float X, float Y, float H, int S){
    pos = new PVector(X,Y);
    vel = PVector.random2D();
    vel.mult(random(2,5));
    acc = new PVector(0,0);
    age = 255;
    sparkle_time = S;
    sparkle = int(random(sparkle_time));
    Hue = H;
  }
  
  void update(){
    acc.add(new PVector(0,gravity/2));
    
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
    age -= 255/fade_time;
    sparkle ++;
  }
  
  void show(){
    if(sparkle>=sparkle_time/2){
      strokeWeight(2);
      stroke(Hue, 255, 255, age);
      point(pos.x,pos.y);
      if (sparkle == sparkle_time){
        sparkle = 0;
      }
    }
  }
}

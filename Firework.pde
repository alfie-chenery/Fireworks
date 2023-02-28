class Firework{
  PVector pos;
  PVector vel;
  PVector acc;
  boolean show;
  int sparkle_time;
  float Hue;
  ArrayList<Particle> particles;
  
  Firework(float X){
    pos = new PVector(X,height);
    vel = new PVector(0,random(-12,-5));
    acc = new PVector(0,0);
    show = true;
    
    sparkle_time = int(random(0,20));
    if(sparkle_override != -1){
      sparkle_time = sparkle_override;
    }
    
    
    particles = new ArrayList<Particle>();
    Hue = random(255);
  }
  
  void update(){
    acc.add(random(-0.15,0.15),gravity); //random sway in x, gravity in y
    
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
    if(vel.y >=0){
      //explode
      if(show){ //only do this once
        for(int i=0; i<random(50,100); i++){
          Particle p = new Particle(pos.x, pos.y, Hue, sparkle_time);
          particles.add(p);
        }
      }
      show = false;
    }
  }
  
  void show(){
    if(show){
      strokeWeight(3);
      stroke(Hue, 255, 255);
      point(pos.x, pos.y);
    }
    
    for(Particle p : particles){
      p.update();
      p.show();
    }
  }
  
  
  boolean finished(){
    if(show == true){
      return false; 
    }else{
      boolean result = true;
      for (Particle p : particles){
        if (p.age > 0){
          result = false;
        }
      }
      return result;
    }
  }
}

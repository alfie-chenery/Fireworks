float gravity = 0.1;
int sparkle_override = -1; //Override time period of sparkle cycle
                           //if 0 force no sparkle
                           //if -1 randomly generate per firework
int fade_time = 100; //number of frames to fade completly
boolean trail = true;
float chance = 0.01;

ArrayList<Firework> fireworks;

void setup(){
  size(800,800);
  //fullScreen();
  colorMode(HSB,255);
  fireworks = new ArrayList<Firework>();
  background(0);

}

float[]chanceMap = {0,0.002,0.005,0.01,0.02,0.05,0.1,0.2,0.5,1};
void keyPressed(){
  int Key = int(key) - int('0');
  if(Key < 0 || Key > 9){
    Key = 3; //arbitrary choice 
  }
  chance = chanceMap[Key];
  
  
}

void mouseClicked(){
  Firework f = new Firework(mouseX);
  fireworks.add(f); 
}

void draw(){
  if(trail){
    noStroke();
    fill(0,10);
    rect(0,0,width,height);
  }else{
    background(0); 
  }
  
  float choice = random(1);
  if(choice < chance){
    Firework f = new Firework(random(width));
    fireworks.add(f); 
  }
  
  for(int i = fireworks.size()-1; i>=0; i--){ //itterate backwars from end to avoid missing items when one is removed
    fireworks.get(i).update();
    fireworks.get(i).show();
    
    if(fireworks.get(i).finished()){
      fireworks.remove(i); 
    }
  }
}

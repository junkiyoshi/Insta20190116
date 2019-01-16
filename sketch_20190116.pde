// Variable
int len;
ArrayList<PVector> locations;
IntList seeds;

void setup(){
  
  // Initialize 
  size(720, 720);
  frameRate(25);
  stroke(255);
  strokeWeight(2);
  colorMode(HSB);
  blendMode(ADD);
  
  // Initialize Variable
  len = 144;
  locations = new ArrayList<PVector>();
  seeds = new IntList();
  for(int y = len / 2; y < height; y += len){
    
    for(int x = len / 2; x < width; x += len){
       
      locations.add(new PVector(x, y));
      seeds.append((int)random(1000));
    }
  }
}

void draw(){
  
  background(0);
  
  for(int i = 0; i < locations.size(); i++){

    // Draw Rectangle
    for(int n = 0; n < 3; n++){
    
      fill(random(255), 255, 255, 200);
      
      int start_param = (int)random(100);
      int end_param = start_param + (int)random(30, 70);
      
      beginShape();
      for(int param = start_param; param < end_param; param++){
        
        PVector location = make_point(len * 0.9, param);
        location.add(locations.get(i));
        vertex(location.x, location.y);
      }
      endShape(CLOSE);
    }
    
    // Update seed value 
    if(frameCount % locations.size() == i){
      
      seeds.set(i, frameCount);
    }
    randomSeed(seeds.get(i));
  }
}

PVector make_point(float len, int param){
 
  param = param % 100;
  if(param < 25){
    
    return new PVector(map(param, 0, 25, -len * 0.5, len * 0.5), -len * 0.5);
    
  }else if(param < 50){
    
    return new PVector(len * 0.5, map(param, 25, 50, -len * 0.5, len * 0.5));
    
  }else if(param < 75){
    
    return new PVector(map(param, 50, 75, len * 0.5, -len * 0.5), len * 0.5);
  }else{
   
    return new PVector(-len * 0.5, map(param, 75, 100, len * 0.5, -len * 0.5));
  }
}

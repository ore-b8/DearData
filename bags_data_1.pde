String [] rawData;
String [][]data;
String selectedPlace = "All";
float bagSize=20;

void setup() {
  size(1000, 1000);

  background(220);

  rawData = loadStrings ("myData.csv");

  data = new String[rawData.length][];

  for (int i=0; i<rawData.length; i++) {

    String [] dataItems = split(rawData[i], ",");

    data[i] = new String[dataItems.length];

    for (int d=0; d<dataItems.length; d++) {
      data[i][d] = dataItems[d];
    }
  }
}
void draw () {
background(220);

  for (int i=0; i<rawData.length; i++) {
    if (data[i].length<4) {
      continue;
    }

    float x;
    
    float rowSpacing = (float) height / data.length;
    float y = rowSpacing * (i + 0.5);

     String place = trim(data[i][0]);
     if(!selectedPlace.equals("All") &&
     !place.startsWith(selectedPlace)){
       continue;
     }
     
    String bagColour = trim(data[i][2]);
    String bagType =  trim(data[i][1]);
    String bagSizeCategory = trim(data[i][3]);
    
    if(bagSizeCategory.equals("Small")){
      bagSize = 15;
    } else if (bagSizeCategory.equals("Medium")){
      bagSize=25;
    } else if (bagSizeCategory.equals("Large")){
      bagSize = 35;
    }

    color fillColour = color(255);

    if (bagColour.equals("Blue")) {
      fillColour = color(21, 50, 158);
    } else if (bagColour.equals("Black")) {
      fillColour = color(10, 10, 10);
    } else if (bagColour.equals("Brown")) {
      fillColour = color(157, 100, 14);
    } else if (bagColour.equals("Beige")) {
      fillColour = color(240, 232, 211);
    } else if (bagColour.equals("Green")) {
      fillColour = color(25, 90, 7);
    } else if (bagColour.equals("Grey")) {
      fillColour = color(191, 189, 187);
    } else if (bagColour.equals("Purple")) {
      fillColour = color(209, 153, 227);
    } else if (bagColour.equals("Yellow")) {
      fillColour = color(245, 227, 64);
    } else if (bagColour.equals("Pink")) {
      fillColour = color(229, 97, 146);
    } else if (bagColour.equals("N/A")) {
    } if (bagColour.equals("N/A")){
     noFill();
    } else {
      fill(fillColour);
    }
  

    stroke(50);
   

    if (bagType.equals("Tote bag")) {
      ellipse(x, y, bagSize, bagSize);
    } else if (bagType.equals("Backpack")) {
      rectMode(CENTER);
      rect(x, y, bagSize, bagSize);
    } else if (bagType.equals("Shoulder bag")) {
      triangle(
        x, y - bagSize / 2,
        x - bagSize / 2, y + bagSize / 2,
        x + bagSize / 2, y + bagSize / 2
        );
    } else if (bagType.equals("Shopping bag")) {
      quad( x, y - bagSize/2,
        x + bagSize/2, y,
        x, y + bagSize/2,
        x - bagSize/2, y
        );
    }
  }
}

void keyPressed(){
  
  if (key == 's'){
    selectedPlace = "Street";
  }
  else if (key == 'c'){
    selectedPlace = "Campus";
  } 
  else if (key == 'p'){
    selectedPlace = "Public transport";
  }
  else if (key == 'r'){
    selectedPlace = "Cafe";
  } 
  else if (key == '0'){
    selectedPlace = "All"; 
  }
}
  

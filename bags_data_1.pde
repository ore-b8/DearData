String [] rawData;
String [][]data;
float bagSize=20;

void setup() {
  size(1000, 1000);
  
  background(220);

  rawData = loadStrings ("rawData.txt");

  data = new String[rawData.length][];

  for (int i=0; i<rawData.length; i++) {

    String [] dataItems = split(rawData[i], "|");

    data[i] = new String[dataItems.length];

    for (int d=0; d<dataItems.length; d++) {
      data[i][d] = dataItems[d];

   
 
}
  }
}
void draw () {
  

  for (int i=0; i<rawData.length; i++) {
    if (data[i].length<=2) {
      continue;
    }
    
    float x = bagSize * 1.5;
    float rowSpacing = (float) height / data.length;
    float y = rowSpacing * (i + 0.5);
    
     String place = trim(data[i][0]);
      String bagColour = trim(data[i][2]);
      String bagType =  trim(data[i][1]);
    
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
      } else if (bagColour.equals("Black")) {
        fillColour = color(10, 10, 10);
      } else if (bagColour.equals("Purple")) {
        fillColour = color(123, 44, 147);
      } 
      
     

    fill(32, 128);
    text(place, bagSize*2.5, y);
    fill(fillColour);
    stroke(50);

    if (bagType.equals("Tote bag")){
      ellipse(x,y,bagSize,bagSize);
    } else if (bagType.equals("Backpack")){
      rectMode(CENTER);
      rect(x,y,bagSize,bagSize);
    } else if(bagType.equals("Shoulder bag")){
      triangle( 
      x, y - bagSize / 2,
        x - bagSize / 2, y + bagSize / 2,
        x + bagSize / 2, y + bagSize / 2
      );
      
     
        }
      }
    }
 

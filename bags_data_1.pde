String [] rawData;
String [][]data;
float bagSize=20;

void setup() {
  size(1000,1000);
  textAlign(LEFT);
  textSize(18);
  ellipseMode(CENTER);

  rawData = loadStrings ("rawData.txt");

  data = new String[rawData.length][];

  for (int i=0; i<rawData.length; i++) {

    String [] dataItems = split(rawData[i], "|");

    data[i] = new String[dataItems.length];

    for (int d=0; d<dataItems.length; d++) {
      data[i][d] = dataItems[d];

      println (i, d, dataItems[d]);
    }
  }
}
void draw () {
  background(220);

  for (int i=0; i<rawData.length; i++) {
    float x = bagSize * 1.5;
    float rowSpacing = (float) height / data.length;
    float y = rowSpacing * (i + 0.5);
    float circleSize = min(30, rowSpacing * 0.6);

    String place = trim(data[i][0]);

    if (data[i].length<=2) {
      continue;
    }
    fill(32, 128);
    text(place, bagSize*2.5, y);


    for (int d = 2; d < 3; d++) {
      String bag = trim(data[i][2]);
      color fillColour = color(255);
      boolean weHaveData = true;

      if (bag.equals("Blue")) {
        fillColour = color(21, 50, 158);
      } else if (bag.equals("Black")) {
        fillColour = color(10, 10, 10);
      } else if (bag.equals("Brown")) {
        fillColour = color(157, 100, 14);
      } else if (bag.equals("Beige")) {
        fillColour = color(240, 232, 211);
      } else if (bag.equals("Green")) {
        fillColour = color(25, 90, 7);
      } else if (bag.equals("Grey")) {
        fillColour = color(191, 189, 187);
      } else if (bag.equals("Purple")) {
        fillColour = color(209, 153, 227);
      } else if (bag.equals("Black")) {
        fillColour = color(10, 10, 10);
      }else if (bag.equals("Purple")) {
        fillColour = color(123,44,147);
      } else weHaveData = false;


      if (weHaveData) {
        noStroke();
        fill(fillColour);
        circle(x, y, bagSize);


        // Detect when the mouse is over a circle
        if (dist(mouseX, mouseY, x, y) < bagSize ) {
          stroke(32, 128);
          fill(220);
          circle(x, y, circleSize );

        }
      }
      
      }
    }
  }

import processing.pdf.*; 

Table table;
String[] land = new String[0];
int[] basis = new int[0];
int[] loon = new int[0];
int[] vermogen = new int[0];
  
int delen = 500;
  
  void setup() {
    size(600, 600);
    beginRecord(PDF, "GenerativeLogo5.pdf");
    background(255);
    smooth();
    noStroke();
    colorMode(RGB, 255, 255, 255, 100);
  
    //table = loadTable("Dataset_csv.csv", "header");
    table = loadTable("Dataset1_csv.csv", "header");
  
    loadLand();

    drawVermogen();
    drawLoon();
    drawBasis();

  }

    void loadLand() {
      for (TableRow row : table.rows ()) {
        land = append(land, row.getString("land"));
        basis = append(basis, row.getInt("basis"));
        loon = append(loon, row.getInt("loon"));
        vermogen = append(vermogen, row.getInt("vermogen"));
      }
    }
    
    void drawVermogen() {                                  //blauw
      for (int i=0; i<vermogen.length; i++) {
       // if (i == 34) {
          fill(230, 190, 100, 75);
          beginShape();
          vertex(width/2-200, height/2-10);    
          vertex(width/2, (height/2)-(vermogen[i]/delen)-35);    //midden boven
          vertex(width/2+200, height/2-10);
          vertex(width/2, (height/2)-(vermogen[i]/delen)-10);       //midden onder
          vertex(width/2-200, height/2-10);    
          endShape(CLOSE);
        }
     // }
     
    }
         void drawLoon() {                                        //groen
      for (int i=0; i<loon.length; i++) {
       // if (i == 34) {
          fill(70, 245, 175, 100);
          triangle(width/2-200, height/2, width/2, height/2-loon[i]/delen, width/2+200, height/2);
        }
      }
    
    void drawBasis() {                                         //rood
      for (int i=0; i<basis.length; i++) {
        //if (land.length == 0) {
          fill(150, 75, 60, 100);
          triangle(width/2-200, height/2+10, width/2, height/2+basis[i]/delen, width/2+200, height/2+10);
        }
              endRecord();
      }



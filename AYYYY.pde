

//Title: Cookie Goes to College
//Team Name: PROgrammers
//Class: COMP 101Y (Impact)
//Team Members: Joshua Sanchez, Suha Forshori, Deborah Miller, Hunter Currey, and Kyle Thomas

//Images of buildings and background
PImage instructions;
PImage fratHouse;
PImage lockedFratHouse;
PImage rac;
PImage library;
PImage commons;
PImage dorm;
PImage work;
PImage dHall;
PImage school;
PImage grass3;
PImage coconut;
PImage cookie1;
PImage ned;

//Building unlock vairables
int dormOpen = 1;
int schoolOpen = 1;
int dHallOpen = 1;
int libraryOpen = 1;
int commonsOpen = 1;
int racOpen = 1;
int workOpen = 1;

//Choices and experience unlockables
int squirrelOpen = 1;
int fratHouseOpen = 1;
int deanlistOpen = 0;
int clubOpen = 0 ;
int interviewOpen = 0;

//squirel and Cookie Animations
PImage[] Sprite = new PImage [13];
PImage[] Sprite2 = new PImage [13];
int frame;
int frame2;
int cookieX = (1920/2);
int cookieY = 200;
int squirrelX ;
int squirrelY ;
String filename;
String filename2;

//Week and progress tracking stats
int hours = 168;
int week = 1;
int[] Grades = new int[16];
int experience = 0;
int workEthic = 0;
int hLevel = 50;
int wLevel = int((random(60, 80)));
int gLevel = 0;
int Chance;


void setup() {
  size(1920, 1080);
  imageMode(CENTER);
  //Loads the images used for each picture
  instructions = loadImage ("Instructions.png");
  fratHouse  = loadImage ("frat_unlocked.png");
  lockedFratHouse = loadImage ("frat_locked.png");
  rac = loadImage ("RAC.png");
  library = loadImage ("library.png");
  commons = loadImage ("commons.png");
  dorm = loadImage ("Dorm.png");
  work = loadImage ("work.png");
  dHall = loadImage ("Dhall.png");
  school = loadImage ("school.png");
  grass3 = loadImage("grass3.png");
  coconut = loadImage ("coconut.png");
  cookie1 = loadImage ("cookie1.jpg");
  ned = loadImage ("ned.png");
  loadImages();
}

void draw() {

  //if the amount of milliseconds is less than 0 run instructions function
  if (millis() < 3000) {
    instructions();
  } else {
    background(grass3);
    rectMode(CORNER);
    happiness();
    wealth();
    grade();
    noStroke();
    rectMode(CENTER);
    backGround();
    makeCookie();
    cookieMove();
    trapCookie();
    hours();
    dorm();
    school();
    work();
    library();
    rac();
    dHall();
    commons();
    fratHouse();
    if ((week == 3||week == 5|| week ==8) && (squirrelOpen == 1)) {
      moveSquirrel();
      makeSquirrel();
      squirrelPrompt();
    }
    week();
    weekSummary();
    gameOver();
    developerSkips();
  }
}
//creates a game over function
//all of the game over states (when either happiness, wealth, or grades gets to zero

//creates a screen that tells player how to play game
void instructions() {

  //displays image of instructions
  image (instructions, width/2, height/2, 1000, 500);
  image (cookie1, width -200, height/2, 500,500);
}

//Creates a blue bar that shows the player's happiness level
void happiness() {
  fill(34, 200, 34);
  stroke(0, 0, 255);
  rect(1600, 950, 75, -400);
  noStroke();
  fill(0, 0, 255);
  rect(1600, 950, 75, -hLevel * 4);
  text("H", 1600 +25, 990);
}

void wealth() {
  fill(34, 200, 34);
  stroke(147, 0, 189);
  rect(1600 + 75, 950, 75, -400);
  noStroke();
  fill(147, 0, 289);
  rect(1600 + 75, 950, 75, -wLevel * 4);
  text("W", 1600 + 100, 990);
}
//Creates a red bar that shows the player's grade level
void grade() {

  fill(34, 200, 34);
  stroke(255, 0, 0);
  rect(1600 + 150, 950, 75, -400);
  noStroke();
  fill(255, 0, 0);
  rect(1600 + 150, 950, 75, -Grades[week-1] * 4 );
  text("G", 1600 + 175, 990);
}

//Roads connecting all paths, sprite can only move on this
void backGround() {

  fill(246, 209, 141);
  noStroke();
  quad(290, 180, 290, 230, 570, 400, 800, 450);//rac to d hall
  rect(900, 175, 1100, 50);//rac to library
  rect(1280, 299, 50, 300);//library to dorm
  rect(900, 600, 50, 350);// dorm to school
  quad(650, 400, 650, 450, 1100, 500, 1100, 450);// dhall to dorm
  rect(600, 620, 50, 560);// d hall to school
  rect(1200, 650, 50, 400);//dorm to commons
  rect(180, 500, 50, 700); //rac to frat NEEDS TO BE ADJUSTED
  rect(1390, 500, 50, 700); //library to commons NEEDS TO BE ADJUSTED
  rect(415, 550, 420, 50);// D hall to frat
  rect(415, 880, 300, 50);//frat to school
  rect(1410, 450, 80, 50);// to pool
  rect(1000, 880, 200, 50);//commons to school
}

void loadImages() {

  for (int i = 0; i < 13; i++) {

    // loads the pngs cookie step 1- 12
    filename = "cookie step " + nf(i) + ".png";

    Sprite[i] = loadImage (filename);

    filename2 = "squirrel" + nf(i) + ".gif";

    Sprite2[i] = loadImage (filename2);
  }
}


void makeCookie() {

  if (frame < 12) {

    //print(filename);
    //moves to the next frame
    frame = (frame + 1) % 13;
    if ((keyCode == RIGHT) || (key == 'd') || (key == 'D')) {

      pushMatrix();
      scale(-1.0, 1.0);
      //image(img,-img.width,0);



      image(Sprite[frame], -cookieX, cookieY, 200, 200);
      popMatrix();
    } else {
      image(Sprite[frame], cookieX, cookieY, 200, 200);
    }
  } else {
    //loops back to frame 0 of the animation
    frame = 0;
  }
}

void makeSquirrel() {

  if (frame2 < 12) {

    //print(filename);
    //moves to the next frame2
    frame2 = (frame2 + 1) % 13;
    if (cookieX > squirrelX) {
      pushMatrix();
      scale(-1.0, 1.0);

      image(Sprite2[frame2], -squirrelX, squirrelY, 50, 50);
      popMatrix();
    } else {      
      image(Sprite2[frame2], squirrelX, squirrelY, 50, 50);
    }
  } else {
    //loops back to frame2 0 of the animation
    frame2 = 0;
  }
}


//Moves cookie using the arrow keys
void cookieMove() {

  //if a key is pressed do the following
  if (keyPressed == true) {

    //if arrow up is pressed move up
    if (keyCode == UP) {
      cookieY -= 25;
    }

    //if arrow down is pressed move down
    if (keyCode == DOWN) {
      cookieY += 25;
    }

    //if left arrow is pressed move left
    if (keyCode == LEFT) {
      cookieX -= 25;
    }

    //if right arrow is pressed move right
    if (keyCode == RIGHT) {
      cookieX += 25;
    } else if ( key== 'w' || key== 'W' || key== 's' || key== 'S' || key== 'a' || key== 'A' || key== 'd' || key== 'D' ) {

      //if w is pressed move up
      if (key== 'w' || key== 'W') {
        cookieY -= 25;

        //if s is pressed move down
      }
      if (key== 's' || key== 'S') {
        cookieY += 25;

        //if a is pressed move left
      }
      if (key== 'a' || key== 'A') {
        cookieX -= 25;

        //if d is pressed move right
      }
      if (key== 'd' || key== 'D') {
        cookieX += 25;
      }
    }
  }
}

void moveSquirrel() {
  //checks x value of mouse
  if (cookieX > squirrelX) {
    squirrelX += 10;
  } else {  
    squirrelX -= 10;
  }
  //checks y value of mouse
  if (cookieY > squirrelY) {
    squirrelY += 10;
  } else {  
    squirrelY -= 10;
  }
}
void squirrelPrompt() {
  float collison = sqrt(sq(squirrelX - cookieX) + sq(squirrelY - cookieY));
  if (collison <= 30) {
    rect(cookieX, cookieY, 500, 500);
    fill(255);
    textSize(32);
    if (week == 3) {
      text("A squirrel runs up to cookie \ncarrying a flyer to Involvement Fest \n(Today) Do You...", cookieX - 235, cookieY - 200);
    } else if (week == 5) {
      text("A squirrel runs up to cookie \ncarrying a flyer to Carrierfair \n(Today) Do You...", cookieX - 235, cookieY - 200);
    } else if (week == 8) {
      text("A squirrel runs up to cookie \ncarrying a flyer to a Carnival \n(Today) Do You...", cookieX - 235, cookieY - 200);
    }

    //left option
    int leftX = cookieX - 100;
    int leftY = cookieY - 40;
    rect(leftX, leftY, 150, 110);
    fill(0);
    if (week == 3) {
      text("Attend \nfest", leftX - 70, leftY - 10);
    }
    if (week == 5) {
      text("Go to \nfair", leftX - 70, leftY - 10);
    }
    if (week == 8) {
      text("Study \nat dorm", leftX - 70, leftY - 10);
    }



    //what happens if the left option is pressed
    if (mousePressed && mouseX > leftX - 75 && mouseX < leftX + 75
      && mouseY > leftY - 65 && mouseY < leftY + 65) {
      //calculations take place
      mousePressed = false;
      hours -= 2;
      experience += 7 ;
      workEthic += 5;
      hLevel += 1 ;

      if (week == 3) {
        clubOpen = 1;
      }
      if (week == 5) {
        interviewOpen = 1;
      }
      if (week == 8) {
        deanlistOpen = 1;
      }

      //squirrelOpen is set to zero,
      //not allowing you to continue answering questions from this 
      //same is true when any button is pressed by every building
      squirrelOpen =0;
    }

    //right option
    int rightX = cookieX + 100;
    int rightY = cookieY - 40;
    fill(255);
    rect(rightX, rightY, 150, 110);
    fill(0);
    if (week == 3) {
      text("Go for \na bit", rightX - 80, rightY - 10);
    }
    if (week == 5) {
      text("Show up \nlater", rightX - 80, rightY - 10);
    }
    if (week == 8) {
      text("Go on \nrides", rightX - 80, rightY - 10);
    }

    //button feature
    if (mousePressed && mouseX > rightX - 75 && mouseX < rightX + 75
      && mouseY > rightY - 65 && mouseY < leftY + 65) {

      //calculations
      mousePressed = false;
      hours -= 2;
      hLevel += 2;
      wLevel -= 1;
      squirrelOpen =0;
    }

    //bottom option
    int bottomX = cookieX;
    int bottomY = cookieY + 120;
    fill(255);// fills rect to white
    rect(bottomX, bottomY, 170, 130);// places rectangle using bottomX and bottomY
    fill(0);// fills text to black
    if (week == 3) {
      text("Throw the \nflyer out", bottomX - 70, bottomY -20);
    }
    if (week == 5) {
      text("Party \ninstead", bottomX - 70, bottomY - 20);
    }
    if (week == 8) {
      text("Go to \n carnival", bottomX - 70, bottomY - 20);
    }



    //button features
    if (mousePressed && mouseX > bottomX - 85 && mouseX < bottomX + 85
      && mouseY > bottomY - 65 && mouseY < bottomY + 65) {

      //calculations
      hours -= 2;
      hLevel += 7;
      wLevel -= 2;
      squirrelOpen =0;
    }
  }

  //after user has answered the question,
  //this pop-up displays on top of the first one
}


void trapCookie() {

  if (cookieY > height-65) {
    cookieY = height-65;
  }
  if (cookieY < 0 + 35) {
    cookieY = 35;
  }
  if (cookieX > width-20) {
    cookieX = width-20;
  }
  if (cookieX < 0 + 20) {
    cookieX = 20;
  }
}

//Shows number of hours left in the week located in upper right corner
void hours() {

  fill(255);
  textSize(32);
  text("Hours: " + hours, width-300, 100);
}

//creates dorm and following functionality
void dorm() {

  //dorm location
  int boxX = width/2 + 100;
  int boxY = height/2 - 50;
  fill(0);

  //dorm image
  image(dorm, boxX, boxY, 600, 180);

  //equation to see if Cookie is near dorm
  float dist = sqrt((boxX - cookieX) * (boxX - cookieX) + (boxY - cookieY) * (boxY - cookieY));

  //if Cookie is near dorm, the pop-up appears
  if (dist <= 100 && dormOpen == 1) {

    //pop-up box
    rect(boxX, boxY, 500, 500);
    fill(255);
    textSize(32);
    text("Sleep cycle: how long do you \nsleep everynight for the week?", boxX - 235, boxY - 200);

    //left option
    int leftX = boxX - 100;
    int leftY = boxY - 40;
    rect(leftX, leftY, 150, 130);
    fill(0);
    text("Less than \n 8 hours", leftX - 70, leftY - 10);

    //what happens if the left option is pressed
    if (mousePressed && mouseX > leftX - 75 && mouseX < leftX + 75
      && mouseY > leftY - 65 && mouseY < leftY + 65) {
      //calculations take place
      mousePressed = false;
      hours -= 56;
      workEthic += 13;
      hLevel -= 5;

      //dormOpen is set to zero,
      //not allowing you to continue answering questions from this building
      //same is true when every button is pressed by every building
      dormOpen = 0;
    }

    //right option
    int rightX = boxX + 100;
    int rightY = boxY - 40;
    fill(255);
    rect(rightX, rightY, 150, 130);
    fill(0);
    text("  Over \n 10 hours", rightX - 80, rightY - 10);

    //button feature
    if (mousePressed && mouseX > rightX - 75 && mouseX < rightX + 75
      && mouseY > rightY - 65 && mouseY < leftY + 65) {

      //calculations
      mousePressed = false;
      hours -= 70;
      hLevel += 9;
      dormOpen = 0;
    }

    //bottom option
    int bottomX = boxX;
    int bottomY = boxY + 120;
    fill(255);// fills rect to white
    rect(bottomX, bottomY, 170, 130);// places rectangle using bottomX and bottomY
    fill(0);// fills text to black
    text("Average \n 9 hours", bottomX - 70, bottomY -20);// shows where text is placed

    //button features
    if (mousePressed && mouseX > bottomX - 85 && mouseX < bottomX + 85
      && mouseY > bottomY - 65 && mouseY < bottomY + 65) {

      //calculations
      hours -= 63;
      workEthic +=8;
      dormOpen = 0;
    }
  }

  //after user has answered the question,
  //this pop-up displays on top of the first one
  if (dist <= 100 && dormOpen == 0) {
    rect(boxX, boxY, 500, 500);
    textSize(36);
    fill(0, 255, 0);
    text("Answer recorded \nmove cookie to answer \nanother question", boxX - 170, boxY - 80);
  }
}

//Shows picture of school, and further procedures run
void school() {
  int boxX = 700;
  int boxY = height - 300;

  // Get a random element from an array
  //reason to ditch one class
  String[] optionsA = { "sleeeeeep", "hunger", "a break", "why not" };


  //random reason for ditching class
  String[] optionsB = { " and \ngo to the mall", "and \ngo to a sports \ngame", 
    "just 'cause", " for a me day" };


  //school building
  image(school, 750, height - 300, 540, 440);
  float dist = sqrt((boxX - cookieX) * (boxX - cookieX) + (boxY - cookieY) * (boxY - cookieY));
  if (dist <= 200 && schoolOpen == 1) {
    rect(boxX, boxY, 500, 500);
    fill(255);
    text("You have 15 hours of class \nthis week \nDo you...", boxX - 235, boxY - 200);

    // creates left option
    int leftX = boxX - 100;
    int leftY = boxY - 30;
    rect(leftX, leftY, 150, 130);
    fill(0);
    text("Go to \nall class", leftX - 70, leftY - 10);

    //checks if option is selected
    if (mousePressed && mouseX > leftX - 75 && mouseX < leftX + 75
      && mouseY > leftY - 65 && mouseY < leftY + 65) {
      //calculations take place
      mousePressed = false;
      hours -= 15;
      hLevel -= 1;
      workEthic += 20;
      schoolOpen =0;
    }

    //right option
    int rightX = boxX + 100;
    int rightY = boxY - 30;
    fill(255);
    rect(rightX, rightY, 150, 130);
    textSize(24);
    fill(0);

    //depending on the week,
    //different option will show for skipping one class
    if (week > 0 && week <= 4) {
      text("Skip ONE \nclass for\n" + (optionsA[0]), rightX - 50, rightY - 30);
    } else if (week > 4 && week <= 6) {
      text("Skip ONE \nclass for\n" + (optionsA[1]), rightX - 50, rightY - 30);
    } else if (week > 6 && week <= 10) {
      text("Skip ONE \nclass for\n" + (optionsA[2]), rightX - 50, rightY - 30);
    } else if (week > 10 && week <= 15) {
      text("Skip ONE \nclass for\n" + (optionsA[3]), rightX - 50, rightY - 30);
    }
    //button features
    if (mousePressed && mouseX > rightX - 75 && mouseX < rightX + 75
      && mouseY > rightY - 65 && mouseY < rightY + 65) {

      //calculations for a less costly outing
      mousePressed = false;
      hours -= 15;
      workEthic += 17;
      experience ++ ;
      hLevel += 5;
      schoolOpen = 0;
    }

    //bottom option
    int bottomX = boxX;
    int bottomY = boxY + 130;
    fill(255);
    rect(bottomX, bottomY, 170, 150);
    fill(0);

    //depending on the week,
    //different options are displayed for taking off for the day
    if (week > 0 && week <= 4) {
      text("Take off for \nthe DAY " + (optionsB[0]), bottomX - 80, bottomY - 20);
    } else if (week > 4 && week <= 8) {
      textSize(20);
      text("Take off for \nthe DAY " + (optionsB[1]), bottomX - 80, bottomY - 30);
    } else if (week > 8 && week <= 12) {
      text("Take off for \nthe DAY " + (optionsB[2]), bottomX - 80, bottomY - 20);
    } else if (week > 12 && week <= 15) {
      text("Take off for \nthe DAY " + (optionsB[3]), bottomX - 80, bottomY - 20);
    }

    //button features
    if (mousePressed && mouseX > bottomX - 85 && mouseX < bottomX + 85
      && mouseY > bottomY - 65 && mouseY < bottomY + 65) {

      //calculations for an EXPENSIVE outing
      mousePressed = false;
      hours -= 15;
      hLevel += 7;
      workEthic += 15;
      wLevel -= 3;
      experience += 2;
      schoolOpen = 0;
    }
  }

  //once a button has been clicked this happens
  if (dist <=200 && schoolOpen == 0) {
    rect(boxX, boxY, 500, 500);
    textSize(36);
    fill(0, 255, 0);
    text("Answer recorded \nmove cookie to answer \nanother question", boxX - 170, boxY - 80);
  }
}

//library building
void library() {
  int boxX = width - 580;
  int boxY = 155;

  //library image
  image(library, boxX, boxY, 320, 260);

  //formula for detecting if Cookie is by this building
  float dist = sqrt((boxX - cookieX) * (boxX - cookieX) + (boxY - cookieY) * (boxY - cookieY));

  //if Cookie is by building and hasn't answered questions yet
  if (dist <= 200 && libraryOpen == 1) {
    fill (0);

    //pop-up box
    rect(boxX, boxY + 100, 500, 500);
    fill(255);
    text("Time to answer some \nimportant questions! \nDo you...", boxX - 235, boxY - 100);

    //left option
    int leftX = boxX - 100;
    int leftY = boxY + 80;
    rect(leftX, leftY, 160, 140);
    fill(0);
    text("Surf the \nweb", leftX - 60, leftY - 20);

    //button feature
    if (mousePressed && mouseX > leftX - 75 && mouseX < leftX + 75
      && mouseY > leftY - 65 && mouseY < leftY + 65) {

      //calculations take place
      hours -= 10 ;
      hLevel += 3 ;
      experience += 2 ;
      libraryOpen = 0 ;
    }

    //right option
    int rightX = boxX + 100;
    int rightY = boxY + 80;
    fill(255);
    rect(rightX, rightY, 160, 140);
    fill(0);
    textSize(30);
    text("Study alone \n with music", rightX - 85, rightY - 20);

    //button features
    if (mousePressed && mouseX > rightX - 75 && mouseX < rightX + 75
      && mouseY > rightY - 65 && mouseY < leftY + 65) {

      //calculations
      hours -= 10 ;
      hLevel += 1 ;
      workEthic += 6;
      libraryOpen = 0 ;
    }

    //bottom option
    int bottomX = boxX;
    int bottomY = boxY + 260;
    fill(255);
    rect(bottomX, bottomY, 160, 140);
    fill(0);
    textSize(32);
    text("Study \ngroup", bottomX - 60, bottomY - 10);

    //button features
    if (mousePressed && mouseX > bottomX - 85 && mouseX < bottomX + 85
      && mouseY > bottomY - 65 && mouseY < bottomY + 65) {

      //calculations
      hours -= 10 ;
      hLevel += 2;
      wLevel -= 2 ;
      workEthic += 5 ;
      libraryOpen = 0 ;
    }
  }

  //once an answer has been selected,
  //user can no longer choose another option
  //until the week resets
  if (dist <= 200 && libraryOpen == 0) {

    rect(boxX, boxY, 500, 500);
    textSize(36);
    fill(0, 255, 0);
    text("Answer recorded \nmove cookie to answer \nanother question", boxX - 170, boxY + 20);
  }
}

// This function gives the choices for the player
//once they reach the dining hall
void dHall() {
  int boxX = 530 ;
  int boxY = 380 ;

  //image of dhall being called
  image(dHall, boxX, boxY, 460, 260);

  //distance formula to detect if the
  //sprite/player’s location is in the bounds of dhall
  float dist = sqrt((boxX - cookieX) * (boxX - cookieX) + (boxY - cookieY) * (boxY - cookieY));

  // This if statement draws a popup
  //decision once the player gets within 200 pixels of the image
  if (dist <= 200 && dHallOpen == 1) {

    //below is the box that holds the buttons
    rect(boxX, boxY, 500, 500);
    fill(255);
    textSize(24);
    text("How do you choose your \nmeal plan \nDo you...", boxX - 235, boxY - 200);

    //creates left option button
    int leftX = boxX - 100;
    int leftY = boxY - 40;
    rect(leftX, leftY, 150, 130);
    fill(0);
    textSize(28);
    text("Study while \neating a \nlittle", leftX - 70, leftY - 20);

    //Detects if the mouse is in the area button only when clicked
    if (mousePressed && mouseX > leftX - 75 && mouseX < leftX + 75
      && mouseY > leftY - 65 && mouseY < leftY + 65) {

      //calculations take place to score
      hours -= 27 ;
      hLevel -= 2 ;
      wLevel -= 2;
      workEthic += 5 ;
      experience ++ ;

      //Sets dhall as closed
      //for the rest of the week
      dHallOpen = 0;
    }

    //creates right option button
    int rightX = boxX + 100;
    int rightY = boxY - 40;
    fill(255);
    rect(rightX, rightY, 150, 130);
    fill(0);
    text("Eat with \nhomies", rightX - 50, rightY - 20);

    //Detects if the mouse is in the area button only when clicked
    if (mousePressed && mouseX > rightX - 75 && mouseX < rightX + 75
      && mouseY > rightY - 65 && mouseY < leftY + 65) {

      //calculations
      hours -= 27;
      hLevel += 3;
      wLevel -= 3 ;
      workEthic += 3 ;
      experience ++ ;

      //sets dhall as closed
      //until the week resets
      dHallOpen = 0;
    }

    //creates bottom option button
    int bottomX = boxX;
    int bottomY = boxY + 120;
    fill(255);
    rect(bottomX, bottomY, 170, 130);
    fill(0);
    textSize(24);
    text("Fall into a \n relaxing \nfood coma", bottomX - 85, bottomY - 20);

    //Detects if the mouse is in the area button only when clicked
    if (mousePressed && mouseX > bottomX - 85 && mouseX < bottomX + 85
      && mouseY > bottomY - 65 && mouseY < bottomY + 65) {

      //calculations updates score
      hours -= 27;
      hLevel += 5 ;
      wLevel -= 4 ;
      experience += 2 ;

      //sets dhall as closed
      dHallOpen = 0;
    }
  }

  // when the question is answered the new popup
  //will display when the player is within distance
  //telling the user that the question has already been answered
  if (dist <= 200 && dHallOpen == 0) {

    //new pop-up box
    rect(boxX, boxY, 500, 500);
    textSize(36);
    fill(0, 255, 0);
    text("Answer recorded \nmove cookie to answer \nanother question", boxX - 170, boxY - 80);
  }
}

//Shows commons picture and following procedures run
void commons() {

  //pic of commons and location
  int boxX = width - 600;
  int boxY = 800;
  image(commons, boxX, boxY, 440, 240);

  //detects if Cookie is near the commons
  float dist = sqrt((boxX - cookieX) * (boxX - cookieX) + (boxY - cookieY) * (boxY - cookieY));

  //if Cookie is near commons and hasnerres answered questions yet
  if (dist <= 200 && commonsOpen == 1) {
    rect(boxX, boxY, 500, 500);
    fill(255);
    text("You have some free time \nDo you...", boxX - 235, boxY - 200);

    //top left option
    int leftX = boxX - 100;
    int leftY = boxY - 40;
    rect(leftX, leftY, 150, 130);
    fill(0);
    textSize(28);
    text("Go \nshopping \nonline", leftX - 70, leftY - 30);

    //button features
    if (mousePressed && mouseX > leftX - 75 && mouseX < leftX + 75
      && mouseY > leftY - 65 && mouseY < leftY + 65) {

      //calculations take place
      hours -= 4 ;
      hLevel += 3 ;
      wLevel -= 3 ;
      experience ++ ;
      commonsOpen = 0 ;
    }  

    //top right option
    int rightX = boxX + 100;
    int rightY = boxY - 40;
    fill(255);
    rect(rightX, rightY, 150, 130);
    fill(0);
    text("Netflix \nand Chill", rightX - 70, rightY - 10);

    //If one of the options are clicked, the following calculation occur
    if (mousePressed && mouseX > rightX - 75 && mouseX < rightX + 75
      && mouseY > rightY - 65 && mouseY < leftY + 65) {

      hours -= 4 ;
      hLevel += 4 ;
      wLevel -= 4 ;
      commonsOpen = 0 ;
    }

    //bottom right option
    int bottomRightX = boxX + 100;
    int bottomRightY = boxY + 120;
    fill(255);
    rect(bottomRightX, bottomRightY, 150, 130);
    fill(0);
    text("Hang with \nfriends", boxX + 30, boxY + 110);

    //button features
    if (mousePressed && mouseX > bottomRightX - 85 && mouseX < bottomRightX + 85
      && mouseY > bottomRightY - 65 && mouseY < bottomRightY + 65) {

      //calculations
      hours -= 4 ;
      workEthic ++ ;
      hLevel += 3 ;
      wLevel -= 1 ;
      experience ++ ;
      commonsOpen = 0 ;
    }

    //bottom left option
    int bottomLeftX = boxX - 100;
    int bottomLeftY = boxY + 120;
    fill(255);
    rect(bottomLeftX, bottomLeftY, 150, 130);
    fill(0);
    text("Do \nhomework", bottomLeftX - 70, bottomLeftY - 10);

    //button features
    if (mousePressed && mouseX > bottomLeftX - 85 && mouseX < bottomLeftX + 85
      && mouseY > bottomLeftY - 65 && mouseY < bottomLeftY + 65) {

      //calculations
      hours -= 4 ;
      hLevel -= 6 ;
      workEthic += 7 ;
      commonsOpen = 0 ;
    }
  }

  //new pop-up once answer has been selected
  if (dist <= 200 && commonsOpen == 0) {

    rect(boxX, boxY, 500, 500);
    textSize(36);
    fill(0, 255, 0);
    text("Answer recorded \nmove cookie to answer \nanother question", boxX - 170, boxY - 80);
  }
}

//shows the rac and the following interactions occur
void rac() {

  //location and picture of rac
  int boxX = 200;
  int boxY = 200;

  //image of rac
  image (rac, boxX, boxY, 418, 230);
  float dist = sqrt((boxX - cookieX) * (boxX - cookieX) + (boxY - cookieY) * (boxY - cookieY));

  //code for pop-up box and options on it
  if (dist <= 200 && racOpen == 1) {

    //pop-up box
    rect(boxX, boxY + 100, 500, 500);
    fill(255);
    text("Do you even lift?", boxX - 135, boxY - 100);

    //left option
    int leftX = boxX - 100;
    int leftY = boxY + 60;
    rect(leftX, leftY, 150, 130);
    fill(0);
    text("Nah", leftX - 50, leftY);

    //button features
    if (mousePressed && mouseX > leftX - 75 && mouseX < leftX + 75
      && mouseY > leftY - 65 && mouseY < leftY + 65) {

      //calculations take place
      hours -= 4;
      hLevel -= 2;
      workEthic += 5;
      racOpen = 0;
    }

    //right option
    int rightX = boxX + 100;
    int rightY = boxY + 60;
    fill(255);
    rect(rightX, rightY, 150, 130);
    fill(0);
    text("Yeah", rightX - 50, rightY);

    //button features
    if (mousePressed && mouseX > rightX - 75 && mouseX < rightX + 75
      && mouseY > rightY - 65 && mouseY < leftY + 65) {

      //calculations
      hours -= 4 ;
      hLevel += 2 ;
      workEthic += 3 ;
      experience ++ ;
      racOpen = 0 ;
    }
  }

  //new pop-up box
  //once answer has been selected
  if (dist <= 200 && racOpen == 0) {
    rect(boxX, boxY + 90, 500, 500);
    textSize(36);
    fill(0, 255, 0);
    text("Answer recorded \nmove cookie to answer \nanother question", boxX - 170, boxY - 80);
  }
}

//work building
//represented by the pool
void work() {
  int boxX = width - 300;
  int boxY = 420;

  //pool image
  image(work, boxX, boxY, 360, 160);

  //sees if Cookie is near the pool image
  float dist = sqrt((boxX - cookieX) * (boxX - cookieX) + (boxY - cookieY) * (boxY - cookieY));

  //if Cookie is near the pool
  //and hasn't answered a question yet
  if (dist <= 200 && workOpen == 1) {
    rect(boxX, boxY, 500, 500);
    fill(255);
    text("Do you work?", boxX - 235, boxY - 150);

    //left option
    int leftX = boxX - 100;
    int leftY = boxY - 40;
    fill(255);
    rect(leftX, leftY, 150, 130);
    textSize(32);
    fill(0);
    text("Nah", leftX - 50, leftY);

    //button features
    if (mousePressed && mouseX > leftX - 75 && mouseX < leftX + 75
      && mouseY > leftY - 65 && mouseY < leftY + 65) {

      //calculations take place
      hLevel += 2;
      workEthic += 3 ;
      workOpen = 0 ;
    }

    //right option
    int rightX = boxX + 100;
    int rightY = boxY - 40;
    fill(255);
    rect(rightX, rightY, 150, 130);
    fill(0);
    text("Part Time", rightX - 75, rightY);

    //button features
    if (mousePressed && mouseX > rightX - 75 && mouseX < rightX + 75
      && mouseY > rightY - 65 && mouseY < leftY + 65) {

      //calculations
      hours -= 8 ;
      workEthic += 2 ;
      wLevel += 6 ;
      experience ++ ;
      workOpen = 0 ;
    }

    //bottom option
    int bottomX = boxX;
    int bottomY = boxY + 120;
    fill(255);
    rect(bottomX, bottomY, 170, 130);
    fill(0);
    text("Extra Shifts", bottomX - 87, bottomY + 10);

    //button features
    if (mousePressed && mouseX > bottomX - 85 && mouseX < bottomX + 85
      && mouseY > bottomY - 65 && mouseY < bottomY + 65) {

      //calculations
      hours -= 12 ;
      wLevel += 8 ;
      hLevel -= 1 ;
      workEthic ++ ;
      experience += 2 ;
      workOpen = 0 ;
    }
  }

  //if Cookie is near pool and
  //already answered a question
  if (dist <= 200 && workOpen == 0) {
    rect(boxX, boxY, 500, 500);
    textSize(36);
    fill(0, 255, 0);
    text("Answer recorded \nmove cookie to answer \nanother question", boxX - 170, boxY - 80);
  }
}

//frat house building
void fratHouse() {

  int boxX = 200;
  int boxY = height - 200;

  //image locked
  if (experience < 15) {
    image(lockedFratHouse, boxX, boxY, 490, 200);

    //image unlocked
  } else if (experience >= 15) {
    image(fratHouse, boxX, boxY, 490, 200);
  }

  //detects if Cookie is near frat house
  float dist = sqrt((boxX - cookieX) * (boxX - cookieX) + (boxY - cookieY) * (boxY - cookieY));

  //if Cookie is near frat house
  if (dist <= 200 && fratHouseOpen == 1) {

    //pop-up box
    rect(boxX, boxY - 100, 500, 500);

    //pop-up if image is locked
    if (experience < 15) {
      fill(255);
      text("Sorry level locked", boxX - 100, boxY - 100);

      //pop-up if iamge is unlocked
    } else if (experience >= 15) {
      fill(255);
      text("Partayyyy Time!!! \nDo you...", boxX - 135, boxY - 300);

      //left option
      int leftX = boxX - 100;
      int leftY = boxY - 140;
      fill(255);
      rect(leftX, leftY, 150, 130);
      fill(0);
      text("Party \nhard", leftX - 35, leftY);

      //button features
      if (mousePressed && mouseX > leftX - 75 && mouseX < leftX + 75
        && mouseY > leftY - 65 && mouseY < leftY + 65) {

        //calculations take place
        hours -= 8 ;
        hLevel += 7 ;
        wLevel -= 7 ;
        experience ++ ;
        fratHouseOpen = 0 ;
      }

      //right option
      int rightX = boxX + 100;
      int rightY = boxY - 140;
      fill(255);
      rect(rightX, rightY, 160, 130);
      textSize(30);
      fill(0);
      text("Stay home \nand study", rightX - 70, rightY - 5);

      //button features
      if (mousePressed && mouseX > rightX - 80 && mouseX < rightX + 80
        && mouseY > rightY - 65 && mouseY < leftY + 65) {

        //calculations take place
        hours -= 8 ;
        hLevel -= 3 ;
        workEthic += 6 ;
        fratHouseOpen = 0 ;
      }

      //bottom option
      int bottomX = boxX;
      int bottomY = boxY + 60;
      fill(255);
      rect(bottomX, bottomY, 220, 130);
      textSize(28);
      fill(0);
      text("Attend an \neducational club", bottomX - 110, bottomY - 20);

      //button features
      if (mousePressed && mouseX > bottomX - 110 && mouseX < bottomX + 110
        && mouseY > bottomY - 65 && mouseY < bottomY + 65) {

        //calculations
        hours -= 8 ;
        hLevel -= 1 ;
        workEthic += 5 ;
        experience += 2 ;
        fratHouseOpen = 0 ;
      }
    }
  }

  //once Cookie answers a question
  //and is still within range of the frat house
  if (dist <= 200 && fratHouseOpen == 0) {

    //new pop-up box
    rect(boxX, boxY - 120, 500, 500);
    textSize(36);
    fill(0, 255, 0);
    text("Answer recorded \nmove cookie to answer \nanother question", boxX - 170, boxY - 130);
  }
}
//Shows the week number in the top right corner of the screen
void week() {

  fill(255);
  textSize(32);
  text("Week: " + week, width - 300, 50);

  //if number of hours in a day equals zero increase week by one
  if (dormOpen == 0 && schoolOpen ==0 &&  dHallOpen == 0 && libraryOpen == 0 && racOpen == 0 && workOpen == 0 && hours <= 100 ) {
    commonsOpen = 1;
    if (hours <= 0) {

      if (hLevel <= 25) {
        //Low onfidence with low happiness
        workEthic -= 4;
      } else if (hLevel >= 75) {
        //Confidence with high happiness
        workEthic += 4;
      }
      if (wLevel <= 25) {
        //Low confidence with little wealth
        workEthic -= 2;
      } else if (wLevel >= 100) {
        //Confidence with high wealth
        workEthic += 2;
      }

      //calcuating Grades equation:
      Chance = int( random(-1, 1)) ;
      gLevel = workEthic + Chance ;
      if (gLevel >= 100) {
        gLevel=100 ;
      }
      Grades[week] = gLevel;

      week ++;
      //Resets these every week
      gLevel = 0;
      workEthic = 0 ;

      dormOpen = 1;
      schoolOpen = 1;
      dHallOpen = 1;
      libraryOpen = 1;
      commonsOpen = 1;
      racOpen = 1;
      workOpen = 1;

      hours = 168;

      //Experiance If statements
      if (experience > 15) {
        fratHouseOpen = 1 ;
      }
      if (experience > 25 && clubOpen == 1) {
        hLevel += 2;
      }
      if (experience > 45 && interviewOpen == 1) {
        workEthic += 2;
      }
      if (experience > 60 && deanlistOpen == 1) {
        workEthic += 4;
      }
      if (Grades[week-1] < 20 && week != 1) {
        hLevel -= 5;
      }

      //checks to see if there are more hours left but all buildings have been visited
      //if this is the case, you are forced to keep choosing activities from the commons
    } else if (hours > 0 && hours < 168 && commonsOpen == 1) {

      fill(0);
      rect(width/2 - 150, height/2 - 150, 500, 500);
      textSize(38);
      fill(255, 0, 0);
      text("You still have " + hours + " hours \nleft please select again \nfrom the commons  \nor frat house \nif just unlocked", width/2 - 350, height - 750);
    }
  }
}

void weekSummary() {
  //displays h, w, and g level reports for the week (bottom right of screen)

  //happiness cap off
  if (hLevel >= 100) {
    hLevel = 100 ;
  } else if (hLevel <=0) {
    hLevel = 0 ;
  }

  if (week >= 2 && week < 15) {
    if ( hours <= 0 || hours >=160) {

      fill(0);
      textSize(24);
      text("Cookie's total happiness is " + hLevel + "%", 970, 970);
      text("Cookie's bank total is $" + wLevel, 970, 1000);
      text("Cookie's exam/quiz grades this the week averaged " + Grades[week-1] + "%", 970, 1030);

      if (experience > 25 && clubOpen == 1) {
        fill(0);
        textSize(24);
        text("You joined a club!", 600, 990);
      }
      if (experience > 45 && interviewOpen == 1) {
        fill(0);
        textSize(24);
        text("You scored an interview with a company", 600, 1020);
      }
      if (experience > 60 && deanlistOpen == 1) {
        fill(0);
        textSize(24);
        text("You made the top of your class", 600, 1050);
      }
    }

    //once you've finished week 15 the game is over and results are displayed
  } else if (week > 15) {
    for (int i= 0; i< 15; i++) {
      gLevel += Grades[i] ;
    }
    gLevel = gLevel / 15 ;
    fill(0);
    rect(width/2, height/2, width, height);
    textSize(50);
    fill(255);
    text("You've successfully helped Cookie survive his first\n semester of college!", width/2 - 650, height/2 - 300);
    textSize(40);
    text("Final happiness level for the college semester is " + hLevel+ "%", width/2 - 650, height/2 - 100);
    text("Final grade level for the college semester is " + gLevel  + "%", width/2 - 650, height/2); //finalgrade variable
    text("Final wealth level for the college semester is $" + wLevel,width/2 - 650, height/2 + 100 );
    text("Thanks for playing our game! -PROgrammers", width/2 - 650, height/2 + 230);
    image(ned, width/2 + 350, height-250, 500, 500 );
    noLoop();
  }
}

void gameOver() {
  if ( Grades[week-1] <= 40 && week != 1) {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(width/2, height/2, width, height);
    fill(255);
    textSize(35);
    text("Cookie failed all of his exams this week, forced to get drop out of college.", width/2 - 600, height/2 - 50);
    text("\n Ending Stats:  Grades -> " + Grades[week-1] + "%" + "  Happiness -> " + hLevel + "%" + "  Wealth -> " + "$" + wLevel, width/2 - 600, height/2);
    textSize(60);
    text("GAME OVER", width/2 - 400, height/2 + 200 );
    image(coconut, width/2 + 250, height-250, 500, 500 );
  }
  if (hLevel <= 0 && week != 1) {
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(width/2, height/2, width, height);
    fill(255);
    textSize(35);
    text("Sadly, Cookie's study habits and isolation led him to have no more happiness. \nWhich ultimately lead him to drop out of college.", 300, height/2 -50);
    text("\n Ending Stats:  Grades -> " + Grades[week-1] + "%" + "  Happiness -> " + hLevel + "%" + "  Wealth -> " + "$" + wLevel, width/2 - 600, height/2 + 30) ;
    textSize(60);
    text("GAME OVER", width/2 - 400, height/2 + 200 );
    image(coconut, width/2 + 250, height-250, 500, 500 );
  }
  if (wLevel <=0 && week != 1) {
    fill(255, 0, 255);
    rectMode(CENTER);
    rect(width/2, height/2, width, height);
    fill(255);
    textSize(35);
    text("Cookie has no more money for books or food, decides to live at home with his family.", width/2 - 600, height/2 - 50);
    text("\n Ending Stats:  Grades -> " + Grades[week-1] + "%" + "  Happiness -> " + hLevel + "%" + "  Wealth -> " + "$" + wLevel, width/2 - 600, height/2) ;
    textSize(60);
    text("GAME OVER", width/2 - 400, height/2 + 200 );
    image(coconut, width/2 + 250, height-250, 500, 500 );
  }
}
void developerSkips() {
  if (keyPressed == true) {
    if (key == 'y' || key == 'Y' ) {
      for (int i= 0; i< 15; i++) {
        Grades[i] = 75;
      }
      for (int i= 0; i< 15; i++) {
        gLevel += Grades[i] ;
      }
      gLevel = gLevel / 15 ;
      fill(0);
      rect(width/2, height/2, width, height);
      fill(255);
      textSize(50);
      text("You've successfully helped Cookie survive his first\n semester of college!", width/2 - 650, height/2 - 300);
      textSize(40);
      text("Final happiness level for the college semester is " + hLevel+ "%", width/2 - 650, height/2 - 100);
      text("Final grade level for the college semester is " + gLevel  + "%", width/2 - 650, height/2); //finalgrade variable
      text("Final wealth level for the college semester is $" + wLevel, width/2 - 650, height/2 + 100);
      text("Thanks for playing our game! -PROgrammers", width/2 - 650, height/2 + 230);
      image(ned, width/2 + 350, height-250, 500, 500 );
      noLoop();
    }
    if (key == 'h' || key == 'H' ) {
      hLevel = 0;
      fill(0, 0, 255);
      rectMode(CENTER);
      rect(width/2, height/2, width, height);
      fill(255);
      textSize(35);
      text("Sadly, Cookie's study habits and isolation led him to have no more happiness. \nWhich ultimately lead him to drop out of college.", 300, height/2 -50);
      text("\n Ending Stats:  Grades -> " + Grades[week-1] + "%" + "  Happiness -> " + hLevel + "%" + "  Wealth -> " + "$" + wLevel, width/2 - 600, height/2 + 30) ;
      textSize(60);
      text("GAME OVER", width/2 - 400, height/2 + 200 );
      image(coconut, width/2 + 250, height-250, 500, 500 );
      noLoop();
    }
    if (key == 'm' || key == 'M' ) {
      wLevel = 0;
      fill(255, 0, 255);
      rectMode(CENTER);
      rect(width/2, height/2, width, height);
      fill(255);
      textSize(35);
      text("Cookie has no more money for books or food, decides to live at home with his family.", width/2 - 600, height/2 - 50);
      text("\n Ending Stats:  Grades -> " + Grades[week-1] + "%" + "  Happiness -> " + hLevel + "%" + "  Wealth -> " + "$" + wLevel, width/2 - 600, height/2) ;
      textSize(60);
      text("GAME OVER", width/2 - 400, height/2 + 200 );
      image(coconut, width/2 + 250, height-250, 500, 500 );
      noLoop();
    }
    if (key == 'g' || key == 'G' ) {
      Grades[week-1] = 0;
      fill(255, 0, 0);
      rectMode(CENTER);
      rect(width/2, height/2, width, height);
      fill(255);
      textSize(35);
      text("Cookie failed all of his exams this week, forced to get drop out of college.", width/2 - 600, height/2 - 50);
      text("\n Ending Stats:  Grades -> " + Grades[week-1] + "%" + "  Happiness -> " + hLevel + "%" + "  Wealth -> " + "$" + wLevel, width/2 - 600, height/2);
      textSize(60);
      text("GAME OVER", width/2 - 400, height/2 + 200 );
      noLoop();
      image(coconut, width/2 + 250, height-250, 500, 500 );
    }
  }
}

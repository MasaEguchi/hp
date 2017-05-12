public int N = 10;
public int stage = 0;
public long startTime = 0;
public int halfWidth = 0;
public int ageNum = -1;
public int[] ansChecked1 = new int[N];
public int startPos;
public int midChecked = -1;
public int[] ansChecked2 = new int[N];
public PrintWriter textFile;

void setup () {
  size(900, 600);
  halfWidth = width / 2;
  startPos = halfWidth - 200;
  for (int i = 0; i < N; i ++) {
    ansChecked1[i] = -1;
    ansChecked2[i] = -1;
  }
  String rand = str(random(1));
  textFile = createWriter(rand + ".txt");
}

void draw () {
 
  if (stage == 0) {
    stage = title();
  } 
  if (stage == 1) {
    stage = sheet1();
  } 
  if (stage == 2) {
    stage = answer1();
  }
  if (stage == 3) {
    stage = mid();
  }
  if (stage == 11) {
    stage = sheet11();
  }
  if (stage == 12) {
    stage = sheet12();
  }
  if (stage == 13) {
    stage = sheet13();
  }
  if (stage == 14) {
    stage = sheet14();
  }
  if (stage == 21) {
    stage = answer21();
  }
  if (stage == 22) {
    stage = answer22();
  }
  if (stage == 4) {
    stage = finish();
  }
  
}

int title () {
  RadioButton[] age;
  Button startButton;
  background(255);
  startButton = new Button("START", halfWidth - 30, 500, 60, 20, 0);
  textSize(40);
  fill(0);
  text("Survey related to memory", startPos, 100);
  textSize(15);
  text("How old are you?", startPos - 100, 150);
  age = new RadioButton[8];
  
  for (int i = 0; i < 8; i ++) {
    String name = (i * 10) + "~" + (i * 10 + 9);
    if (i == ageNum) {
      age[i] = new RadioButton(name, startPos, 175 + i * 20, 1);
    } else {
      age[i] = new RadioButton(name, startPos, 175 + i * 20, 0);
    }
    age[i].display();
    age[i].isPushed();
    if (age[i].checked == 1) {
      ageNum = i; 
    }
  }
  
  fill(0);
  text("Push the START button! Next, there are 20 words. ", startPos, 400);
  text("Please momorize many words in 20 seconds. ", startPos, 420);
  text("Don't make a note or take a picture!", startPos, 440);

  startButton.display();
  startButton.isPushed();
  if (startButton.clicked == 1) {
      startTime = millis();
      return 1;
  }
  
  return 0;
}

int sheet1 () {
  PImage img1;
  img1 = loadImage("sheet1.png");
  background(255);
  textSize(20);
  text("SHEET1", 10, 50);
  textSize(15);
  text("Please memorize words of the SHEET1 in 20 seconds. ", 10, 70);
  long LastTime = 20 - (millis() - startTime) / 1000 ;
  textSize(20);
  text( LastTime + " seconds left!", 700, 85);
  image(img1, 50, 100, width - 100, height - 300);
  
  if (LastTime == 0) {
    return 2;
  }
  return 1;
}

int answer1 () {
  RadioButton[][] ansNum1;
  Button finish1;
  PImage ansImg1;
  int finishCheck;
  finish1 = new Button("FINISH", halfWidth - 30, 500, 60, 20, 0);
  ansNum1 = new RadioButton[N][2];
  ansImg1 = loadImage("ans1.png");
  //String[] ans1 = { "ボウリング","イクラ","サッカー","猫","パンダ","栃木","北海道","プロレス","新潟","カーリング" };
  background(255);
  fill(0);
  textSize(20);
  text("Is there these words in the SHEET1?", 10, 50);
  image(ansImg1, 100, 100, 100, height - 300);

  for (int i = 0; i < N; i ++) {
    text((i + 1) + ". ", 350, 120 + i * 30);
    if (ansChecked1[i] == 0) {
      ansNum1[i][0] = new RadioButton("Yes", 400, 110 + i * 30, 1);
    } else {
      ansNum1[i][0] = new RadioButton("Yes", 400, 110 + i * 30, 0);
    }
    if (ansChecked1[i] == 1) {
      ansNum1[i][1] = new RadioButton("No", 550, 110 + i * 30, 1);
    } else {
      ansNum1[i][1] = new RadioButton("No", 550, 110 + i * 30, 0);
    }
    ansNum1[i][0].display();
    ansNum1[i][1].display();
    ansNum1[i][0].isPushed();
    if (ansNum1[i][0].checked == 1) {
      ansChecked1[i] = 0;
      ansNum1[i][1].checked = 0;
    }
    ansNum1[i][1].isPushed();
    if (ansNum1[i][1].checked == 1) {
      ansChecked1[i] = 1;
      ansNum1[i][0].checked = 0;
    }   
  }
  /*
  textSize(15);
  text("ボウリング", 50, 70 + 0 * 20);
  text("イクラ", 50, 70 + 1 * 20);
  text("サッカー", 50, 70 + 2 * 20);
  text("猫", 50, 70 + 3 * 20);
  text("パンダ", 50, 70 + 4 * 20);
  text("栃木", 50, 70 + 5 * 20);
  text("北海道", 50, 70 + 6 * 20);
  text("プロレス", 50, 70 + 7 * 20);
  text("新潟", 50, 70 + 8 * 20);
  text("カーリング", 50, 70 + 9 * 20);
  
  
  for (int i = 0; i < 10; i ++) {
    text(ans1[i], 50, 70 + i * 20);
  }
  */
  finish1.display();
  finish1.isPushed();
  if (finish1.clicked == 1) {
    return 3;
  }  
  return 2;
}

int mid () {
  background(255);
  RadioButton[] num;
  Button startButton;
  startButton = new Button("START", halfWidth - 30, 400, 60, 20, 0);
  num = new RadioButton[4];
  text("Please select your favorite number from 1 to 4. ", 10, 50);
  
  for (int i = 0; i < 4; i ++) {
    String name = i + 1  + "";
    if (i == midChecked) {
      num[i] = new RadioButton(name, startPos, 100 + i * 20, 1);
    } else {
      num[i] = new RadioButton(name, startPos, 100 + i * 20, 0);
    }
    num[i].display();
    num[i].isPushed();
    if (num[i].checked == 1) {
      midChecked = i; 
    }
  }
  
  fill(0);
  text("Push the START button! Next, there are 20 words. ", startPos, 300);
  text("Please momorize many words in 20 seconds. ", startPos, 320);
  text("Don't make a note or take a picture!", startPos, 340);

  startButton.display();
  startButton.isPushed();
  if (startButton.clicked == 1) {
    for (int i = 0; i < 4; i ++) {
      if (i == midChecked) {
        startTime = millis();
        return 10 + i + 1;
      }
    }
  }
  
  return 3;
}

int sheet11 () {
  PImage img1;
  img1 = loadImage("sheet11.png");
  background(255);
  textSize(20);
  text("SHEET11", 10, 50);
  textSize(15);
  text("Please memorize words of the SHEET11 in 20 seconds. ", 10, 70);
  textSize(20);
  long LastTime = 20 - (millis() - startTime) / 1000 ;
  text( LastTime + " seconds left!", 700, 85);
  image(img1, 50, 100, width - 100, height - 300);
  
  if (LastTime == 0) {
    return 21;
  }
  return 11;
}

int sheet12 () {
  PImage img1;
  img1 = loadImage("sheet12.png");
  background(255);
  textSize(20);
  text("SHEET12", 10, 50);
  textSize(15);
  text("Please memorize words of the SHEET12 in 20 seconds. ", 10, 70);
  long LastTime = 20 - (millis() - startTime) / 1000 ;
  textSize(20);
  text( LastTime + " seconds left!", 700, 85);
  image(img1, 50, 100, width - 100, height - 300);
  
  if (LastTime == 0) {
    return 21;
  }
  return 12;
}

int sheet13 () {
  PImage img1;
  img1 = loadImage("sheet13.png");
  background(255);
  textSize(20);
  text("SHEET13", 10, 50);
  textSize(15);
  text("Please memorize words of the SHEET13 in 20 seconds. ", 10, 70);
  long LastTime = 20 - (millis() - startTime) / 1000 ;
  textSize(20);
  text( LastTime + " seconds left!", 700, 85);
  image(img1, 50, 100, width - 100, height - 300);
  
  if (LastTime == 0) {
    return 21;
  }
  return 13;
}

int sheet14 () {
  PImage img1;
  img1 = loadImage("sheet14.png");
  background(255);
  textSize(20);
  text("SHEET14", 10, 50);
  textSize(15);
  text("Please memorize words of the SHEET14 in 20 seconds. ", 10, 70);
  long LastTime = 20 - (millis() - startTime) / 1000 ;
  textSize(20);
  text( LastTime + " seconds left!", 700, 85);
  image(img1, 50, 100, width - 100, height - 300);
  
  if (LastTime == 0) {
    return 22;
  }
  return 14;
}

int answer21 () {
  RadioButton[][] ansNum1;
  Button finish1;
  PImage ansImg1;
  int finishCheck;
  finish1 = new Button("FINISH", halfWidth - 30, 500, 60, 20, 0);
  ansNum1 = new RadioButton[N][2];
  ansImg1 = loadImage("ans2.png");
  background(255);
  fill(0);
  textSize(20);
  text("Is there these words in the SHEET1?", 10, 50);
  image(ansImg1, 100, 100, 100, height - 300);

  for (int i = 0; i < N; i ++) {
    text((i + 1) + ". ", 350, 120 + i * 30);
    if (ansChecked2[i] == 0) {
      ansNum1[i][0] = new RadioButton("Yes", 400, 110 + i * 30, 1);
    } else {
      ansNum1[i][0] = new RadioButton("Yes", 400, 110 + i * 30, 0);
    }
    if (ansChecked2[i] == 1) {
      ansNum1[i][1] = new RadioButton("No", 550, 110 + i * 30, 1);
    } else {
      ansNum1[i][1] = new RadioButton("No", 550, 110 + i * 30, 0);
    }
    ansNum1[i][0].display();
    ansNum1[i][1].display();
    ansNum1[i][0].isPushed();
    if (ansNum1[i][0].checked == 1) {
      ansChecked2[i] = 0;
      ansNum1[i][1].checked = 0;
    }
    ansNum1[i][1].isPushed();
    if (ansNum1[i][1].checked == 1) {
      ansChecked2[i] = 1;
      ansNum1[i][0].checked = 0;
    }   
  }

  finish1.display();
  finish1.isPushed();
  if (finish1.clicked == 1) {
    return 4;
  }  
  return 21;
}

int answer22 () {
  RadioButton[][] ansNum1;
  Button finish1;
  PImage ansImg1;
  int finishCheck;
  finish1 = new Button("FINISH", halfWidth - 30, 500, 60, 20, 0);
  ansNum1 = new RadioButton[N][2];
  ansImg1 = loadImage("ans1.png");
  background(255);
  fill(0);
  textSize(20);
  text("Is there these words in the SHEET1?", 10, 50);
  image(ansImg1, 100, 100, 100, height - 300);

  for (int i = 0; i < N; i ++) {
    text((i + 1) + ". ", 350, 120 + i * 30);
    if (ansChecked2[i] == 0) {
      ansNum1[i][0] = new RadioButton("Yes", 400, 110 + i * 30, 1);
    } else {
      ansNum1[i][0] = new RadioButton("Yes", 400, 110 + i * 30, 0);
    }
    if (ansChecked2[i] == 1) {
      ansNum1[i][1] = new RadioButton("No", 550, 110 + i * 30, 1);
    } else {
      ansNum1[i][1] = new RadioButton("No", 550, 110 + i * 30, 0);
    }
    ansNum1[i][0].display();
    ansNum1[i][1].display();
    ansNum1[i][0].isPushed();
    if (ansNum1[i][0].checked == 1) {
      ansChecked2[i] = 0;
      ansNum1[i][1].checked = 0;
    }
    ansNum1[i][1].isPushed();
    if (ansNum1[i][1].checked == 1) {
      ansChecked2[i] = 1;
      ansNum1[i][0].checked = 0;
    }   
  }

  finish1.display();
  finish1.isPushed();
  if (finish1.clicked == 1) {
    return 4;
  }  
  return 22;
}


int finish () {
  Button dl;
  dl = new Button("FINISH", halfWidth - 30, 300, 120, 20, 0);
  background(255);
  fill(0);
  textSize(40);
  text("Thank you for helping our survey!", 100, 150);
  textSize(15);
  //text("Please download a file to push the DOWNLOAD ", 100, 200);
  //text("and send the file to masaaaaegu[at]yahoo.co.jp(convert [at] to @). ", 100, 220);
  dl.display();
  dl.isPushed();
  if (dl.clicked == 1) {
    textFile.println(ageNum);
    for (int i = 0; i < N; i ++) {
      textFile.println(ansChecked1[i]);
    }
    textFile.println(midChecked);
    for (int i = 0; i < N; i ++) {
      textFile.println(ansChecked2[i]);
    }
    textFile.flush(); //残りを出力する
    textFile.close(); // ファイルを閉じる
    exit(); // 終了
  }
  return 4;
}
/* @pjs preload="title1_1.png, ans1.png, ans2.png, ans0115.png, ans1630.png
,1_1.png, 1_2.png, 1_3.png, 1_4.png, 1_5.png, 1_6.png, 1_7.png, 1_8.png, 1_9.png, 1_10.png
,1_11.png, 1_12.png, 1_13.png, 1_14.png, 1_15.png, 1_16.png, 1_17.png, 1_18.png, 1_19.png, 1_20.png
,1_21.png, 1_22.png, 1_23.png, 1_24.png, 1_25.png
,2_1.png, 2_2.png, 2_3.png, 2_4.png, 2_5.png, 2_6.png, 2_7.png, 2_8.png, 2_9.png, 2_10.png
,2_11.png, 2_12.png, 2_13.png, 2_14.png, 2_15.png, 2_16.png, 2_17.png, 2_18.png, 2_19.png, 2_20.png
,2_21.png, 2_22.png, 2_23.png, 2_24.png, 2_25.png"; */ 

public int WIDTH = 900;
public int HEIGH = 600;
public int N = 25;
public int ansN = 30;
public int stage = 0;
public long startTime = 0;
public int halfWidth = 0;
public int ageNum = -1;
public int[] ansChecked1 = new int[ansN];
public int startPos;
public int checked = -1;
public String textFile = "results.txt";
public PImage[] img1, changedImg1;
public PImage[] img2, changedImg2;
public int[] data = new int[43];
public int score;

void setup () {
  size(900, 600);
  halfWidth = WIDTH / 2;
  startPos = halfWidth - 200;
  for (int i = 0; i < ansN; i ++) {
    ansChecked1[i] = -1;
  }
  //String rand = str(random(1));
  //textFile = createWriter(rand + ".txt");
  img1 = new PImage[N];
  changedImg1 = new PImage[N];
  for (int i = 1; i <= N; i ++) {
    img1[i-1] = loadImage("1_" + i + ".png");
  }
  int max = N;
  for (int i = 0; i < N; i ++) {
    int num = int(random(max));
    changedImg1[i] = img1[num];
    max--;
    for (int j = num; j < max; j ++){
      img1[j] = img1[j + 1];
    }
  }
  
  img2 = new PImage[N];
  changedImg2 = new PImage[N];
  for (int i = 1; i <= N; i ++) {
    img2[i-1] = loadImage("2_" + i + ".png");
  }
  max = N;
  for (int i = 0; i < N; i ++) {
    int num = int(random(max));
    changedImg2[i] = img2[num];
    max--;
    for (int j = num; j < max; j ++){
      img2[j] = img2[j + 1];
    }
  }
  
  for (int i = 0; i < 43; i++) {
    data[i] = -1;
  }
}

void draw () {
  if (stage == 0) {
    stage = title();
  } 
  if (stage == 1) {
    stage = sheet1();
  } 
  if (stage == 2) {
    stage = sheet2();
  }
  if (stage == 3) {
    stage = answer1();
  }
  if (stage == 4) {
    stage = finish();
  }
  
}

int title () {
  PImage title1;
  title1 = loadImage("title1_1.png");
  
  RadioButton[] age;
  Button startButton;
  background(255);
  startButton = new Button("START", halfWidth - 30, 500, 65, 20, 0);
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
  image(title1, startPos, 340, halfWidth -100, HEIGH / 2 - 200);

  startButton.display();
  startButton.isPushed();
  int rand2 = int(random(2));
  if (startButton.clicked == 1) {
      if (rand2 == 0) {
        checked = 1;
        startTime = millis();
        return 1;
      }else {
        checked = 2;
        startTime = millis();
        return 2;
      }
  }
  
  return 0;
}

int sheet1 () {
  background(255);
  fill(0);
  textSize(30);
  text("SHEET1", startPos, 50);
  int LastTime = int(30 - (millis() - startTime) / 1000) ;
  textSize(30);
  text(LastTime, 720, 70);
  textSize(15);
  text(" seconds left!", 710, 90);
  
  for (int i = 0; i < 5; i ++) {
    for (int j = 0; j < 5; j ++) {
      image(changedImg1[i * 5 + j], 50 + i * 160, 150 + j * 70, 160, 70);      
    }
  }
  if (LastTime <= 0) {
    return 3;
  }
  return 1;
}

int sheet2 () {
  background(255);
  fill(0);
  textSize(30);
  text("SHEET2", startPos, 50);
  int LastTime = int(30 - (millis() - startTime) / 1000) ;
  textSize(30);
  text(LastTime, 720, 70);
  textSize(15);
  text(" seconds left!", 710, 90);
  
  for (int i = 0; i < 5; i ++) {
    for (int j = 0; j < 5; j ++) {
      image(changedImg2[i * 5 + j], 50 + i * 160, 100 + j * 70, 160, 70);
    }
  }
  if (LastTime <= 0) {
    return 3;
  }
  return 2;
}

int answer1 () {
  RadioButton[][] ansNum1;
  Button finish1;
  PImage ansImg1, ansImg2, ansImg3;
  int finishCheck;
  finish1 = new Button("REPLY", halfWidth - 30, 550, 65, 20, 0);
  ansNum1 = new RadioButton[ansN][2];
  ansImg1 = loadImage("ans1.png");
  ansImg2 = loadImage("ans0115.png");
  ansImg3 = loadImage("ans1630.png");
  background(255);
  
  image(ansImg1, startPos, 10, 350, 50);
  image(ansImg2, 50, 70, 120, HEIGH - 100);
  image(ansImg3, 200, 70, 120, HEIGH - 100);

  textSize(15);
  for (int i = 0; i < ansN; i ++) {
    if (i < 15) {
      text((i + 1) + ". ", 400, 106 + i * 30);
      if (ansChecked1[i] == 0) {
        ansNum1[i][0] = new RadioButton("Yes", 450, 100 + i * 30, 1);
      } else {
        ansNum1[i][0] = new RadioButton("Yes", 450, 100 + i * 30, 0);
      }
      if (ansChecked1[i] == 1) {
        ansNum1[i][1] = new RadioButton("No", 550, 100 + i * 30, 1);
      } else {
        ansNum1[i][1] = new RadioButton("No", 550, 100 + i * 30, 0);
      }
    } else {
      text((i + 1) + ". ", 650, 106 + (i - 15) * 30);
    if (ansChecked1[i] == 0) {
      ansNum1[i][0] = new RadioButton("Yes", 700, 100 + (i - 15) * 30, 1);
    } else {
      ansNum1[i][0] = new RadioButton("Yes", 700, 100 + (i - 15) * 30, 0);
    }
    if (ansChecked1[i] == 1) {
      ansNum1[i][1] = new RadioButton("No", 800, 100 + (i - 15) * 30, 1);
    } else {
      ansNum1[i][1] = new RadioButton("No", 800, 100 + (i - 15) * 30, 0);
    }
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

  finish1.display();
  finish1.isPushed();
  if (finish1.clicked == 1) {
    data[0] = ageNum;
    data[1] = checked;
    for (int i = 0; i < N; i ++) {
      data[i + 2] = ansChecked1[i];
    }
    if (ansChecked1[0] == 0) {
      score++; 
    }
    if (ansChecked1[1] == 0) {
      score++; 
    }
    if (ansChecked1[2] == 1) {
      score++; 
    }
    if (ansChecked1[3] == 1) {
      score++; 
    }
    if (ansChecked1[4] == 1) {
      score++; 
    }
    if (ansChecked1[5] == 0) {
      score++; 
    }
    if (ansChecked1[6] == 0) {
      score++; 
    }
    if (ansChecked1[7] == 1) {
      score++; 
    }
    if (ansChecked1[8] == 0) {
      score++; 
    }
    if (ansChecked1[9] == 1) {
      score++; 
    }
    if (ansChecked1[10] == 0) {
      score++; 
    }
    if (ansChecked1[11] == 1) {
      score++; 
    }
    if (ansChecked1[12] == 0) {
      score++; 
    }
    if (ansChecked1[13] == 0) {
      score++; 
    }
    if (ansChecked1[14] == 0) {
      score++; 
    }
    if (ansChecked1[15] == 1) {
      score++; 
    }
    if (ansChecked1[16] == 0) {
      score++; 
    }
    if (ansChecked1[17] == 0) {
      score++; 
    }
    if (ansChecked1[18] == 1) {
      score++; 
    }
    if (ansChecked1[19] == 1) {
      score++; 
    }
    if (ansChecked1[20] == 0) {
      score++; 
    }
    if (ansChecked1[21] == 1) {
      score++; 
    }
    if (ansChecked1[22] == 0) {
      score++; 
    }
    if (ansChecked1[23] == 1) {
      score++; 
    }
    if (ansChecked1[24] == 1) {
      score++; 
    }
    if (ansChecked1[25] == 0) {
      score++; 
    }
    if (ansChecked1[26] == 1) {
      score++; 
    }
    if (ansChecked1[27] == 1) {
      score++; 
    }
    if (ansChecked1[28] == 1) {
      score++; 
    }
    if (ansChecked1[29] == 0) {
      score++; 
    }
    data[42] = score;
    // saveStrings(textFile, data);
    //for (int i = 0; i < 42; i++) {
    //  print(data[i] + ",");
    //}
    return 4;
  }  
  return 3;
}


int finish() {
  PImage finish1;
  finish1 = loadImage("finish1.png");
  //Button dl;
  //dl = new Button("FINISH", halfWidth - 30, 300, 65, 20, 0);
  background(255);
  fill(0);
  textSize(30);
  text("You're score is ", 100, 150);
  textSize(50);
  text(score, 400, 150);
  textSize(30);
  text("/30", 460, 150);
  textSize(40);
  text("Thank you for helping our survey!", 100, 300);
  textSize(15);
  image(finish1, 100, 400, 600, 70);
  for (int i = 0; i < 43; i++) {
    text(data[i] + ", ", 100 + i * 15, 500);
  }
  
  //text("Please download a file to push the DOWNLOAD ", 100, 200);
  //text("and send the file to masaaaaegu[at]yahoo.co.jp(convert [at] to @). ", 100, 220);
  //dl.display();
  //dl.isPushed();
  //if (dl.clicked == 1) {
  //  exit(); // 終了
  //}
  return 4;
}
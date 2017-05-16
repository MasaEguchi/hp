class Button {
  private String name;
  private PVector leftup;
  private int wid;
  private int hei;
  private int clicked;
  
  Button (String _name, int _x, int _y, int _wid, int _hei, int _clicked) {
    name = _name;
    leftup = new PVector(_x, _y);
    wid = _wid;
    hei = _hei;
    clicked = _clicked;
    
  }
  
  void display () {
    smooth();
    fill(221, 222, 211);
    rect(leftup.x, leftup.y, wid, hei, 0.3);
    textSize(hei);
    fill(0);
    text(name, leftup.x, leftup.y + hei * 0.9);
  }
  
  void isPushed () {
    if (mousePressed == true && mouseX >= leftup.x && mouseX <= leftup.x + wid && 
    mouseY >= leftup.y && mouseY <= leftup.y + hei) {
    clicked = 1;
    }
  }
}
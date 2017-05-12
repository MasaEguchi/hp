class RadioButton {
  private String str;
  private PVector center;
  private int checked;
  
  RadioButton (String _str, int _x, int _y, int _checked) {
    str = _str;
    center = new PVector(_x, _y);
    checked = _checked;
  }
  
  void display () {
    if (checked == 1) {
      fill(82, 162, 197);
      ellipse(center.x, center.y, 10, 10);
      fill(255);
      ellipse(center.x, center.y, 2, 2);
    } else {
      fill(231, 232, 226);
      ellipse(center.x, center.y, 10, 10);
    }
    fill(0);
    text(str, center.x + 15, center.y + 5);
  }
  
  void isPushed () {
    if (mousePressed == true && mouseX > center.x - 10 && mouseX < center.x + 10 && mouseY > center.y - 10 && mouseY < center.y + 10) {
      if (checked == 0) {
        checked = 1;
      } else {
        checked = 0;
      }
    }
  }
  
}
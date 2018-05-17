
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(640, 360);
  background(51); 
  noStroke();
  rectMode(CENTER);
  frameRate(125);
 
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  myRemoteLocation = new NetAddress("127.0.0.1",57120);
}

void draw() {

  
}

void mouseClicked() {
  //redraw();
  fill(255, 204);
  ellipse(mouseX,mouseY,3,3);
  
  OscMessage myMessage = new OscMessage("/wek/inputs");
  myMessage.add(mouseX/(float)width);
  myMessage.add(mouseY/(float)height);
  oscP5.send(myMessage, myRemoteLocation); 
  myMessage.print();
}
// Music For Sleeping is aleatoric, ambient and algorithmic.
//
// Author: Piotr Goj
// kretopi@gmail.com



import oscP5.*;
import netP5.*;

OscP5 oscP5;

float Pan1Voice;
float Pan2Voice;
float Pan3Voice;

float Vol1Voice;
float Vol2Voice;
float Vol3Voice;

int NoiseColorR;
int NoiseColorG;
int NoiseColorB;
float NoiseTempo;

int Voice1ColorR;
int Voice1ColorG;
int Voice1ColorB;

int BackgroundColor;

int Voice2ColorR;
int Voice2ColorG;
int Voice2ColorB;

int Voice3ColorR;
int Voice3ColorG;
int Voice3ColorB;

float angle1 = 0.0;
float angle2 = 0.0;


void setup() {
  size(400,400);
  frameRate(60);
  smooth();
  oscP5 = new OscP5(this,9001);
}


void draw() {
  background(BackgroundColor);
  noStroke();
  rectMode(CORNERS);
  
  // szum
  fill(NoiseColorR, NoiseColorG, NoiseColorB);
  rect(0.5 , height, width, NoiseTempo * height);
  

  
  // 2 glos
  pushMatrix();
  noStroke();
  translate(Pan2Voice * width, Vol2Voice);
  rotate(angle2);
  fill(Voice2ColorR, Voice2ColorG, Voice2ColorB);
  triangle(-45, 40, 0, -40, 45, 40);
  noFill();
  stroke(1);
  triangle(-44, 47, -5, -46, 35, 40);
  triangle(-40, 42, -2, -38, 47, 35);
  triangle(-47, 35, 5, -44, 40, 43);
  angle2 += 0.03;
  popMatrix();
  
    
  // 1 glos
  pushMatrix();
  translate(Pan1Voice * width, Vol1Voice);
  rotate(angle1);
  fill(Voice1ColorR, Voice1ColorG, Voice1ColorB);
  ellipse(0, 0, 30, 30);
  noFill();
  stroke(1);
  ellipse(2, -2, 30, 30);
  ellipse(-1, 1, 20, 30);
  ellipse(-2, 0, 30, 30);
  angle1 += -0.02;
  popMatrix();
  
  
  // 3 glos
  noStroke();
  fill(Voice3ColorR, Voice3ColorG, Voice3ColorB);
  rect(width/2, 325, Pan3Voice * width, Vol3Voice);
  stroke(1);
  noFill();
  rect((width/2) + 3, 328, (Pan3Voice * width) - 2, Vol3Voice - 2);
  rect((width/2) - 3, 327, (Pan3Voice * width) + 3, Vol3Voice + 5);
  rect((width/2) - 3, 322, (Pan3Voice * width) + 1, Vol3Voice + 2);

}



void oscEvent(OscMessage theOscMessage) {
 if(theOscMessage.checkAddrPattern("/pan1Voice") == true) {
  Pan1Voice = theOscMessage.get(0).floatValue(); }
  
  if(theOscMessage.checkAddrPattern("/pan2Voice") == true) {
  Pan2Voice = theOscMessage.get(0).floatValue(); }
  
  if(theOscMessage.checkAddrPattern("/pan3Voice") == true) {
  Pan3Voice = theOscMessage.get(0).floatValue(); }
  
  
  if(theOscMessage.checkAddrPattern("/vol1Voice") == true) {
  Vol1Voice = theOscMessage.get(0).floatValue(); }
  
  if(theOscMessage.checkAddrPattern("/vol2Voice") == true) {
  Vol2Voice = theOscMessage.get(0).floatValue(); }
  
  if(theOscMessage.checkAddrPattern("/vol3Voice") == true) {
  Vol3Voice = theOscMessage.get(0).floatValue(); }
  
  
  if(theOscMessage.checkAddrPattern("/colorNoiseR") == true) {
  NoiseColorR = theOscMessage.get(0).intValue(); }
  
  if(theOscMessage.checkAddrPattern("/colorNoiseG") == true) {
  NoiseColorG = theOscMessage.get(0).intValue(); }
  
  if(theOscMessage.checkAddrPattern("/colorNoiseB") == true) {
  NoiseColorB = theOscMessage.get(0).intValue(); }
  
  if(theOscMessage.checkAddrPattern("/tempoNoise") == true) {
  NoiseTempo = theOscMessage.get(0).floatValue(); }
  
  
  if(theOscMessage.checkAddrPattern("/color1VoiceR") == true) {
  Voice1ColorR = theOscMessage.get(0).intValue(); }
  
  if(theOscMessage.checkAddrPattern("/color1VoiceG") == true) {
  Voice1ColorG = theOscMessage.get(0).intValue(); }
  
  if(theOscMessage.checkAddrPattern("/color1VoiceB") == true) {
  Voice1ColorB = theOscMessage.get(0).intValue(); }
  
   
  if(theOscMessage.checkAddrPattern("/color2VoiceR") == true) {
  Voice2ColorR = theOscMessage.get(0).intValue(); }
  
  if(theOscMessage.checkAddrPattern("/color2VoiceG") == true) {
  Voice2ColorG = theOscMessage.get(0).intValue(); }
  
  if(theOscMessage.checkAddrPattern("/color2VoiceB") == true) {
  Voice2ColorB = theOscMessage.get(0).intValue(); }
  
  
  if(theOscMessage.checkAddrPattern("/color3VoiceR") == true) {
  Voice3ColorR = theOscMessage.get(0).intValue(); }
  
  if(theOscMessage.checkAddrPattern("/color3VoiceG") == true) {
  Voice3ColorG = theOscMessage.get(0).intValue(); }
  
  if(theOscMessage.checkAddrPattern("/color3VoiceB") == true) {
  Voice3ColorB = theOscMessage.get(0).intValue(); }
  
  
  if(theOscMessage.checkAddrPattern("/backgroundColor") == true) {
  BackgroundColor = theOscMessage.get(0).intValue(); }
}
  
final int GO_RIGHT = 0;
final int GO_DOWN = 1;
final int GO_LEFT = 2;
final int GO_UP = 3;

StringBuffer Input;
String Outputstr="There are ";
int taults=0;
String InputArray[]={} ;
int colorValue, colorValue2 ,total=0;
int columns=0;
int row[]={};
int IntArray[]={},OPRAArray[] = new int[]{0,0,0,0,0,0,0,0,0,0},LRU[]={};
boolean tf=true,loop=true; 

void setup() {
  size(1600, 1100);
  background(255);
  Input=new StringBuffer();
}

void draw() {
  background(255);
  fill(0);
  textSize(25);
  text("Please enter 0<=process<=9 :                               mouse button left:FIFO , right:OPRA , middle:LRU", 30, 30);  
  textSize(20);
  text(Input.toString(), 40, 40, 800, 80);
 }
 
void FIFO(){
  fill(0);
  textSize(22);
  text("FIFO", 10, 100);
  for(int i=0;i<columns;i++){
    row[i]=-1;
  }
  for(int i=0,now=0;i<IntArray.length;i++){
    fill(0);
    text(IntArray[i], 25+i*50, 130);
    for(int j=0;j<columns;j++){
      if(IntArray[i]!=row[j]) continue;
      else {j=columns; tf=false;}
    }
    if(tf){
      row[now]=IntArray[i];
      now++;
      taults++;
      if(now>=columns)now=0;
      for(int k=0;k<columns;k++){
        fill(255, 255, 255);
        rect(10+i*50, 160+k*40, 40, 40);
        if(row[k]>=0){
          fill(0);
          text(row[k],25+i*50,190+k*40);
        }
        else continue;
      }
    }
    tf=true;
  }
  text(Outputstr+taults+" taults",10,450);
  tf=true;
  taults=0;
}

void OPRA(){
  fill(0);
  textSize(22);
  text("OPRA", 10, 100);
  for(int i=0;i<columns;i++){
    row[i]=-1;
  }
  for(int i=0;i<10;i++){
    OPRAArray[i]=0;
  }
  for(int i=0;i<IntArray.length;i++){
    OPRAArray[IntArray[i]]++;
  }
  for(int p=0;p<columns;p++){
    LRU[p]=p;
  }
  for(int i=0,now=0;i<IntArray.length;i++){
    fill(0);
    text(IntArray[i], 25+i*50, 130);
    for(int j=0;j<columns;j++){
      if(IntArray[i]!=row[j]) continue;
      else {change(i,find(j)); now=LRU[0]; j=columns; tf=false;}
    }
    if(tf){
      if(row[now]!=-1){
        for(int m=0;m<columns;m++){
          if(OPRAArray[row[now]]>OPRAArray[row[m]]) now=m;
        }
        change(i,find(now));
        row[now]=IntArray[i];
        now=LRU[0];
        taults++;
      }
      else{
        row[now]=IntArray[i];
        change(i,0);
        now=LRU[0];
        taults++;
      }
      for(int k=0;k<columns;k++){
        fill(255, 255, 255);
        rect(10+i*50, 160+k*40, 40, 40);
        if(row[k]>=0){
          fill(0);
          text(row[k],25+i*50,190+k*40);
        }
        else continue;
      }
    }
    tf=true;
  }
  text(Outputstr+taults+" taults",10,450);
  tf=true;
  taults=0;
}  

void LRU(){
  fill(0);
  textSize(22);
  text("LRU", 10, 100);
  for(int i=0;i<columns;i++){
    row[i]=-1;
  }
  for(int p=0;p<columns;p++){
    LRU[p]=p;
  }
  for(int i=0,now=0;i<IntArray.length;i++){
    fill(0);
    text(IntArray[i], 25+i*50, 130);
    for(int j=0;j<columns;j++){
      if(IntArray[i]!=row[j]) continue;
      else {change(i,find(j)); now=LRU[0]; j=columns; tf=false;}
    }
    if(tf){
      row[now]=IntArray[i];
      change(i,0);
      now=LRU[0];
      taults++;
      for(int k=0;k<columns;k++){
        fill(255, 255, 255);
        rect(10+i*50, 160+k*40, 40, 40);
        if(row[k]>=0){
          fill(0);
          text(row[k],25+i*50,190+k*40);
        }
        else continue;
      }
    }
    tf=true;
  }
  text(Outputstr+taults+" taults",10,450);
  tf=true;
  taults=0;
}

void change(int i,int l){
  if(l<0){println("error");}
  int ch=LRU[l];
  for(int n=l;n<columns-1;n++){
    LRU[n]=LRU[n+1];
  }
  LRU[columns-1]=ch;
}

int find(int n){
  for(int i=0;i<columns;i++){
    if(LRU[i]==n) return i;
  }
  return -1;
}
  
 

void keyPressed() {
  if (keyCode  >= '0' && keyCode  <= '9' ) {
    Input.append(keyCode-48);
  }else if(keyCode == ','){
    Input.append(',');
  }else if(keyCode == BACKSPACE){
    if(Input.length()>0) Input.deleteCharAt(Input.length()-1);
  }else if(keyCode == DELETE){
    Input.delete(0,Input.length());
  }else if(keyCode == ENTER){
    InputArray = Input.toString().split(",");
    IntArray = new int[InputArray.length-1];
    columns=Integer.parseInt(InputArray[InputArray.length-1]);
    row = new int[columns];
    LRU = new int[columns];
    for(int i=0;i<InputArray.length-1;i++)
      {         
        IntArray[i] = Integer.parseInt(InputArray[i]);
      }
  }
  
}
void mousePressed() {
  loop=!loop;
  if(loop)
    loop();
  else
    noLoop();
  if (mouseButton == LEFT) {
    FIFO();
  } else if (mouseButton == RIGHT) {
    OPRA();
  } else {
    LRU();
  }
}

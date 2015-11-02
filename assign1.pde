final int GO_RIGHT = 0;
final int GO_DOWN = 1;
final int GO_LEFT = 2;
final int GO_UP = 3;

String pValue , WTstr="WT : ( ";
String pValueArray[] = {};
int colorValue, colorValue2 ,total=0;
int pValueInt, q=0;
int[] FCFSrectXValue = {};
int[] SJFrectXValue = {};
int[] RRrectXValue = {};
int[] SJFpValueArray = {};
int[] RRpValueArray = {};
int[] RRprocess = {};

void setup() {
  size(1000, 800);
  background(255);
  pValue ="";
  
          colorValue = (int)random(255);
        colorValue2 = (int)random(255);
}


void draw() {
  background(255);
  //FCFS------------------------------------------------------------------------------------start
  textSize(22);
  fill(0);
  text("FCFS", 10, 100);
  for(int i=1,j=0;i<=FCFSrectXValue.length;i++,j=(int)random(255)){

        fill(j, colorValue2, colorValue);
        rect(10, 130, FCFSrectXValue[i-1], 50);
  }

  for(int i=1;i<=FCFSrectXValue.length;i++){
        textSize(22);
        fill(0);
        if(i>=FCFSrectXValue.length){
                text("P"+(FCFSrectXValue.length-i+1), 10, 165); 
        }else{
                text("P"+(FCFSrectXValue.length-i+1), FCFSrectXValue[i]+10, 165); 
        }
  }
  
  for(int i=0,j=0;i<pValueArray.length;i++){
        textSize(22);
        fill(0);
        if(i>=FCFSrectXValue.length){
                text(0, 10, 210); 
        }else{
                j=j+Integer.parseInt(pValueArray[i]);
                text(j, FCFSrectXValue[FCFSrectXValue.length-i-1], 210); 
        }
  }
  
  for(int i=0,j=0;i<pValueArray.length-1;i++){
    WTstr+=j;
    total+=j;
    j=j+Integer.parseInt(pValueArray[i]);
    if(i!=FCFSrectXValue.length-1)
      WTstr+="+";
    else
      WTstr+=" )/"+FCFSrectXValue.length+"= "+(float)total/FCFSrectXValue.length;
  }
  text(WTstr, 10, 240);
  total=0;
  WTstr="WT : ( ";
  //FCFS--------------------------------------------------------------------------------------------------end
  
  
  
  
  textSize(25);
  fill(0);
  text("Please enter 1<=process<=10 (the last number is q) :", 30, 30);  
  
  textSize(20);
  fill(0);
  text(pValue, 40, 40, 800, 80);
  
} 

void keyPressed() {
  if (keyCode  >= '0' && keyCode  <= '9' ) {
    
    pValue += (keyCode-48)+"";

  }else if(keyCode == 188){
    pValue += ",";
  }else if(keyCode == BACKSPACE){
    pValue = "";
  }else if(keyCode == ENTER){
    pValueArray = pValue.split(",");
    q=Integer.parseInt(pValueArray[pValueArray.length-1]);
    RRpValueArray = new int[pValueArray.length-1];
    SJFpValueArray = new int[pValueArray.length-1];
    FCFSrectXValue = new int[pValueArray.length-1];
    SJFrectXValue = new int[pValueArray.length-1];
//FCFSValue----------------------------------------------------------------------------------------------start
    for(int i=1;i<=FCFSrectXValue.length;i++)
      {     
         pValueInt+=Integer.parseInt(pValueArray[i-1]);
      }
    
    pValueInt = 900/pValueInt;
    
    for(int i=0;i<FCFSrectXValue.length;i++)
      {         
        if(i==0){
                FCFSrectXValue[i] = pValueInt*Integer.parseInt(pValueArray[i]);
        }else{
                FCFSrectXValue[i] = FCFSrectXValue[i-1]+pValueInt*Integer.parseInt(pValueArray[i]);
        }
      }
      FCFSrectXValue=reverse(FCFSrectXValue);
//FCFSValue-----------------------------------------------------------------------------------------------end


    pValueInt=0;
    total=0;
  }
  
}

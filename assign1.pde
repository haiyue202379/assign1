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
}

void draw() {
  background(255);
  //FCFS------------------------------------------------------------------------------------start
  textSize(22);
  fill(0);
  text("FCFS", 10, 100);
  for(int i=1,j=0;i<=FCFSrectXValue.length;i++,j=(int)random(255)){
        colorValue = (int)random(255);
        colorValue2 = (int)random(255);
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
  
  //SJF------------------------------------------------------------------------------------------start
  textSize(22);
  fill(0);
  text("SJF", 10, 300);
  for(int i=1,j=0;i<=SJFrectXValue.length;i++,j=(int)random(255)){
        colorValue = (int)random(255);
        colorValue2 = (int)random(255);
        fill(j, colorValue2, colorValue);
        rect(10, 330, SJFrectXValue[i-1], 50);
  }

  for(int i=1;i<=SJFrectXValue.length;i++){
        textSize(22);
        fill(0);
        if(i>=FCFSrectXValue.length){
                text("P"+(SJFrectXValue.length-i+1), 10, 365); 
        }else{
                text("P"+(SJFrectXValue.length-i+1), SJFrectXValue[i]+10, 365); 
        }
  }
  
  for(int i=0,j=0;i<pValueArray.length;i++){
        textSize(22);
        fill(0);
        if(i>=SJFrectXValue.length){
                text(0, 10, 410); 
        }else{
                j=j+SJFpValueArray[i];
                text(j, SJFrectXValue[SJFrectXValue.length-i-1], 410); 
        }
  }
  
  for(int i=0,j=0;i<pValueArray.length-1;i++){
    WTstr+=j;
    total+=j;
    j=j+(int)SJFpValueArray[i];
    if(i!=SJFrectXValue.length-1)
      WTstr+="+";
    else
      WTstr+=" )/"+SJFrectXValue.length+"= "+(float)total/SJFrectXValue.length;
  }
  text(WTstr, 10, 440);
  total=0;
  WTstr="WT : ( ";
  //SJF--------------------------------------------------------------------------------------------------end
  
  //RR-----------------------------------------------------------------------------------------------start
  textSize(22);
  fill(0);
  text("RR", 10, 500);
  for(int i=1,j=0;i<=RRrectXValue.length;i++,j=(int)random(255)){
        colorValue = (int)random(255);
        colorValue2 = (int)random(255);
        fill(j, colorValue2, colorValue);
        rect(10, 530, RRrectXValue[RRrectXValue.length-i], 50);
  }

  for(int i=0;i<RRprocess.length;i++){
        textSize(22);
        fill(0);
        if(RRprocess[i]>0){
          if((i-1)>=0)
                text("P"+(RRprocess[i]), RRrectXValue[i-1]+10, 565); 
          else
                text("P"+(RRprocess[i]), 10, 565); 
        }else{
                break; 
        }
  }
  
  for(int i=0,j=0;i<=RRrectXValue.length;i++){
        textSize(22);
        fill(0);
        if(i>=RRrectXValue.length || RRrectXValue[i]==0){
                text(0, 10, 610); 
                break;
        }else{
                j=j+RRpValueArray[i];
                text(j, RRrectXValue[i], 610); 
        }
  }
  
  for(int i=1,j=(RRprocess.length-1),k=0,T=0;i<=SJFrectXValue.length;i++){
    for(j=(RRprocess.length-1);j>=0;j--){
      if(RRprocess[j]==i)
        {T=1;}
      else
        if(T==1){
          k+=RRpValueArray[j];
        }
    }
    WTstr+=k;
    total+=k;
    k=0;
    T=0;
    if(i!=SJFrectXValue.length)
      WTstr+="+";
  }
  WTstr+=" )/"+SJFrectXValue.length+"= "+(float)total/SJFrectXValue.length;
  text(WTstr, 10, 640);
  total=0;
  WTstr="WT : ( ";
  //RR-----------------------------------------------------------------------------------------------------end
  
  
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

  }else if(keyCode == ','){
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

//SJFValue----------------------------------------------------------------------------------------------start
   
   for(int i=0;i<SJFrectXValue.length;i++)
      {     
         SJFrectXValue[i]=Integer.parseInt(pValueArray[i]);
      }
   java.util.Arrays.sort(SJFrectXValue);
   for(int i=0;i<SJFrectXValue.length;i++)
      {     
         SJFpValueArray[i]=(int)SJFrectXValue[i];
      }
   for(int i=0;i<SJFrectXValue.length;i++)
      {         
        if(i==0){
                SJFrectXValue[i] = pValueInt*SJFrectXValue[i];
        }else{
                SJFrectXValue[i] = SJFrectXValue[i-1]+pValueInt*SJFrectXValue[i];
        }
      }
   SJFrectXValue=reverse(SJFrectXValue);
//SJFValue----------------------------------------------------------------------------------------------end

//RRValue----------------------------------------------------------------------------------------------start
  int zeroes=0, count=0,countr=0;
  for(int i=0,j=0;i<pValueArray.length-1;i++){
    j=j+Integer.parseInt(pValueArray[i]);
    total=j;
  }
  RRrectXValue = new int[total];
  RRprocess= new int[total];
  for(int i=0;i<RRpValueArray.length;i++)
      {     
         RRpValueArray[i]=Integer.parseInt(pValueArray[i]);
  }
  while(zeroes!=RRpValueArray.length){
    if(RRpValueArray[count]>q){
      RRrectXValue[countr]=q;
      RRpValueArray[count]-=q;
      RRprocess[countr]=count+1;
      zeroes=0;
      countr++;
    }else if (RRpValueArray[count]==0){
      zeroes++;
    }else if (RRpValueArray[count]<=q){
      RRrectXValue[countr]=RRpValueArray[count];
      RRpValueArray[count]=0;
      RRprocess[countr]=count+1;
      zeroes=0;
      countr++;
    }
    if(count==RRpValueArray.length-1) count=0;
    else count++;
  }
  RRpValueArray = new int[total];
  for(int i=0;i<RRrectXValue.length;i++){
    if(i==0){
                RRpValueArray[i]= RRrectXValue[i];
                RRrectXValue[i]= pValueInt*RRrectXValue[i];
        }else if(RRrectXValue[i]!=0){
                RRpValueArray[i]= RRrectXValue[i];
                RRrectXValue[i] = RRrectXValue[i-1]+pValueInt*RRrectXValue[i];
        }else{
                continue;
        }
  }
  for (Integer i : RRpValueArray) {  
      System.out.print(i + " ");   //輸出 103 102 101
      } 
      for (Integer i : RRprocess) {  
      System.out.print(i + " ");   //輸出 103 102 101
      } 
  //RRValue----------------------------------------------------------------------------------------------end
    pValueInt=0;
    total=0;
  }
  
}

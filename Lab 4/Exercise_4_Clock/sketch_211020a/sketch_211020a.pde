PVector lightDir;

String phase;
String waxWane;

int loopTime;
int numLoops;

String babylon;
String hindu;
String aetolian;

void setup() {
  background(0, 0, 0);
  size(1024, 1024, P3D);
  noStroke();
  
  lightDir = new PVector(0.5, 0, -1);
  phase = "FULL MOON";
  
  numLoops = 0;
}

void draw() {
  clear();
  
  loopTime ++;
  
  if(lightDir.x <= -1 && lightDir.z < 1) {
    lightDir.z += 0.01;
  } else if (lightDir.x >= 1 && lightDir.z > -1) {
    lightDir.z -= 0.01;
  } else if (lightDir.z <= -1) {
    lightDir.x -= 0.01;
  } else if (lightDir.z >= 1) {
    lightDir.x += 0.01;
  }
  
  if(loopTime == 806) { // time to complete one cycle: 806 frames
    loopTime = 0;
    numLoops++;
  }
  
  if(loopTime < 403) {
    waxWane = "WANING";
  } else {
    waxWane = "WAXING";
  }
  
  if(loopTime >  705.25) {
    phase = "WAXING GIBBOUS";
  } else if(loopTime > 604.5) {
    phase = "FIRST QUARTER";
  } else if(loopTime > 503.75) {
    phase = "WAXING CRESCENT";
  } else if(loopTime > 403) {
    phase = "NEW MOON";
  } else if(loopTime > 302.25) {
    phase = "WANING CRESCENT";
  } else if(loopTime > 201.5) {
    phase = "LAST QUARTER";
  } else if (loopTime > 100.75) {
    phase = "WANING GIBBOUS";
  } else {
    phase = "FULL MOON";
  }
  
  directionalLight(255, 255, 255, lightDir.x, lightDir.y, lightDir.z);
  translate(width / 2, (height / 2) - (height / 4));
  sphere(128);
  
  fill(255, 255, 255);
  textAlign(CENTER);
  ambientLight(128, 64, 32);
  
  textSize(36);
  text("LUNAR CLOCK", 0, 240);
  
  textSize(24);
  String currentDay = "CURRENT DAY: " + int(float(loopTime) * 0.0353598015);
  text(currentDay, 0, 300);
  
  String currentHour = "CURRENT HOUR: " + int(float(loopTime)) % 24;
  text(currentHour, 0, 340);
  
  String currentPhase = "CURRENT PHASE: " + phase; 
  text(currentPhase, 0, 380);
  
  text(waxWane, 0, 420);
  
  switch(numLoops % 12) {
    case 0:
      babylon = "CURRENT MONTH (BABYLONIAN): ARAH NISANU";
      hindu = "CURRENT MONTH (HINDU): CHAITRA VAISHAKHA";
      aetolian = "CURRENT MONTH (AETOLIAN): PROKUKLIOS";
      break;
    case 1:
      babylon = "CURRENT MONTH (BABYLONIAN): ARAH ARU";
      hindu = "CURRENT MONTH (HINDU): CHAITRA VAISHAKHA";
      aetolian = "CURRENT MONTH (AETOLIAN): ATHANAIOS";
      break;
    case 2:
      babylon = "CURRENT MONTH (BABYLONIAN): ARAH SIMANU";
      hindu = "CURRENT MONTH (HINDU): JYESHTHA AASHADH";
      aetolian = "CURRENT MONTH (AETOLIAN): BOUKATIOS";
      break;
    case 3:
      babylon = "CURRENT MONTH (BABYLONIAN): ARAH DUMUZU";
      hindu = "CURRENT MONTH (HINDU): JYESHTHA AASHADH";
      aetolian = "CURRENT MONTH (AETOLIAN): DIOS";
      break;
    case 4: 
      babylon = "CURRENT MONTH (BABYLONIAN): ARAH ABU";
      hindu = "CURRENT MONTH (HINDU): SHRAAVANA BHADRAPAD";
      aetolian = "CURRENT MONTH (AETOLIAN): EUTHAIOS";
      break;
    case 5: 
      babylon = "CURRENT MONTH (BABYLONIAN): ARAH ULULU";
      hindu = "CURRENT MONTH (HINDU): SHRAAVANA BHADRAPAD";
      aetolian = "CURRENT MONTH (AETOLIAN): HOMOLOIOS";
      break;
    case 6:
      babylon = "CURRENT MONTH (BABYLONIAN): ARAH TISRITUM";
      hindu = "CURRENT MONTH (HINDU): ASHVIN KAARTIK";
      aetolian = "CURRENT MONTH (AETOLIAN): HERMAIOS";
      break;
    case 7:
      babylon = "CURRENT MONTH (BABYLONIAN): ARAH SAMNU";
      hindu = "CURRENT MONTH (HINDU): ASHVIN KAARTIK";
      aetolian = "CURRENT MONTH (AETOLIAN): DIONUSIOS";
      break;
    case 8:
      babylon = "CURRENT MONTH (BABYLONIAN): ARAH KISLIMU";
      hindu = "CURRENT MONTH (HINDU): AGRAHAYANA POUSH";
      aetolian = "CURRENT MONTH (AETOLIAN): AGUEIOS";
      break;
    case 9:
      babylon = "CURRENT MONTH (BABYLONIAN): ARAH TEBETUM";
      hindu = "CURRENT MONTH (HINDU): AGRAHAYANA POUSH";
      aetolian = "CURRENT MONTH (AETOLIAN): HIPPODROMIOS";
      break;
    case 10:
      babylon = "CURRENT MONTH (BABYLONIAN): ARAH SABATU";
      hindu = "CURRENT MONTH (HINDU): MAGHA PHALGUN";
      aetolian = "CURRENT MONTH (AETOLIAN): LAPHRAIOS";
      break;
    default:
      babylon = "CURRENT MONTH (BABYLONIAN): ARAH ADDARU";
      hindu = "CURRENT MONTH (HINDU): MAGHA PHALGUN";
      aetolian = "CURRENT MONTH (AETOLIAN): PANAMOS";
  }
  
  text(babylon, 0, 500);
  text(hindu, 0, 540);
  text(aetolian, 0, 580);
}

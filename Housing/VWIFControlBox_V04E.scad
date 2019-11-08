//global Dimensions
$fn=30;

/* [overall Dims] */
ovWdth=95.4;
ovHght=63.1;
matThck=3;
stdRad=2.5;

/* [showLayers] */
showLayer7=true;
showLayer6=true;
showLayer5=true;
showLayer4=true;
showLayer3=true;
showLayer2=true;
showLayer1=true;
showLayer0=true;
showLabels=false;

/* [showParts] */
showExtension=true;
showPCB=true;
showLCD=true;
showBat500=true;
showBat2k=false;
showFeather=true;
showEncoder=true;
showConnectors=true;
showSwitch=true;

/* [Parts Positions] */
pcbConYpos= 29.9; //Ext. Header Y pos relative to board lower edge
pcbConYpos2= 29.9-2.8; //Ext. Header Y pos relative to Box inner Rim
pcbWdth = 91.4;
pcbHght = 59;
pcbSize = [pcbWdth,pcbHght];
pcbPos = [ovWdth/2-pcbWdth/2,pcbHght/2-pcbConYpos,0];//XY(Z) offset between PCB center and box (world) origin

echo("PCBOffset",pcbPos);
// Adafruit feather
fthLngth=2*25.4;
fthWdth=0.9*25.4;
  
TFT1_8Wdth=1.35*25.4;
//positions relative to zero
switchPos = [28.1,-25.05,1.5]+pcbPos;
featherPos = [-32.73,4.117,7.76]+pcbPos;
rotEncPos = [29.5,10.3,1.5]+pcbPos;
TFT1_8pos = [1.55,1.58,7.76]+pcbPos;
TFT1_8ConPos = (TFT1_8pos - [0,25.4,7.76-1.5]);
TFTConPos = [1.55,-25.15,1.5]+pcbPos;
OLEDConPos = [1.55,26.7,0]+pcbPos;
extHdrPos = [40.4,0.4,1.5]+pcbPos;
batPos = TFT1_8pos + [0,-2,-7.76+1.5];
batConYPos = featherPos[1] + fthLngth/2-0.43*25.4; //centre of open face
echo(batConYPos);
fixHolePosL = [42.7,-20.6,0]+pcbPos; //M3 extension fixation hole upper
fixHolePosU = [42.7,21.4,0]+pcbPos; //M3 extension fixation hole lower
miniSpkrPos = [-30,-30,12];

/* [extension]  */
//relative to top left edge

extPCBpos =[-2.5,0,0]; //WorldOrigin to center
extPCBshft = 120; //x-Shift
extPCBsize=[63,50,1.5];
extPCBOffset = extPCBpos + [-extPCBsize[0]/2,extPCBsize[1]/2,extPCBsize[2]]; //to left edge
SiPos = extPCBOffset + [80,0,7.76];
SiConPos = SiPos - [0,-0.85*25.4/2,0];
dClikAPos = extPCBOffset + [62.6,-11.6,0];
dClikBPos = extPCBOffset + [62.6,-24.5,0];
A2BHdrPos = extPCBOffset + [32.25,-45.37,0]; 
pinHdr1Pos = extPCBOffset + [52.4,-1.75,0]; 
pinHdr2Pos = extPCBOffset + [32.35,-1.75,0];
pinHdr3Pos = extPCBOffset + [60.46,-34.7,0]; //3 Pinnext to Port
pinHdr4Pos = extPCBOffset + [15.9,-25,0];//[25.00000, 15.95000]
pinHdr5Pos = extPCBOffset + [60.45,-41.8,0]; //2Pin lower right
MEMSHdrPos = extPCBOffset + [37.35,-36.7,0];

/* [Hidden] */
fudge=0.1;
fudgeCO=0.5; //fudge for cutouts (boards, pins, conns, etc.)

if (showExtension)
  translate ([ovWdth/2+extPCBsize[0]/2+2.5+10,0,0]) 
    A2B_Extension(); 
ControlBox();

module ControlBox(){
//Layers
  if (showLayer7) translate([0,0,matThck*5]) layer7("TroLaseLight"); //Trolase 1.6
  if (showLayer6) translate([0,0,matThck*4]) layer6(true); //transparent
  if (showLayer5) translate([0,0,matThck*3]) layer5(); //USB
  if (showLayer4) translate([0,0,matThck*2]) layer4(); //uSD
  if (showLayer3) translate([0,0,matThck*1]) layer3(); //PCB cover, battery compartment 1
  if (showLayer2) translate([0,0,matThck*0]) layer2(); //PCB frame
  if (showLayer1) translate([0,0,matThck*-1]) layer1(); //PCB support
  if (showLayer0) translate([0,0,matThck*-2]) layer0(); //bottom plate

  //Parts
  if (showPCB) translate([0,0,0]) pcb(1.5);
  if (showFeather) translate (featherPos) rotate([0,0,-90]) feather();
  *translate (miniSpkrPos) miniSpkr();
  if (showEncoder) translate (rotEncPos) rotEncoder();
  if (showLCD) translate (TFT1_8pos) TFT1_8inch();
  //if (showConnectors) translate (TFT1_8ConPos) MPE_098(pins=10,true); //no idea what that is for
  if (showConnectors) translate (extHdrPos) extHeader(28);
  if (showConnectors) translate (TFTConPos) MPE_098(var=3,pins=20,center=true);
  if (showBat500) translate (batPos) battery500();
  if (showSwitch) translate (switchPos) switch();
  *translate(fixHolePosL + [0,0,matThck]) rotate([180,0,0]) M3Rivet(); //M3 rivet
  *translate(fixHolePosU + [0,0,matThck]) rotate([180,0,0]) M3Rivet(); //M3 rivet
  if (showBat2k) translate([0,0,-3-8]) rotate([0,0,90]) battery2000();
}

module A2B_Extension(){
  //ext. Layers
  if (showLayer3) translate([0,0,matThck*1]) extLayer3();
  if (showLayer2) color("purple") translate([0,0,matThck*-0]) extLayer2();
  if (showLayer1) translate([0,0,matThck*-1]) extLayer1();
  if (showLayer0) translate([0,0,matThck*-2]) extLayer0();

  //ext. PCB
  //!projection()
  
    translate(extPCBpos)
      extPCB(extPCBsize[0],extPCBsize[1],extPCBsize[2]);
  
  //ext. Parts
  translate (A2BHdrPos) MPE_094(16,false); 
  translate(dClikAPos) rotate([0,0,90]) duraClikRA(2);
  translate(dClikBPos) rotate([0,0,90]) duraClikRA(2);
  translate(pinHdr1Pos) rotate([180,0,0]) pinHeader(3,true);
  translate(pinHdr2Pos) rotate([180,0,0]) pinHeader(3,true);
  translate(pinHdr3Pos) rotate([180,0,90]) pinHeader(3,true);
  translate(pinHdr4Pos) rotate([180,0,0]) pinHeader(3,true);
  translate(pinHdr5Pos) rotate([180,0,-90]) pinHeader(2,false);
  translate(extPCBpos+[-extPCBsize[0]/2,0,1.5]) rotate([0,0,-90])MPE_196(28,cntrX=true);
  translate(MEMSHdrPos) MPE_098(var=2,pins=6,center=false);
  translate(MEMSHdrPos+[2.54*2.5,0,5.18-1.6]) I2S_Mic();
  *color("white") translate([ 60, -15, 10 ]) cube([47,35,10]); //breadboard mini
}

module pcb(thick){
  color("darkgreen")
  translate(pcbPos-pcbSize/2){
    linear_extrude(thick,convexity=4) 
      resize(pcbSize) 
       // import("VWIFCOntrolBox-Edge.Cuts.svg");
      import("VWIFCOntrolBox-brd.svg");
  }
}

module layer7(material="TroLase"){ //TroLase 1.6
  label = (showLabels) ? "layer7" : "";
  if (material=="TroLase"){
    color("grey") rndRect(ovWdth,ovHght,1.6,stdRad,4.5,diff="screws",label=label); //screw heads
  
    difference(){
      union(){//two layers
        color("white") rndRect(ovWdth,ovHght,1.55,stdRad,5);
        color("RoyalBlue") translate([0,0,1.55]) rndRect(ovWdth,ovHght,0.05,stdRad,5);
      }
      color("white") //text
      translate([-30,0,1.5]) 
        scale(0.5)
          linear_extrude(0.3)
            text("VWIF",halign="center",valign="center");
      translate(rotEncPos) rotEncoder("dome"); //rotary Encoder dome
      translate(TFT1_8pos+[0,0,-7.76]) TFT1_8inch(diff="screen",thick=1.6+fudge); //TFT 1,8" pcb outline as window outline
    }
  }
  else if (material=="TroLaseLight"){
    difference(){
      color("silver") rndRect(ovWdth,ovHght,0.1,stdRad,5);
      translate(rotEncPos) rotEncoder("dome"); //rotary Encoder dome
      translate(TFT1_8pos+[0,0,-7.76]) TFT1_8inch(diff="screen",thick=1.6+fudge); //TFT 1,8" pcb outline as window outline
    }
  }
}
module layer6(screws="false"){
  label = (showLabels) ? "VI" : "";
  
  if (screws) color("grey") rndRect(ovWdth,ovHght,1.6,stdRad,4.5,diff="screws"); //screw heads
  drill = screws ? 5 : 2.5; 
  %color("white",0.3)
  difference(){
    rndRect(ovWdth,ovHght,matThck,stdRad,drill,label=label);
    translate(rotEncPos) rotEncoder("dome"); //rotary Encoder dome
    translate(featherPos+[0,0,-7.76]) rotate([0,0,-90]) feather(diff="batCon"); //feather pcb battery connector
    translate(TFT1_8pos+[0,0,-7.76]) TFT1_8inch(diff="screwThreads"); //TFT 1,8" pcb outline as window outline

    //translate(TFT1_8pos+[0,0,-7.76-fudge/2]) rndRect(1.35*25.4+10,5,matThck+fudge,2.5,0); //
  }
  //inlay
  *difference(){
    color("white",0.4) translate(TFT1_8pos+[0,0,-7.76]) TFT1_8inch(diff="pcb",thick=matThck);
    translate(TFT1_8pos+[0,0,-7.76]) TFT1_8inch(diff="screwThreads");
    
  }
}

module layer5(){
  label = (showLabels) ? "V" : "";
  difference(){
    rndRect(ovWdth,ovHght,matThck,stdRad,2.5,label=label);
    translate(rotEncPos) rotEncoder("dome"); //rotary Encoder dome
    translate(featherPos+[0,0,-7.76]) rotate([0,0,-90]) feather(diff="pcb"); //feather pcb
    translate(TFT1_8pos+[0,0,-7.76]) rotate([0,0,0]) TFT1_8inch(diff="displayFrame"); //TFT 1,8" displayFrame
    translate(TFT1_8pos+[0,0,-7.76]) rotate([0,0,0]) TFT1_8inch(diff="screwHoles"); //TFT 1,8" screwHoles
    translate(TFT1_8pos+[0,0,-7.76]) rotate([0,0,0]) TFT1_8inch(diff="header"); //TFT 1,8" header
    translate([featherPos[0],(ovHght-3)/2,matThck/2]) cube([8,3,matThck+fudge],true); //USB con
    translate([featherPos[0]+fthWdth/2+fudgeCO,batConYPos,-fudge/2]) rndRect(6,6,matThck+fudge,1,0); //USB con
  }
  
  
}

module layer4(){
  label = (showLabels) ? "IV" : "";
  
  difference(){
    rndRect(ovWdth,ovHght,matThck,stdRad,2.5,label=label);
    translate(rotEncPos) rotEncoder("body"); //rotary Encoder body
    translate(featherPos+[0,0,-7.76]) rotate([0,0,-90]) feather(diff="pcb"); //feather pcb
    translate(TFT1_8pos+[0,0,-7.76]) rotate([0,0,0]) TFT1_8inch(diff="pcb"); //TFT 1,8" pcb
    translate([TFT1_8pos[0],(ovHght-3)/2,matThck/2]) cube([11,3,matThck+fudge],true); //uSD
    translate([TFT1_8pos[0]-TFT1_8Wdth/2-fudgeCO,batConYPos,-fudge/2]) rndRect(6,6,matThck+fudge,1,0); 
    translate(fixHolePosL +[0,0,-fudge/2]) cylinder(h=matThck+fudge,d=4); //M3 rivet
    translate(fixHolePosU +[0,0,-fudge/2]) cylinder(h=matThck+fudge,d=4); //M3 rivet
  }
}

module layer3(){
  label = (showLabels) ? "III" : "";
  
  difference(){
    rndRect(ovWdth,ovHght,matThck,stdRad,2.5,label=label);
    translate(rotEncPos+[0,-0.1,-fudge/2-matThck/2]) rndRect(15,16,matThck+fudge,2,0); //rotary Encoder
    translate(TFTConPos+[0,0,-fudge/2-matThck/2]) rndRect(2.54*10+1,2.54*2+1,matThck+fudge,1,0); //Display Con bottom
    translate(batPos+[0,-0.1,-fudge/2-matThck/2]) rndRect(30,37,matThck+fudge,1,0); //battery compartment
    translate(batPos+[0,36/2+2,-fudge/2-matThck/2]) rndRect(25,7,matThck+fudge,1,0); //battery compartment 
    translate(OLEDConPos+[0,0,-fudge/2]) rndRect(2.54*8+1,2.54+1,matThck+fudge,1,0); //OLED Con top
    translate(featherPos+[0,0,-7.76]) rotate([0,0,-90]) feather(diff="headers"); //feather headers
    translate(TFT1_8pos+[0,0,-7.76]) rotate([0,0,0]) TFT1_8inch(diff="screwHeads"); //TFT 1,8" pcb
    translate(fixHolePosL +[0,0,-fudge/2]) cylinder(h=matThck+fudge,d=4); //M3 rivet
    translate(fixHolePosU +[0,0,-fudge/2]) cylinder(h=matThck+fudge,d=4); //M3 rivet
  }
}
module layer2(){ //PCB frame
  label = (showLabels) ? "II" : "";
  
  difference(){
    rndRect(ovWdth,ovHght,matThck,stdRad,2.5,label=label);
    translate([fudge,0,-fudge/2]) pcb(matThck+fudge);
    
    translate(switchPos + [0,-3.8,-matThck/2-fudge/2]) rndRect(12.9,2,matThck+fudge,1,0);//slider cavity
    translate(switchPos + [-6/2,-6.3,-matThck/2-fudge/2]) cube([6,5,matThck+fudge]);
    
    translate([20,-ovHght/2+stdRad,-fudge/2]) cylinder(h=matThck+fudge,d=1); //dowel pin
    translate([40,-ovHght/2+stdRad,-fudge/2]) cylinder(h=matThck+fudge,d=1); //dowel pin
    translate(fixHolePosL +[0,+fudge,matThck/2]) cube([7,6+fudge,matThck+fudge],true); //etHeader fix
    translate(fixHolePosU +[0,-fudge,matThck/2]) cube([7,6+fudge,matThck+fudge],true); //extHeader fix
  
    }
    
    color("orange") translate(switchPos + [(1.3/2+0.2),-3.8,-matThck/2]) 
    difference(){
      union(){
        rndRect(10.8,1.8,matThck,0.9,0);
        translate([0,0,matThck/2]) cube([4,4.2,matThck],true);
        translate([0,-2.1,0]) cylinder(h=matThck,d=4);
      }
      translate([0,1.9,matThck/2]) cube([1.3,2,matThck+fudge],true);
    }
    
    
}

module layer1(){ //pcbsupport
  label = (showLabels) ? "I" : "";
  
  difference(){
    rndRect(ovWdth,ovHght,matThck,stdRad,2.5,label=label);
    translate(featherPos+[0,0,-7.76]) rotate([0,0,-90]) feather(diff="headers"); //feather headers
    translate(TFTConPos+[0,0,-fudge/2]) rndRect(2.54*10+1,2.54*2+1,matThck+fudge,1,0); //Display Con bottom
    translate(rotEncPos) rotEncoder("body"); //rotary Encoder body
    translate(OLEDConPos+[0,0,-fudge/2]) rndRect(2.54*8+1,2.54+1,matThck+fudge,1,0); //OLED Con top
    translate(fixHolePosL +[0,0,-fudge/2]) cylinder(h=matThck+fudge,d=3); //M3 screw hole
    translate(fixHolePosU +[0,0,-fudge/2]) cylinder(h=matThck+fudge,d=3); //M3 screw hole
  }
}

module layer0(){ //bottom cover
  label = (showLabels) ? "0" : "";
  
  difference(){
    rndRect(ovWdth,ovHght,matThck,stdRad,1.9,label=label);
    
    for (i=[fixHolePosL,fixHolePosU])
      translate(i +[0,0,-fudge/2]) 
        union(){
          cylinder(h=matThck+fudge,d=6); //M3 Screw Head recess
          translate([1.5,0,(matThck+fudge)/2]) cube([3+fudge,6,matThck+fudge],true); //M3 Screw Head
          translate([3,3,0]) rotate([0,0,-90]) rndCorner(2,matThck+fudge,false);
          translate([3,-3,0]) rotate([0,0,0]) rndCorner(2,matThck+fudge,false);
        } //union
  }
}



module extLayer3(){ 
  label = (showLabels) ? "III" : "";
  
  cutOutWdth=6;
  cutOutHght=dClikAPos[1]-dClikBPos[1]+8;
  cutOutPos=[dClikAPos[0]+cutOutWdth/2,(dClikAPos[1]-dClikBPos[1])/2+dClikBPos[1],matThck];
  layerThick=6;
  echo("dCliks",(dClikAPos[1]-dClikBPos[1])/2+dClikBPos[1]);
  
  difference(){
    rndRect(extPCBsize[0]+5,ovHght,layerThick,stdRad,2.5,label=label);
    translate([0,0,-1.5-fudge/2]+pinHdr1Pos)  pinHeader(3,true,"housing",layerThick+fudge);
    translate([0,0,-1.5-fudge/2]+pinHdr2Pos)  pinHeader(3,true,"housing",layerThick+fudge);
    translate([0,0,-1.5-fudge/2]+pinHdr3Pos)  pinHeader(3,true,"housing",layerThick+fudge);
    translate([0,0,-1.5-fudge/2]+pinHdr4Pos)  pinHeader(3,true,"housing",layerThick+fudge);
    translate (A2BHdrPos+[0,0,1.5-fudge]) MPE_094(16,false,"housing"); 
    translate (A2BHdrPos+[0,0,1.5-fudge]) MPE_094(16,false,"housing"); 
    translate(dClikAPos+[0,0,-1.5]) rotate([0,0,90]) duraClikRA(2,"housing");
    translate(dClikBPos+[0,0,-1.5]) rotate([0,0,90]) duraClikRA(2,"housing");
    
    //cutout for A2B connectors
    translate(cutOutPos) cube([cutOutWdth+fudge,cutOutHght+fudge,matThck*2+fudge],true);
    translate([(extPCBsize[0]+5)/2,cutOutPos[1]-(cutOutHght+fudge)/2,-fudge/2]) rndCorner(6,matThck*2+fudge,false);
    translate([(extPCBsize[0]+5)/2,cutOutPos[1]+(cutOutHght+fudge)/2,-fudge/2]) rotate([0,0,-90]) rndCorner(6,matThck*2+fudge,false);
  }
}

module extLayer2(){
  label = (showLabels) ? "II" : "";
  
  cutOutWdth=6;
  cutOutHght=dClikAPos[1]-dClikBPos[1]+8;
  cutOutPos=[dClikAPos[0]+cutOutWdth/2,(dClikAPos[1]-dClikBPos[1])/2+dClikBPos[1],matThck/2];
  
  union()
    translate([-extPCBsize[0]/2-2.5,-(28*1.27+0.41+6)/2,0]) rndRect(12,6,matThck,3,3);
    translate([-extPCBsize[0]/2-2.5,(28*1.27+0.41+6)/2,0]) rndRect(12,6,matThck,3,3);
    difference(){
    rndRect(extPCBsize[0]+5,ovHght,matThck,stdRad,2.5,label=label);
    translate([0,0,-fudge/2]+extPCBpos) extPCB(extPCBsize[0],extPCBsize[1],thick=matThck+fudge);
    
    //cutout for A2B connectors
    translate(cutOutPos) cube([cutOutWdth+fudge,cutOutHght+fudge,matThck+fudge],true);
    translate([(extPCBsize[0]+5)/2,cutOutPos[1]-(cutOutHght+fudge)/2,-fudge/2]) rndCorner(6,matThck+fudge,false);
    translate([(extPCBsize[0]+5)/2,cutOutPos[1]+(cutOutHght+fudge)/2,-fudge/2]) rotate([0,0,-90]) rndCorner(6,matThck+fudge,false);
    
    }
}
module extLayer1(){ //pcbsupport
  
  label = (showLabels) ? "I" : "";
  
  difference(){
    rndRect(extPCBsize[0]+5,ovHght,matThck,stdRad,2.5,label=label);
    translate([0,0,-1.5-fudge/2]+pinHdr1Pos)  pinHeader(3,true,"pins");
    translate([0,0,-1.5-fudge/2]+pinHdr2Pos)  pinHeader(3,true,"pins");
    translate([0,0,-1.5-fudge/2]+pinHdr3Pos)  pinHeader(3,true,"pins");
    translate([0,0,-1.5-fudge/2]+pinHdr4Pos)  pinHeader(3,true,"pins");
    translate (A2BHdrPos+[0,0,1.5-fudge]) MPE_094(16,false,"pins"); 
  }
}

module extLayer0(){
  label = (showLabels) ? "0" : "";
  
    rndRect(extPCBsize[0]+5,ovHght,matThck,stdRad,1.9,label=label);
}

*!difference(){
  translate([0,0,1.5]) cube([50,50,3],true);
  feather(diff="headers");
}

//!feather();
module feather(diff="none",thick=3,model="std"){
  fudge=0.1;
  
  fthLngth=2*25.4;
  fthWdth=0.9*25.4;
  fthXtnd= (model=="FONA") ? 0.4*25.4 : 0; //for FONA pcb is 2.4" in length
  
  
  if (diff=="headers"){
    translate([-fthLngth/2+0.65*25.4-3.54/2,1.27*8-3.54/2,-fudge/2]) rndRect(12*2.54+1,2.54+1,thick+fudge,1,0,false);
    translate([-fthLngth/2+0.25*25.4-3.54/2,-1.27*8-3.54/2,-fudge/2]) rndRect(16*2.54+1,2.54+1,thick+fudge,1,0,false);
  }//if headers
  
  else if (diff=="pcb"){
    translate([0,0,-fudge/2]) rndRect(fthLngth+1,fthWdth+1,thick+fudge,2.54+0.5,0);
  }//if pcb
  else if (diff=="batCon"){
    translate([-fthLngth/2+0.43*25.4,fthWdth/2-4,thick/2]) cube([9+1,8+1,thick+fudge],true); 
  }//if pcb
  else {
    color("MidnightBlue") translate([fthXtnd/2,0,0]) rndRect(fthLngth+fthXtnd,fthWdth,1.5,2.54,2.54); //pcb
    translate([-fthLngth/2+0.65*25.4,1.27*8,0]) pinHeader(12); //header
    translate([-fthLngth/2+0.25*25.4,-1.27*8,0]) pinHeader(16); //header
    color ("darkgrey") //Battery Con
      translate([-fthLngth/2+0.43*25.4,fthWdth/2-4,5.5/2+1.5]) cube([8,8,5.5],true); 
    color("grey") //USB Con
      translate([-fthLngth/2+5.6/2-0.2,0,1.5+2.5/2]) cube([5.6,8,2.5],true);
  }

  
}
//!rndRect(3.8,20,3,2,1);
//!rndRect(80,40,3,2,4); //cover plate (drill is as big or bigger as radius
module rndRect(wdth, hght, thick, radius, drill,cntr=true,diff="none",label="none") {
  
  //set radius to minimum if less then wdth or high
  comp = (wdth>hght) ? hght : wdth; //which value to compare to
  radius = (radius>(comp/2)) ?  comp/2 : radius; //set radius
  cntrOffset = cntr ? [0,0,0] :[wdth/2,hght/2,0];
  
  translate(cntrOffset){
    if (diff=="screws"){ //drill holes
      for (i=[-1:2:1]){ 
        for (j=[-1:2:1]){
          translate([i*(wdth/2-radius),j*(hght/2-radius),-fudge/2]) cylinder(h=thick+fudge, d=drill);
        }
      }
    }//if screwheads
    
    else if (drill>=radius*2){//if drill bigger than radius make screw Head cover
      difference(){
        translate([0,0,thick/2]) cube([wdth,hght,thick],true); //base is cube
          for (i=[-1:2:1]){
            for (j=[-1:2:1]){
              translate([i*(wdth/2),j*(hght/2),-fudge/2])
                rndRect(drill*2,drill*2,thick+fudge,drill/2,0,"none");
                //cylinder(h=thick+fudge, d=drill);
              
              translate([i*((wdth/2)-drill*1.25+fudge/2),j*((hght/2)-drill/4+fudge/2),thick/2]) 
                difference(){
                  cube([drill/2+fudge,drill/2+fudge,thick+fudge],true);
                  translate([i*(-drill/4-fudge/2),j*(-drill/4-fudge/2),-thick/2-fudge/2]) cylinder(h=thick+fudge,d=drill);
                }
              translate([i*((wdth/2)-drill/4+fudge/2),j*((hght/2)-drill*1.25+fudge/2),thick/2]) 
              difference(){
                cube([drill/2+fudge,drill/2+fudge,thick+fudge],true);
                translate([i*(-drill/4-fudge/2),j*(-drill/4-fudge/2),-thick/2-fudge/2]) cylinder(h=thick+fudge,d=drill);
              }
            }
          }
        }//diff
    }//else
    
    else { //make rounded plate with screw holes
      difference(){
        hull(){
          for (i=[-1:2:1]){
            for (j=[-1:2:1]){
              translate([i*(wdth/2-radius),j*(hght/2-radius),0])
                cylinder(h=thick, r=radius);//cube
            }
          }
        }
        for (i=[-1:2:1]){ //drill holes
          for (j=[-1:2:1]){
            translate([i*(wdth/2-radius),j*(hght/2-radius),-fudge/2]) cylinder(h=thick+fudge, d=drill);
          }
        }
        //label                    rght, lft, btm, top
        /*if (label!="none") // i,j: -1,0 1,0 0,-1 0,1
          for (i=[ [[1, 0],[90,0, 90]],    //right
                   [[-1, 0],[90,0,-90]],    //left
                   [[ 0,-1],[90,0,  0]],    //front
                   [[ 0,1 ],[90,0,180]] ]){  //back
            
            translate([i[0][0]*(wdth/2-fudge),i[0][1]*(hght/2-fudge),thick/2]) // 
              rotate(i[1]) //90,0,90 90,0,-90 90,0,0 90,0,180
                linear_extrude(fudge*2,convexity=10)
                  text(label,halign="center",valign="center",size=0.6*thick);
            
          }//if .. for i
          */
      }//difference
    }//else
    //label                    rght, lft, btm, top
        if (label!="none") // i,j: -1,0 1,0 0,-1 0,1
          for (i=[ [[1, 0],[90,0, 90]],    //right
                   [[-1, 0],[90,0,-90]],    //left
                   [[ 0,-1],[90,0,  0]],    //front
                   [[ 0,1 ],[90,0,180]] ]){  //back
            color("white")
            translate([i[0][0]*(wdth/2),i[0][1]*(hght/2),thick/2]) // 
              rotate(i[1]) //90,0,90 90,0,-90 90,0,0 90,0,180
                  text(label,halign="center",valign="center",size=0.6*thick);
            
          }//if .. for i
         
    
  }//cntrOffset
  
}

// create a mask for rounded corners
//!rndCorner(5,3,true);
module rndCorner(rad, thick,cntr=true){
  cntrOffset= cntr ? [0,0,0] :[-rad,-rad,0];
  fudge=0.1;
  
  translate(cntrOffset)
    difference(){
      cube([rad+fudge,rad+fudge,thick]);
      translate([0,0,-fudge/2])
        cylinder(r=rad,h=thick+fudge);
    }
}

//!rotate([180,0,0]) pinHeader(3,true,"none");
module pinHeader(pins,center=false, diff="none", thick=3+fudge){
  
  cntrOffset= center ? [-(pins-1)*2.54/2,0,0]:[0,0,0];
  pinLength=11.6;
  pinOffSet=-1.53;
  
  translate(cntrOffset){
    if (diff=="pins"){
      translate([(pins-1)*2.54/2,0,0]) rndRect(pins*2.54,2.54,thick,1.27,0);
    }
    else if (diff=="housing"){
      translate([(pins-1)*2.54/2-fudge/2,-fudge/2,(thick)/2]) cube([pins*2.54+fudge,2.54+fudge,thick+fudge],true);
    }
    else {
      for (i=[0:pins-1]){
        translate ([i*2.54,0,-2.54/2]){
          color("DarkSlateGray")cube(2.54,true);
          color("gold") translate([0,0,pinOffSet]) cube([0.64,0.64,pinLength],true);
          difference(){
            
          }
        }
      }
    }
  }
}
//!rotEncoder();
*!difference(){
  translate([0,0,1.5]) cube([30,30,3],true);
  rotEncoder(diff="body");
}

module rotEncoder(diff="none",thick=3){
  //SparkFun Rotary Encoder COM-10982 - https://www.sparkfun.com/products/10982
  if (diff=="body"){
    union(){
      translate([0,0,-thick/2-fudge/2]){
        rndRect(12.4+1,13.2+1,thick+fudge,1,0);
        translate([0,0,0]) rndRect(11,15+1,thick+fudge,1,0);
      }
    }
  }
  else if (diff=="dome"){
    translate([0,0,-thick/2-fudge/2]) cylinder(h=thick+fudge,d=9+1);
  }
  else{
    union(){
      color("darkgrey") translate([0,0,0]) rndRect(12,13.2,7.5,1,0); //base
      color("grey") translate([-12.4/2,-11/2,fudge]) cube([12.4,11,7.5]);//base sheet
      color("lightgrey") translate([0,0,7.5-fudge]) cylinder(h=7+fudge,d=9,$fn=100); //screw dome
      color("white",0.5) translate([0,0,7.5+7.0-fudge]) cylinder(h=10.5, d=6); //handle
      color("grey") //5pins on top
        for (i=[-4.1:8.2/4:4.1]){
          translate([i-0.8/2,7,-2.9]) cube([0.8,0.3,4.3]);
        }
      color("grey") //3 pins front
        for (i=[-2.5:2.5:2.5]){
          translate([i-0.9/2,-7.5,-2.8]) cube([0.9,0.3,7]);
        }
    }//union
  }
}

//!TFT1_8inch();
module TFT1_8inch(diff="none",thick=3){
  fudge=0.1;
  dspFrameHght=46.7;
  dspFrameOffset=0;
  PCBwdth=1.35*25.4;
  PCBhght=2.2*25.4;
  
  if (diff=="pcb"){
    translate([0,0,-fudge/2]) rndRect(1.35*25.4+1,2.2*25.4+1,thick+fudge,2.54+0.5,0);
  }
  
  else if (diff=="screwHeads"){//substract M2.5 Screwheads
    translate([0,0,-fudge/2]) rndRect(1.35*25.4,2.2*25.4,thick+fudge,2.54,4.5,diff="screws");
  }
  else if (diff=="screwThreads"){//substract M2.5 thread core holes
    translate([0,0,-fudge/2]) rndRect(1.35*25.4,2.2*25.4,thick+fudge,2.54,1.9,diff="screws");
  }
  else if (diff=="screwHoles"){//substract M2.5 screw holes
    translate([0,0,-fudge/2]) rndRect(1.35*25.4,2.2*25.4,thick+fudge,2.54,2.5,diff="screws");
  }
  else if (diff=="displayFrame"){//substract M2.5 screw holes
    translate([0,0,thick/2]) cube([34.6+0.5,46.7+1,thick+fudge],true);
  }
  else if (diff=="screen"){//substract screen (viewable area)
    translate([0,(46.7-35)/2-1.5,thick/2]) cube([28,35,thick+fudge],true);
  }
  else if (diff=="header"){//substract header
    translate([0,-25.4,-fudge/2]) rndRect(2.54*10+1,2.54+1,thick+fudge,2.54,0);
  }
  
  else{
    color ("RoyalBlue") rndRect(PCBwdth,PCBhght,1.5,2.54,2.54); //PCB
    translate([0,-1.0*25.4,0]) pinHeader(10,true);
    color("white") translate([0,0,2.6/2+1.5]) cube([34.6,46.7,2.6],true); //display frame
    color("black") translate([0,(46.7-35)/2-1.5,2.6/2+0.5+1.5+0.4]) cube([28,35,1],true);
    color("darkgrey") translate([0,-6,-1.7/2]) cube([10,4,1.7],true);//IC
    color("silver") translate([-(14-PCBwdth)/2-9,-(16.5-PCBhght)/2,-1]) cube([14,16.5,2],true);//uSD Card
  }
}
//!extHeader(28);
module extHeader(pins,cntr=true){
  cntrOffSet = cntr ? 2.2/2 : 0;
  hght=1.27*pins+0.41;
  
  echo("ext Header Hght",hght);
  color("darkgrey")translate([4.1/2+(5.3-4.1),0,cntrOffSet]) cube([4.1,hght,2.2],cntr);
  
}
//!battery500();
module battery500(){
  batWdth=29;
  batHgth=36;
  batThck=4.75;
  leadLngth=10;
  
  color("silver") translate([0,0,batThck/2]) cube([batWdth,batHgth,batThck],true);
  color("red") translate([-1.5,batHgth/2+leadLngth,batThck/2]) rotate([90,0,0]) cylinder(d=1.3,h=leadLngth);
  color("black") translate([1.5,batHgth/2+leadLngth,batThck/2]) rotate([90,0,0]) cylinder(d=1.3,h=leadLngth);
}
//!battery2500();
module battery2500(){
  batWdth=51;
  batHgth=65;
  batThck=8;
  leadLngth=10;
  
  color("silver") translate([0,0,batThck/2]) cube([batWdth,batHgth,batThck],true);
  color("red") translate([-1.5,batHgth/2+leadLngth,batThck/2]) rotate([90,0,0]) cylinder(d=1.3,h=leadLngth);
  color("black") translate([1.5,batHgth/2+leadLngth,batThck/2]) rotate([90,0,0]) cylinder(d=1.3,h=leadLngth);
}

module battery2000(){
  batWdth=36;
  batHgth=60;
  batThck=7;
  leadLngth=10;
  
  color("silver") translate([0,0,batThck/2]) cube([batWdth,batHgth,batThck],true);
  color("red") translate([-1.5,batHgth/2+leadLngth,batThck/2]) rotate([90,0,0]) cylinder(d=1.3,h=leadLngth);
  color("black") translate([1.5,batHgth/2+leadLngth,batThck/2]) rotate([90,0,0]) cylinder(d=1.3,h=leadLngth);
}

module battery1200(){
  batWdth=34;
  batHgth=62;
  batThck=5;
  leadLngth=10;
  
  color("silver") translate([0,0,batThck/2]) cube([batWdth,batHgth,batThck],true);
  color("red") translate([-1.5,batHgth/2+leadLngth,batThck/2]) rotate([90,0,0]) cylinder(d=1.3,h=leadLngth);
  color("black") translate([1.5,batHgth/2+leadLngth,batThck/2]) rotate([90,0,0]) cylinder(d=1.3,h=leadLngth);
}
//!switch(false);
module switch(isOn=true){
  
  color("grey") translate([0,0,1.4/2]) cube([6.7,2.6,1.4],true);
  color("black"){
    if (isOn) translate([0.2,-2.6/2-1.4,0]) cube([1.3,1.4,1]);//on
    else translate([-1.3-0.2,-2.6/2-1.4,0]) cube([1.3,1.4,1]);//on
    }
  
}
//!M3Rivet();
module M3Rivet(){
  //RS Expansion insert 
  color("gold")
  translate([0,0,-4.78])
  difference(){
    union(){
      cylinder(h=4.78,d=4);
      translate(0,0,0) cylinder(h=3.78,d=4.22);
    }
    translate([0,0,-fudge/2]) cylinder(h=4.78+fudge,d=2.5);
    translate([0,0,4/2]) cube([0.5,4.5,4+fudge],true);
  }
}

//!miniSpeaker();
module miniSpkr(){
  cylinder(d=28,h=3);
}
//!Si5351();
module Si5351(){
  yOffSet = -(0.85*25.4)/2+(0.1*25.4); //yOffset for Holes and PinHeader
  //adafruit Si5351 Clock Generator Module
  //rndRect(wdth, hght, thick, radius, drill,cntr=true,diff="none",label="none") {
  color("RoyalBlue")
  difference(){
    rndRect(1.2*25.4,0.85*25.4,1.5,0.1*25.4,0);
    translate([-0.5*25.4,yOffSet,-fudge/2]) cylinder(h=1.5+fudge,d=2.5);  
    translate([+0.5*25.4,yOffSet,-fudge/2]) cylinder(h=1.5+fudge,d=2.5);  
  }
  translate([0,yOffSet,0]) pinHeader(7,true);
  
}

//!MPE_192(28,cntrX=false,diff="none");
//!MPE_192(28,cntrX=false,diff="drill");
module MPE_192(pins,cntrX=false,diff="none"){
  
  pinDia=0.41;
  drill=0.65;
  
  bdyWdth=pins*1.27+0.41;
  bdyHght=2.2;
  bdyDpth=2.2;
  
  cntrOffset = cntrX ? [-bdyWdth/2,0,0] : [-(1.27+0.41)/2,-3.4,0];
  
  translate(cntrOffset){
  if (diff=="none"){
   
      color("darkgrey") cube([bdyWdth,bdyDpth,bdyHght]);
      for (i=[(1.27+0.41)/2:1.27:pins*1.27]){//pins
        color("gold") union(){
          translate([i,3.4,bdyHght/2]) rotate([90,0,0]) cylinder(h=6.4,d=pinDia);//horizontal
          translate([i,3.4,bdyHght/2]) rotate([180,0,0]) cylinder(h=3+bdyHght/2,d=pinDia); //vertical
          translate([i,3.4,bdyHght/2]) rotate([90,0,0]) sphere(d=pinDia);
          translate([i,-3,bdyHght/2]) rotate([90,0,0]) sphere(d=pinDia);
          translate([i,3.4,-3]) rotate([90,0,0]) sphere(d=pinDia); 
        }
      }
    }//if
  else {
    for (i=[(1.27+0.41)/2:1.27:pins*1.27]){//drills
      translate([i,3.4,-3+fudge/2]) cylinder(h=3+fudge,d=drill); //vertical
    }
  }
  }
}

//!MPE_196(28);
module MPE_196(pins,cntrX=false,diff="none"){
  
  pinDia=0.41;
  drill=0.65;
  
  bdyWdth=pins*1.27+0.41;
  bdyHght=2.2;
  bdyDpth=2.2;
  
  cntrOffset = cntrX ? [-bdyWdth/2,0,0] : [-(1.27+0.41)/2,-3.4,0];
  
  translate(cntrOffset){
  if (diff=="none"){
   
      color("darkgrey") cube([bdyWdth,bdyDpth,bdyHght]);
      for (i=[(1.27+0.41)/2:1.27:pins*1.27]){//pins
        color("gold") union(){
          translate([i,3.4-0.7,bdyHght/2]) rotate([90,0,0]) cylinder(h=6.4-0.7,d=pinDia);//horizontal
          translate([i,2.2+4.7-3.6,pinDia/2]) rotate([-90,0,0]) cylinder(h=3.6,d=pinDia); //solderpart
          
          translate([i,-3,bdyHght/2])  sphere(d=pinDia); //front sphere
          hull(){
            translate([i,2.7,bdyHght/2])  sphere(d=pinDia); //upper sphere
            translate([i,2.2+4.7-3.6,pinDia/2])  sphere(d=pinDia); //bottom sphere
          }
          translate([i,2.2+4.7,pinDia/2]) sphere(d=pinDia); //back spehre
        }
      }
    }//if
  else {
    for (i=[(1.27+0.41)/2:1.27:pins*1.27]){//drills
      translate([i,3.4,-3+fudge/2]) cylinder(h=3+fudge,d=drill); //vertical
    }
  }
  }
}
//!MPE_094(16,cntr=false);
module MPE_094(pins, center=false, diff="none", thick=8.5){ //receptable housing
  //dual row, SMD
  holeX=0.7;
  holeY=0.7;
  drill=1.02;
  
  cntrOffset = center ? [-pins/4*2.54-0.25,-2.54,0] : [-1.27-0.25,-1.25,0];
  
  pinWdth=0.64;
  pinLen=3.1;
  
  translate(cntrOffset){
    
    if (diff=="housing"){
      translate([-fudge/2,-fudge/2,0]) cube([2.54*(pins/2)+0.5+fudge,5.08+fudge,thick]);
    }
    
    else if (diff=="drill") {
      for (i=[0:2.54:(pins/2-1)*2.54],j=[1.27,1.27+2.54]){
          translate([i+1.27+0.25-holeX/2,j-0.2,-pinLen]) cylinder(h=pinLen, d=1.1);
        }
    }
    else if (diff=="pins"){
      translate([pins/4*2.54+0.25,2.54,-matThck+fudge/2]) rndRect(2.54*pins/2,5.08,thick,1.27,0);
    }
    else {
      difference(){
        color("darkgrey") cube([2.54*(pins/2)+0.5,5.08,8.5]);
        for (i=[0:2.54:(pins/2-1)*2.54],j=[1.27,1.27+2.54]){
          translate([i+1.27+0.25-holeX/2,j-holeY/2,-fudge/2+2]) cube([holeX,holeY,6.5+fudge]);
        }
      }
    
      color("gold")
        for (i=[0:2.54:(pins/2-1)*2.54],j=[1.27,1.27+2.54]){
          translate([i+1.27+0.25-holeX/2,j-0.2,-pinLen]) cube([pinWdth,0.4,pinLen]);
        }
    }//else
  }
}



*MPE_098(var=1,pins=6,diff="none",center=true);
module MPE_098(var=1,pins,center=false,diff="none"){
  //-- variations --
  //single row, low profile (3.7mm)      - 1,2 (Pin Layout 1,2)
  //dual row, low profile                - 3
  //single row, standard profile (7.5mm) - 4,5 (Pin Layout 1,2) 
  //dual row, standard profile           - 6
  
  rows = ((var == 3)||(var==6)) ? 2 : 1;
  bdHght = (var>=4) && (var<=6) ? 7.5 : 3.5;
  cntrOffset = center ? [-pins/(2*rows)*2.54,-1.25*rows,0] : [-1.27,-1.25,0];

  holeX=0.7;
  holeY=0.7;
  drill=1.2;
  
  pinWdth=0.64;
  pinLen=(4.5-holeX)/2;
  
  translate(cntrOffset){
    if (diff=="none"){
      color("darkgrey")
      difference(){
        translate([0,0,0.2]) cube([pins*2.54/rows,2.5*rows,bdHght]); //body
        
        if (rows==1){
          for (i=[0:2.54:(pins-1)*2.54]){
            translate([i+1.27,1.25,(3.7-fudge)/2+0.2]) cube([holeX,holeY,3.7],true);
          }
        }
        else {
          for (r=[-1.27,+1.27]){ //row
            for (c=[0:2.54:(pins-1)*2.54]){ //column
              translate([c+1.27,2.5+r,(3.7-fudge)/2+0.2]) cube([holeX,holeY,3.7],true);
            }
          }
        }
      
      }//difference
      
      if (rows == 1){
        color("gold")
        for (i=[0:2.54*2:(pins-1)*2.54]){
          translate([i-pinWdth/2+1.27,1.25+holeY/2,0]) cube([pinWdth,pinLen,0.2]);
        }
        color("gold")
        for (i=[2.54:2.54*2:(pins-1)*2.54]){
          translate([i-pinWdth/2+1.27,+1.25-holeY/2-pinLen,0]) cube([pinWdth,pinLen,0.2]);
        }
      }
      else{
        color("gold")
        for (r=[-pinLen+2.5-1.27-holeY/2,2.5+1.27+holeY/2]){
          for (c=[0:2.54:(pins-1)*2.54/2]){
            translate([c-pinWdth/2+1.27,r,0]) cube([pinWdth,pinLen,0.2]);
          }
        }
      }
      
    } //if none
    else if (diff=="drill"){
      for (i=[0:2.54:(pins-1)*2.54]){
          #translate([i+1.27,1.25,-thick+fudge/2]) cylinder(h=thick,d=drill);
      }
    }// if drill
  }
}

//!duraClikRA(2,"housing");
module duraClikRA(pos,diff="none"){
  //Molex DuraClik Right Angle
  A=4+2*pos;
  ovHght=6.4;
  ovDpth=9.4;
  resess=[4,2.4+fudge,2.3+fudge];
  plug=[1+2*pos,5+fudge,4.7];
  plugZ=0.7;
  

  translate([0,ovDpth/2,0])
  if (diff=="housing"){
    translate([0,0,ovHght/2]) cube([A+fudge,ovDpth+fudge,ovHght+fudge],true);
  }
  
  else {
   color("GhostWhite")
    difference(){
      translate([0,0,ovHght/2]) cube([A,ovDpth,ovHght],true);//body
      translate([0,(-ovDpth+plug[1])/2-fudge,plug[2]/2+plugZ])
        difference(){//plug
          cube(plug,true);
          translate([0,-plug[1]/2+0.5,plug[2]/2-0.25+fudge]) cube([1.8,1,0.5],true);
        }
       translate([0,ovDpth/2-resess[1]/2+fudge,resess[2]/2-fudge]) cube(resess,true);
       translate([0,(ovDpth-resess[1])/2+fudge,(ovHght+resess[2]-fudge)/2]) cube([A+fudge,resess[1],ovHght-resess[2]+2*fudge],true);
    }
  }
}

//!duraClik(2);
module duraClik(pos=2){
  A= (pos>2) ? 6.6+2*pos : 10.9;
  B= (pos>2) ? 3.7+pos*2 : 8;
  C= (pos>6) ? pos*2-0.9 : (pos>2) ? pos*2 : 0;
  D= (pos>5) ? 11.8 : (pos>2) ? -0.2+2*pos : 6.3;
  
  ovDpth=7.8;
  
  
  baseThck=3;
  scktThck=5.05;
  ovHght=baseThck+scktThck;
  resess=[4.3,1.6+fudge,7.2+fudge]; //resess
  
  iLckDpth=3;
  
  plug=[1+2*pos,4.7,5+fudge];
  plgY=2.3;
  
  echo("A,B,C,D",A,B,C,D);
  color("GhostWhite")
  difference(){
    union(){
      translate([0,0,baseThck/2]) cube([A,ovDpth,baseThck],true); //base
      translate([0,0,baseThck+(scktThck/2)-fudge/2]) cube([B-2,ovDpth,scktThck+fudge],true); //socket
      translate([0,0,baseThck+(scktThck/2)-fudge/2]) cube([B,iLckDpth,scktThck+fudge],true); //flange
    }
    translate([0,-(ovDpth-plug[1])/2+plgY,ovHght-plug[2]/2+fudge]) 
      difference(){
        cube(plug,true); //plug
        translate([0,-plug[1]/2+0.24,plug[2]/2-0.5+fudge]) cube([1.8,0.5,1],true);
      }
    if (C) {
      translate([-C/2,-(ovDpth)/2-fudge,-fudge/2]) cube([(C-D)/2,2.3,scktThck+fudge]);
      translate([D/2,-(ovDpth)/2-fudge,-fudge/2]) cube([(C-D)/2,2.3,scktThck+fudge]); 
    }
    else translate([0,-(ovDpth-resess[1])/2-fudge,resess[2]/2-fudge]) cube(resess,true); //resess
  
  }
  
}
//!extPCB(50, 100, size="none",yOffset=0);
module extPCB(width, height, thick="1.5",size="input"){
  //PCB-000059-001
  //pcbConYpos //Offset Board Lower Edge to Con center
  conWdth=36;
  
  pcbSize= size=="min" ? [20,conWdth+2*stdRad,thick] : [width, height, thick];
  
  yOffset = (height/2)>pcbConYpos2 ? (height/2)-pcbConYpos2 : 0;
  echo("Y-Offset",yOffset);
  
  //translate([-width/2,0,1.5]) rotate([0,0,-90])MPE_196(28,cntrX=true);
  //rndRect(wdth, hght, thick, radius, drill,cntr=true,diff="none",label="none") {
  color("darkgreen")
  difference(){
    translate([0,yOffset,0]) rndRect(width,height,thick,stdRad,0);
    //translate([0,0,pcbSize[2]]) rotate([0,0,-90])MPE_192(28,cntrX=true,diff="drill");
    translate([-width/2,-height/2,-fudge/2]) rndRect(12,height-(28*1.27+0.41),thick+fudge,stdRad,0);
    translate([-width/2,height/2,-fudge/2]) rndRect(12,height-(28*1.27+0.41),thick+fudge,stdRad,0);
    translate([-width/2+6,-height/2,-fudge/2]) rotate([0,0,180]) rndCorner(stdRad,thick+fudge,false);
    translate([-width/2+6,height/2,-fudge/2]) rotate([0,0,90]) rndCorner(stdRad,thick+fudge,false);
  }
}

*I2S_Mic();
module I2S_Mic(){
  //adafruit I2S MEMS Microphone
  // Prod. ID: 
  width=0.65*25.4;
  height=0.5*25.4;
  thick=1.6;
  
  translate([0,height/2-2.54,2.55]){
    color("darkblue")
      difference(){
        rndRect(width,height,thick,2.54,0);
        translate([-width/2+2.54,height/2-2.54,-fudge/2]) cylinder(d=2.54,h=thick+fudge);
        translate([width/2-2.54,height/2-2.54,-fudge/2]) cylinder(d=2.54,h=thick+fudge);
        translate([0,-height/2+0.32*25.4,-fudge/2]) cylinder(d=0.75,h=thick+fudge);
      }
    translate([0,-height/2+2.54,0]) pinHeader(6,center=true);
  }
}


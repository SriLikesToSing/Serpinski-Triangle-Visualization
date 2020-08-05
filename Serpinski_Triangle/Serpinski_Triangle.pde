int iter = 1;
    float global_x1 = 0;
    float global_y1 =  560;
    float global_x2 = 360;
    float global_y2 = 100;
    float global_x3 = 720;
    float global_y3 =  560;


    float main_x1 =  (global_x1 + global_x2)/2;
    float main_y1 = (global_y1 + global_y2)/2;
    float main_x2 = (global_x1 + global_x3)/2;
    float main_y2 = (global_y1 + global_y3)/2;
    float main_x3 = (global_x2 + global_x3)/2;
    float main_y3 = (global_y2 + global_y3)/2;

    float scaleFactor, translateX, translateY;
void setup(){
    size(720, 720);
    background(0, 255);
    scaleFactor = 1;
    translateX = 0;
    translateY = 0;
    smooth();
    frameRate(1);

}
void draw(){
int nibba = 0;
pushMatrix();
translate(translateX, translateY);
scale(scaleFactor);

mousePressed();

popMatrix();





}
void first_tri(){
   fill(255);
   triangle( global_x1,  global_y1,  global_x2,  global_y2,  global_x3,  global_y3);
}
void second_tri(){
   fill(0);
   triangle(main_x1, main_y1, main_x2, main_y2, main_x3, main_y3);
}
 void upsidedowntri(float x1, float y1, float x2, float y2, float x3, float y3, float layer, float layer_limit){
    if(layer == layer_limit){
        println("bruh");
    }
        println("bruhhhh");
         triangle((x1+x2)/2+(x1-x3)/2, (y1+y2)/2+(y1-y3)/2, (x1+x2)/2+ (x2-x3)/2, (y1+y2)/2 + (y2-y3)/2, (x1+x2)/2, (y1+y2)/2  );
         triangle((x1+x3)/2+(x1-x2)/2, (y1+y3)/2+(y1-y2)/2, (x1+x3)/2, (y1+y3)/2, (x1+x3)/2+(x3-x2)/2, (y1+y3)/2+(y3-y2)/2);
         triangle((x2+x3)/2, (y2+y3)/2, (x2+x3)/2+(x2-x1)/2, (y2+y3)/2+(y2-y1)/2, (x2+x3)/2+(x3-x1)/2, (y2+y3)/2+(y3-y1)/2);
    if(layer<layer_limit){
        upsidedowntri((x1+x2)/2+(x1-x3)/2, (y1+y2)/2+(y1-y3)/2, (x1+x2)/2+ (x2-x3)/2, (y1+y2)/2 + (y2-y3)/2, (x1+x2)/2, (y1+y2)/2, layer + 1, layer_limit);
        upsidedowntri((x1+x3)/2+(x1-x2)/2, (y1+y3)/2+(y1-y2)/2, (x1+x3)/2, (y1+y3)/2, (x1+x3)/2+(x3-x2)/2, (y1+y3)/2+(y3-y2)/2, layer + 1, layer_limit);
        upsidedowntri((x2+x3)/2, (y2+y3)/2, (x2+x3)/2+(x2-x1)/2, (y2+y3)/2+(y2-y1)/2, (x2+x3)/2+(x3-x1)/2, (y2+y3)/2+(y3-y1)/2, layer + 1, layer_limit);
    }
}
void mousePressed(){
    if (iter == 1  ){
        first_tri();
        iter++;
    }else if(iter == 2){
        second_tri();
        //make the variables equal the first upside down triangle
        iter++;

    }else if(iter == 3){
        upsidedowntri( main_x1, main_y1, main_x2, main_y2, main_x3, main_y3, 0, 1);
        iter++;
    }else if(iter == 4){
        upsidedowntri( main_x1, main_y1, main_x2, main_y2, main_x3, main_y3, 0, 2);
        iter++;
    }else if(iter == 5){

        upsidedowntri( main_x1, main_y1, main_x2, main_y2, main_x3, main_y3, 0, 3);
        iter++;
    }else if(iter == 6){

        upsidedowntri(main_x1, main_y1, main_x2, main_y2, main_x3, main_y3, 0, 4);
        iter++;
    }else if(iter ==7){

        upsidedowntri(main_x1, main_y1, main_x2, main_y2, main_x3, main_y3, 0, 5);
        iter++;
    }else if(iter ==8){

        upsidedowntri(main_x1, main_y1, main_x2, main_y2, main_x3, main_y3, 0, 6);
        iter++;
    }else if(iter == 9){
        iter = -1;
    }else if(iter == -1){
        iter = 0;
    }
}
void keyPressed()
{
  if (key == 'r')
  {
    scaleFactor = 1;

    translateX = 0;

    translateY = 0;
  }
}

void mouseWheel(MouseEvent e)
{
  scaleFactor += e.getAmount() / 100;

  translateX -= e.getAmount() * mouseX / 100;

  translateY -= e.getAmount() * mouseY / 100;
}

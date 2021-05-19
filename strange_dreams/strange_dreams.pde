
void setup(){
    fullScreen();
    background(0);
    stroke(255);
    noFill();
    
    float subdivisions = 500;

    // float offset = -TWO_PI*norm(mouseX, 0, width);
    // float multiplier = 100*norm(mouseY,0,height);

    float offset = -random(0,TWO_PI);
    float multiplier = random(0,1);

    float increment = width/subdivisions;
    for(float i = 0; i<subdivisions; i++){

        float input = multiplier*(offset + TWO_PI*norm(i,0,subdivisions));
        float lineLength = (height/2)*(1/cos(input));
        //float numInnerLines = round(20*Math.abs(1-norm(i,subdivisions/2,subdivisions)));

        //line(i*increment, height/2, i*increment, height/2 - lineLength);
        ellipse(i*increment, height/2-lineLength/2,lineLength,i%100);
        //dreamcatcher(i*increment,height/2 - lineLength/2,lineLength/2,numInnerLines,i%10);
    }
}


void dreamcatcher(float x, float y, float radius, int n, float mult){
    //stroke("Yellow");
    circle(x, y, radius*2);
    float angleincrement = (TWO_PI)/n;
    //let dots = [];
  /*
     for (let i = 0; i < n; i++) {
       const angle = (i / n) * TWO_PI;
       const dotx = cos(angle) * r + width / 2;
       const doty = sin(angle) * r + height / 2;
       dots.push(createVector(dotx, doty));
     }
  */
 stroke(255);
    for(float i=0; i<n; i++)
    {
      float skip =  mult*(i%n); 
      float startX = x + radius*cos(angleincrement*i);
      float startY = y + radius*sin(angleincrement*i);
      float connectToX = x + radius*cos(angleincrement*(i+skip));
      float connectToY = y + radius*sin(angleincrement*(i+skip));
      stroke(255);
      line(startX, startY, connectToX, connectToY);
    }
}

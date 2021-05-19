class Tree{
  ArrayList<Walker> tree;
  Walker main;
  int branches;
  public boolean trunkComplete;
  public boolean complete;
  
  Tree(float x, float y, float r){
    trunkComplete = false;
    complete = false;
    branches = 1;
    main = new Walker(x, y, r); 
    tree = new ArrayList<Walker>();
    tree.add(main);
  }
  
  void drawTree(){
    while(!trunkComplete){
      update(); 
    }
    drawTrunk();
    //if(trunkComplete && !complete){
      drawLeaves();
    //}
  }
  void drawTrunk(){
     for (int i = tree.size() -1; i>=0;i--){
        Walker cur = tree.get(i);
        cur.drawWalker();
    }
  }
  void drawLeaves(){//to be called only after completed
    strokeWeight(1.5);
    noFill();
    for (int i = tree.size() -1; i>=0;i--){
        Walker cur = tree.get(i);
        if(!cur.split){
          PVector pos = cur.getEndpoint();
          stroke(0,random(100,200),0);
          ellipse(pos.x, pos.y, random(8*Walker.segmentLength), random(2*Walker.segmentLength));
          ellipse(pos.x, pos.y, random(8*Walker.segmentLength), random(2*Walker.segmentLength));
          ellipse(pos.x, pos.y, random(8*Walker.segmentLength), random(2*Walker.segmentLength));
        }
    }
    complete = true;
  }
  
  void update(){
      for (int i = tree.size() -1; i>=0;i--){
        Walker cur = tree.get(i);
        if(cur.cangrow){
          cur.update();
        }
        else if (!cur.split && !trunkComplete){
          PVector splitpoint = cur.getEndpoint();
          tree.add(new Walker(splitpoint.x, splitpoint.y, +PI/8));
          tree.add(new Walker(splitpoint.x, splitpoint.y, -PI/8));
          cur.split = true;
        }
      }
    if(tree.size()>100){
      trunkComplete = true;
    }
  }

}

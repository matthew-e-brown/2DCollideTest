# 2DCollideTest
Testing collisions with rotated rectangles.

This borrows from the [p5.js](https://p5js.org) library, p5.collide.js:

``` javascript
p5.prototype.collideLineLine = function(x1, y1, x2, y2, x3, y3, x4, y4,calcIntersection) {

  var intersection;

  // calculate the distance to intersection point
  var uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  var uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));

  // if uA and uB are between 0-1, lines are colliding
  if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {

    if(this._collideDebug || calcIntersection){
      // calc the point where the lines meet
      var intersectionX = x1 + (uA * (x2-x1));
      var intersectionY = y1 + (uA * (y2-y1));
    }

    if(this._collideDebug){
      this.ellipse(intersectionX,intersectionY,10,10);
    }

    if(calcIntersection){
      intersection = {
        "x":intersectionX,
        "y":intersectionY
      }
      return intersection;
    }else{
      return true;
    }
  }
  if(calcIntersection){
    intersection = {
      "x":false,
      "y":false
    }
    return intersection;
  }
  return false;
}
```

function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;

}

const mo = new MovingObject(
  { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00"}
);

MovingObject.prototype.draw = function (ctx) {
  ctx.fillStyle = this.color;

  // let circ = new Circle(this.pos[0],this.pos[1],this.radius,this.color);
  console.log(this.pos[0],
  this.pos[1],
  this.radius,this.color);
  ctx.beginPath();
  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2*Math.PI
  );
ctx.fill();
ctx.stroke();
//   ctx.fillStyle = "#FF0000";
// ctx.fillRect(20, 20, 150, 100);

};



const Circle =  function (centerX, centerY, radius, color) {
  this.centerX = centerX;
  this.centerY = centerY;
  this.radius = radius;
  this.color = color;
};

document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementsByTagName("canvas")[0];

  const ctx = canvasEl.getContext("2d");
  mo.draw(ctx);

});

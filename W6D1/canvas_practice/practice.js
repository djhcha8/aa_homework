document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("mycanvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");
  ctx.fillStyle = "black";
  ctx.fillRect(0, 0, 400, 400);

  ctx.beginPath();
  ctx.arc(200, 200, 50, 0, 2*Math.PI, true);
  ctx.strokeStyle = "red";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "white";
  ctx.fill();
});

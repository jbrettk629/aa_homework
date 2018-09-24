document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('myCanvas');
  canvas.width = 500;
  canvas.height = 500;
  const ctx = canvas.getContext('2d');
  ctx.fillStyle('red');
  ctx.fillRect(10, 10, 500, 500);
});

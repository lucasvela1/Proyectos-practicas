const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');
const hills = [
    { x: 300, radius: 50, height: 0 }, // colina 1
    { x: 550, radius: 60, height: 0 }  // colina 2
  ];


let arrows = [];
let enemies = [];
let castleHealth = 100;
let score = 0; // Puntuación del jugador
let lastShotTime = 0; // Para controlar el intervalo entre disparos
const shootCooldown = 500;

// Coordenadas del castillo
const castle = { x: 50, y: 300 };

// Dibuja un montículo y el castillo
function drawCastle() {
  // Montículo
  ctx.fillStyle = '#4d914d';
  ctx.beginPath();
  ctx.arc(castle.x, castle.y + 50, 80, Math.PI, 0);
  ctx.fill();

  // Castillo (bloque gris simple)
  ctx.fillStyle = 'gray';
  ctx.fillRect(castle.x - 30, castle.y - 80, 60, 80);
}

// Dibuja y actualiza la barra de vida
function updateHealthBar() {
  const healthBar = document.getElementById('health');
  healthBar.style.width = castleHealth + '%';
}

function drawHills() {
    ctx.fillStyle = '#3a773a';
    hills.forEach(hill => {
      ctx.beginPath();
      ctx.arc(hill.x, castle.y - hill.height, hill.radius, Math.PI, 0);
      ctx.fill();
    });
  }

// Enemigo
class Enemy {
  constructor() {
    this.x = 800;
    this.y = 300;
    this.size = 10;
    this.speed = 0.5 + Math.random();
    this.alive = true;
  
  }

  update() {
    let onHill = false;

    // Verificar si el enemigo está sobre una colina
    hills.forEach(hill => {
        const dx = this.x - hill.x; // Distancia horizontal al centro de la colina
        if (Math.abs(dx) < hill.radius) {
            onHill = true;
            this.speed = 0.5; // Velocidad reducida al moverse sobre la colina
            /*if (this.x < hill.x) {
                this.speed = 0.5; // Velocidad reducida al moverse hacia la colina
            } else {
                this.speed = 0.5 + Math.random(); // Velocidad normal al moverse hacia el castillo */
            // Calcular la posición vertical en la colina usando la ecuación de un círculo
            const hillY = castle.y - hill.height - Math.sqrt(hill.radius ** 2 - dx ** 2); 
            this.y = hillY; // Ajustar la posición vertical del enemigo
        }
    });

    // Si no está sobre una colina, mantener la posición base
    if (!onHill) {
        this.y = 300;
        this.speed = 0.5 + Math.random(); // Velocidad normal al moverse hacia el castillo
    }

    // Movimiento horizontal
    this.x -= this.speed;

    // Si el enemigo alcanza el castillo, reducir la salud
    if (this.x < castle.x) {
        castleHealth -= 5;
        this.alive = false;
    }
}

draw() {
    ctx.fillStyle = 'black';
    ctx.fillRect(this.x - this.size / 2, this.y - this.size, this.size, this.size);
}
}

// Flecha
class Arrow {
  constructor(targetX, targetY) {
    this.x = castle.x;
    this.y = castle.y - 60;
    this.vx = (targetX - this.x) / 40;
    this.vy = (targetY - this.y) / 40;
    this.gravity = 0.3;
    this.alive = true;
  }

  update() {
    this.x += this.vx;
    this.y += this.vy;
    this.vy += this.gravity;

    // Colisión con enemigos
    enemies.forEach(enemy => {
      if (enemy.alive &&
        this.x > enemy.x - enemy.size / 2 &&
        this.x < enemy.x + enemy.size / 2 &&
        this.y > enemy.y - enemy.size &&
        this.y < enemy.y) {
        enemy.alive = false;
        this.alive = false;
        score+=1;   
      }
    });

    // Salida del canvas
    if (this.x > 800 || this.y > 400) {
      this.alive = false;
    }
  }

  draw() {
    ctx.strokeStyle = 'brown';
    ctx.beginPath();
    ctx.moveTo(this.x, this.y);
    ctx.lineTo(this.x - this.vx * 2, this.y - this.vy * 2);
    ctx.stroke();
  }
}

canvas.addEventListener('click', e => {
    const now = Date.now();
    if (now - lastShotTime >= shootCooldown) {
      const rect = canvas.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;
      arrows.push(new Arrow(x, y));
      lastShotTime = now;
    }
  });
  

function spawnEnemy() {
  enemies.push(new Enemy());
}

function update() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  drawCastle();
  drawHills(); 

  // Enemigos
  enemies.forEach(enemy => enemy.update());
  enemies = enemies.filter(e => e.alive);
  enemies.forEach(enemy => enemy.draw());

  // Flechas
  arrows.forEach(arrow => arrow.update());
  arrows = arrows.filter(a => a.alive);
  arrows.forEach(arrow => arrow.draw());

  updateHealthBar();

  if (castleHealth <= 0) {
    alert('¡Has perdido el castillo!');
    document.location.reload();
  }

  ctx.fillStyle = 'white';
  ctx.font = '20px Arial';
  ctx.fillText('Puntuación: ' + score, 650, 30);

  requestAnimationFrame(update);
}

// Oleadas infinitas
setInterval(spawnEnemy, 1000);
update();

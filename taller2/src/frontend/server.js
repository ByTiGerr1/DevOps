const express = require('express');
const app = express();
const port = 3000;

app.use(express.static('public'));

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/public/index.html');
});

app.get('/health', (req, res) => {
  res.json({status: 'UP'});
});

// Duplicated code for SonarQube detection
function calculateSomething(a, b) {
    if (a > b) {
        return a - b;
    } else {
        return b - a;
    }
}

function calculateSomethingElse(x, y) {
    if (x > y) {
        return x - y;
    } else {
        return y - x;
    }
}

app.listen(port, () => {
  console.log(`Frontend app listening at http://localhost:${port}`);
});

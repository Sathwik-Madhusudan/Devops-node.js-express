const express = require('express');
const app = express();

const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('<h2>Hey there</h2>');
});

app.listen(port, 'localhost', () => {
  console.log(`Server running at http://localhost:${port}/`);
});
const express = require('express');
const path = require('path');

const app = express();
const port = process.env.PORT || 3000;

// Define la ubicación de los archivos estáticos (HTML, CSS, etc.).
app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public/index.html'));
});

app.listen(port, () => {
  console.log(`Servidor Express escuchando en el puerto ${port}`);
});
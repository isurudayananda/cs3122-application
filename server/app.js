require('dotenv').config();

const express = require('express');
const cors = require('cors');

const app = express();

const db = require('./db');

db.sync()
  .then(() => console.log('Tables have been created'))
  .catch(error => console.error('Unable to create tables', error));

const authController = require('./controllers/authController');
const homeController = require('./controllers/homeController');
const reactController = require('./controllers/reactController');

app.use(cors()); 
app.use(express.json());

app.use('/auth', authController);
app.use('/', homeController);
app.use('/react', reactController);

app.listen(8000, () => console.log('Server started on port 8000'));

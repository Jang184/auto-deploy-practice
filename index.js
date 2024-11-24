const express = require('express');
const cors = require('cors');

const app = express();
const port = process.env.PORT || 8080;

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
    res.json({ message: 'Welcome to the server!' });
});

app.get('/ping', (req, res) => {
    res.json({
        status: 'success',
        message: 'pong',
        timestamp: new Date().toISOString()
    });
});

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

module.exports = app;
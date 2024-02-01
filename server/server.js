// Express is the backend framework
const express = require('express')

const app = express();
const port = 5000;


app.get('/api', (req, res) => {
    res.json({"users": ["user!", "powerUser!"]})
});

app.listen(port, () => {console.log("Server started on port " + port)});
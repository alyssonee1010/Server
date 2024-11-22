// frontend.js - Express server
const express = require('express');
const net = require('net');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());
app.use(express.static('public'));

const TCP_SERVER_HOST = '127.0.0.1';
const TCP_SERVER_PORT = 8080;

// Endpoint to test server response
app.post('/simulate', (req, res) => {
  const client = new net.Socket();
  const startTime = process.hrtime();
  const payload = req.body.message || 'Test Message';
  let responseTime;

  client.setTimeout(10000); // 10 second timeout

  client.connect(TCP_SERVER_PORT, TCP_SERVER_HOST, () => {
    client.write(payload);
  });

  client.on('data', (data) => {
    const diff = process.hrtime(startTime);
    responseTime = (diff[0] * 1e9 + diff[1]) / 1e6; // Convert to milliseconds
    res.json({ 
      response: data.toString(),
      responseTime: responseTime.toFixed(2)
    });
    client.destroy();
  });

  client.on('timeout', () => {
    const diff = process.hrtime(startTime);
    responseTime = (diff[0] * 1e9 + diff[1]) / 1e6;
    res.status(408).json({ 
      error: 'Connection timed out',
      responseTime: responseTime.toFixed(2)
    });
    client.destroy();
  });

  client.on('error', (err) => {
    const diff = process.hrtime(startTime);
    responseTime = (diff[0] * 1e9 + diff[1]) / 1e6;
    res.status(500).json({ 
      error: err.message,
      responseTime: responseTime.toFixed(2)
    });
    client.destroy();
  });
});

const HTTP_PORT = 3000;
app.listen(HTTP_PORT, () => {
  console.log(`Frontend server started on http://localhost:${HTTP_PORT}`);
});

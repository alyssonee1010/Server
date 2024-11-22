// index.js - Main server file
const express = require('express');
const net = require('net');
const cors = require('cors');
const path = require('path');

const app = express();

// Middleware setup
app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

const TCP_SERVER_HOST = '127.0.0.1';
const TCP_SERVER_PORT = 8080;

// Test endpoint
app.get('/test', (req, res) => {
    res.json({ status: 'Server is running' });
});

// Simulation endpoint
app.post('/simulate', (req, res) => {
    const client = new net.Socket();
    const startTime = process.hrtime();
    const payload = req.body.message || 'Test Message';
    let responseTime;

    client.setTimeout(10000);

    client.connect(TCP_SERVER_PORT, TCP_SERVER_HOST, () => {
        client.write(payload);
    });

    client.on('data', (data) => {
        const diff = process.hrtime(startTime);
        responseTime = (diff[0] * 1e9 + diff[1]) / 1e6;
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
app.listen(HTTP_PORT, '0.0.0.0', () => {
    console.log(`Server running at http://localhost:${HTTP_PORT}`);
});
const net = require('net');
const fs = require('fs');

const logStream = fs.createWriteStream('server-metrics.log', { flags: 'a' });

const server = net.createServer((socket) => {
  const clientAddress = `${socket.remoteAddress}:${socket.remotePort}`;
  const startTime = process.hrtime();
  
  const logEvent = (event, details = '') => {
    const diff = process.hrtime(startTime);
    const timeElapsed = (diff[0] * 1e9 + diff[1]) / 1e6;
    const logEntry = `${new Date().toISOString()} - ${event} - Client: ${clientAddress} - Time: ${timeElapsed.toFixed(2)}ms ${details}\n`;
    logStream.write(logEntry);
    console.log(logEntry.trim());
  };

  logEvent('Connection established');

  socket.on('data', (data) => {
    logEvent('Data received', `Size: ${data.length} bytes`);
    
    // Simulate processing time
    setTimeout(() => {
      socket.write(`Processed request in ${Math.random() * 1000}ms`);
      socket.end();
    }, Math.random() * 1000);
  });

  socket.on('end', () => {
    logEvent('Connection ended');
  });

  socket.on('error', (err) => {
    logEvent('Error occurred', err.message);
  });
});

const PORT = 8080;
server.listen(PORT, () => {
  const startLog = `${new Date().toISOString()} - Server started on port ${PORT}\n`;
  logStream.write(startLog);
  console.log(startLog.trim());
});
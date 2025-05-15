const { Server } = require('socket.io');
const io = new Server(3000, {
    cors: {
        origin: "*",
    }
});

io.on('connection', (socket) => {
    console.log('🟢 Client connected:', socket.id);

    socket.on('server', (data) => {
        console.log('📨 Message received:', data);
    });

    const intervalId = setInterval(() => {
        socket.emit('client', 'Hello Client');
    }, 10000); // 10초마다


    socket.on('disconnect', () => {
        console.log('🔴 Client disconnected:', socket.id);
    });
});
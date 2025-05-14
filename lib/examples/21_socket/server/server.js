const { Server } = require('socket.io');
const io = new Server(3000, {
    cors: {
        origin: "*",
    }
});

io.on('connection', (socket) => {
    console.log('🟢 Client connected:', socket.id);

    socket.on('message', (data) => {
        console.log('📨 Message received:', data);
        socket.emit('message', `Echo: ${data}`);
    });

    socket.on('disconnect', () => {
        console.log('🔴 Client disconnected:', socket.id);
    });
});
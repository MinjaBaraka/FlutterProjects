import express from 'express';
import cors from 'cors';
import { createServer } from 'http';
import { Server } from 'socket.io';
import userRoute from './routes/userRoute.js';

const app = express();
const httpServer = createServer(app);
const io = new Server(httpServer, {
  cors: {
    origin: '*', 
    methods: ['GET', 'POST']
  }
});

// Middleware
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());

// Routes
app.use('/api', userRoute);

// Socket.IO
io.on('connection', (socket) => {
  console.log('a user connected:', socket.id);

  // Listen for events from the client
  socket.on('listenEvent', (data) => {
    console.log('Received listenEvent:', data);
    // Emit an event back to the client
    socket.emit('listenResponse', { message: 'This is a response from the server' });
  });

  // Handle disconnect
  socket.on('disconnect', () => {
    console.log('user disconnected:', socket.id);
  });
});

const port = process.env.PORT || 3000;
httpServer.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

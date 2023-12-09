import express, { Express, Request, Response } from 'express';
import socket, { Server, Socket } from 'socket.io';
import { createServer } from 'http';
const port: number = 8000;
const app: Express = express();
const httpServer = createServer(app);
const io: Server = new Server(httpServer);
io.on('connection', async (socket: Socket) => {
  console.log(`${socket.id} connected`);
  socket.on(
    'sendMessage',
    (data: { message: String; id: String; date: Date }) => {
      console.log(data);
      io.emit('receivedMessage', data);
    }
  );
});

app.get('/', (req: Request, res: Response) => {
  res.json({ data: ' I am Working' });
});

httpServer.listen(port, () => {
  console.log(`App listening on port : ${port}`);
});

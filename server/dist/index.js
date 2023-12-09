"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = __importDefault(require("express"));
const socket_io_1 = require("socket.io");
const http_1 = require("http");
const file_handler_1 = __importDefault(require("./file_handler"));
const port = 8000;
const app = (0, express_1.default)();
const httpServer = (0, http_1.createServer)(app);
const io = new socket_io_1.Server(httpServer);
io.on('connection', (socket) => __awaiter(void 0, void 0, void 0, function* () {
    console.log(`${socket.id} connected`);
    const data = yield (0, file_handler_1.default)();
    // socket.on('readFile', async () => {
    //   for (const line of data!.toString('ascii').split('\n')) {
    //     await sleep(1000);
    //     socket.emit('newData', line);
    //   }
    // });
    // socket.emit('newData', 'Random Data');
    // socket.on(
    //   'sendMessage',
    //   (data: { message: String; id: String; date: Date }) => {
    //     console.log(data);
    //     io.emit('receivedMessage', data);
    //   }
    // );
}));
app.get('/', (req, res) => {
    res.json({ data: ' I am Working' });
});
httpServer.listen(port, () => {
    console.log(`App listening on port : ${port}`);
});
const DEF_DELAY = 1000;
function sleep(ms) {
    return new Promise((resolve) => setTimeout(resolve, ms || DEF_DELAY));
}

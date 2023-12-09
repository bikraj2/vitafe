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
Object.defineProperty(exports, "__esModule", { value: true });
const jsonl_db_1 = require("jsonl-db");
const glob_1 = require("glob");
function readfunc() {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            // const file: FileHandle = await open('./2579048_events.jsonl');
            // console.log(file);
            const jsfiles = yield (0, glob_1.glob)(`./2579048_events.jsonl`, {
                ignore: 'node_modules/**',
            });
            console.log('Emitting', jsfiles[0]);
            const eventsFile = (0, jsonl_db_1.jsonlFile)(jsfiles[0]);
            eventsFile.read((line) => console.log(line));
        }
        catch (err) {
            console.log(err);
        }
    });
}
exports.default = readfunc;

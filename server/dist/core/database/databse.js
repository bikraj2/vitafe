import mongoose from 'mongoose';
export const dbConnect = async (uri) => {
    try {
        await mongoose.connect(uri);
    }
    catch (error) {
        console.log(error);
        throw error;
    }
};
//# sourceMappingURL=databse.js.map
import mongoose from 'mongoose';

export const dbConnect = async (uri: string) => {
  try {
    await mongoose.connect(uri);
  } catch (error) {
    console.log(error);
    throw error;
  }
};

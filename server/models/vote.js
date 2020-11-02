const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const voteSchema = new Schema(
  {
    user: { type: Schema.Types.ObjectId, required: true },
    vote: { type: Number, required: true }
  },
  { _id: false }
);

voteSchema.set('autoCreate', true)
module.exports = voteSchema

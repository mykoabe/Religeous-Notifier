import mongoose from 'mongoose';
const ScheduleFields = {
  createdby: {
    type: String,
    default: null,
    required: true,
  },
  dateofcreation: {
    type: Date,
    default: Date.now,
  },
  programs: {
    type: [],
    default: null,
    required: true,
  },
};


const ScheduleSchema = mongoose.Schema(ScheduleFields);

const ScheduleModel = mongoose.model("schedule", ScheduleSchema);

export default ScheduleModel
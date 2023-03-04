import mongoose from 'mongoose';

const HostSchema = new mongoose.Schema(
  {
    leaderId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'User'
    },
    images: {
      type: Array,
      default: []
    },
    title: {
      type: String,
      default: ''
    },
    desc: {
      type: String,
      default: ''
    },
    rating: {
      type: Number,
      default: 0
    },
    reviews: {
      type: Array,
      default: []
    },
    interestedList: {
      type: Array,
      default: []
    },
    itenaryRoute: {
      type: Array,
      default: []
    },
    itenaryDates: {
      type: Array,
      default: []
    },
    itenaryPrice: {
      type: Number,
      default: 0
    },
    totalSpots: {
      type: Number,
      default: 0
    },
    bookedSpots: {
      type: Number,
      default: 0
    },
    itenaryPreferences: {
      type: Array,
      default: []
    }
  },
  { timestamps: true }
);

const Host = mongoose.model('Host', HostSchema);
export default Host;

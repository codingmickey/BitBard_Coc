import mongoose from 'mongoose';

const UserSchema = new mongoose.Schema(
  {
    firstName: {
      type: String,
      min: 2,
      max: 50
    },
    lastName: {
      type: String,
      min: 2,
      max: 50
    },
    email: {
      type: String,
      max: 50,
      unique: true
    },
    password: {
      type: String
    },
    picturePath: {
      type: String,
      default: ''
    },
    friends: {
      type: Array,
      default: []
    },
    visitedCountries: {
      type: Array,
      default: []
    },
    visitedCountryCodes: {
      type: Array,
      default: []
    },
    identityVerified: {
      type: Boolean,
      default: false
    },
    phoneVerified: {
      type: Boolean,
      default: false
    },
    role: {
      type: String,
      enum: ['user', 'host', 'admin'],
      default: 'user'
    },
    datesAvailable: {
      type: Array,
      default: []
    },
    description: {
      type: String,
      default: ''
    },
    languages: {
      type: Array,
      default: []
    },
    matches: {
      type: Array,
      default: []
    }
  },
  { timestamps: true }
);

const User = mongoose.model('User', UserSchema);
export default User;

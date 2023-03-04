import express from 'express';
import { getFeedPosts, getPostsOnLocation, getUserPosts, likePost } from '../controllers/posts.controller.js';
import { verifyToken } from '../middleware/auth.js';

const router = express.Router();

/* READ */
router.get('/', verifyToken, getFeedPosts);
router.get('/:userId/posts', verifyToken, getUserPosts);
router.get('/location/:location/posts', getPostsOnLocation);

/* UPDATE */
router.patch('/:id/like', verifyToken, likePost);

export default router;

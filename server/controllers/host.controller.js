import Host from '../models/Host.js';

/* CREATE */
export const createHost = async (req, res) => {
  try {
    const hostParams = { ...req.body };

    const newHost = new Host(hostParams);

    await newHost.save();

    res.status(201).json(newHost);
  } catch (err) {
    res.status(409).json({ message: err.message });
  }
};

/* READ */
export const getHosts = async (req, res) => {
  try {
    const post = await Host.find();
    res.status(200).json(post);
  } catch (err) {
    res.status(404).json({ message: err.message });
  }
};

export const getUserPosts = async (req, res) => {
  try {
    const { userId } = req.params;
    const post = await Post.find({ userId });
    res.status(200).json(post);
  } catch (err) {
    res.status(404).json({ message: err.message });
  }
};

/* UPDATE */
export const likePost = async (req, res) => {
  try {
    const { id } = req.params;
    const { userId } = req.body;
    const post = await Post.findById(id);
    const isLiked = post.likes.get(userId);

    if (isLiked) {
      post.likes.delete(userId);
    } else {
      post.likes.set(userId, true);
    }

    const updatedPost = await Post.findByIdAndUpdate(id, { likes: post.likes }, { new: true });

    res.status(200).json(updatedPost);
  } catch (err) {
    res.status(404).json({ message: err.message });
  }
};

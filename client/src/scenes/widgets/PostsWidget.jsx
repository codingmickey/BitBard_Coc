import axios from 'axios';
import { useEffect, useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { setPosts } from 'state';
import PostWidget from './PostWidget';
import NotFound from 'components/NotFound';

const PostsWidget = ({ userId, isProfile = false, activeForum }) => {
  // console.log(activeForum)
  const dispatch = useDispatch();
  const posts = useSelector((state) => state.posts);
  const token = useSelector((state) => state.token);
  // var forumData = [];
  // const getPosts = async () => {
  //   // const response = await fetch(`http://localhost:3001/posts/location/${activeForum}`, {
  //   //   method: "GET",
  //   //   headers: { Authorization: `Bearer ${token}` },
  //   // });
  //   forumData = await axios.get(`http://localhost:3001/posts/location/${activeForum}`)
  //   console.log(forumData.data)
  //   // const data = await response.json();
  //   // forumData = data;
  //   dispatch(setPosts({ posts: forumData.data }));
  // };

  // const getUserPosts = async () => {
  //   const response = await fetch(
  //     `http://localhost:3001/posts/${userId}/posts`,
  //     {
  //       method: "GET",
  //       headers: { Authorization: `Bearer ${token}` },
  //     }
  //   );
  //   const data = await response.json();
  //   dispatch(setPosts({ posts: data }));
  // };

  // useEffect(() => {
  //   // if (isProfile) {
  //   //   getUserPosts();
  //   // } else {
  //   //   getPosts();
  //   // }
  //   getPosts();
  //   // if(isProfile){
  //   //   getUserPosts();
  //   // }
  // }, [activeForum]); // eslint-disable-line react-hooks/exhaustive-deps

  const [forumData, setForumData] = useState([]);

  useEffect(() => {
    if (activeForum === '') return;
    const getPosts = async () => {
      const { data } = await axios.get(`http://localhost:3001/posts/location/${activeForum}`);
      setForumData(data);
      // console.log(forumData.data)
    };
    getPosts();
  }, [activeForum]);

  console.log(forumData);

  if (forumData.length === 0) {
    return (
      <div>
        <h1>{!activeForum ? (isProfile ? 'No Posts' : "Click a location to view it's posts") : 'No Posts'}</h1>
      </div>
    );
  } else {
    return (
      <>
        {forumData !== [] ? (
          forumData.map(
            ({
              _id,
              userId,
              firstName,
              lastName,
              description,
              location,
              picturePath,
              userPicturePath,
              likes,
              comments
            }) => (
              <PostWidget
                key={_id}
                postId={_id}
                postUserId={userId}
                name={`${firstName} ${lastName}`}
                description={description}
                location={location}
                picturePath={picturePath}
                userPicturePath={userPicturePath}
                likes={likes}
                comments={comments}
                isProfile={isProfile}
              />
            )
          )
        ) : (
          <NotFound />
        )}
      </>
    );
  }
};

export default PostsWidget;
